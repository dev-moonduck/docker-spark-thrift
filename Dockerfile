FROM openjdk:8u292-jre-slim

ARG SPARK_REPO="https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz"

WORKDIR /opt

RUN apt update && apt install -y wget procps && rm -rf /var/lib/apt/lists/* 

RUN wget $SPARK_REPO

RUN ls spark* | xargs tar zxf && find . -maxdepth 1 -mindepth 1 -type d | xargs -I {} mv {} spark && find . -maxdepth 1 -mindepth 1 -not -type d | xargs rm -f

ENV SPARK_HOME=/opt/spark

COPY hive-site.xml $SPARK_HOME/conf
COPY entrypoint.sh /

EXPOSE 10001

HEALTHCHECK 
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"] 
