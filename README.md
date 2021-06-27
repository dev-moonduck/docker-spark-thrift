# Spark standalone thrift server
This is standalone spark thrift server on local for test spark JDBC/Thrift client

# Why you need this?
You may need to test your Spark JDBC/Thrift client application. In my case, I needed to test Python SLA script which load data through [Impyla](https://github.com/cloudera/impyla).

# How to build image with different spark version?
It uses spark3.1.2/hadoop3.2 prebuilt version of spark. but you can pass Spark download page(maybe Apache mirror or your own repository) with `SPARK_REPO` argument when you build docker image.
For example, You can build official spark2.4.8/hadoop2.7 from Apache spark repository
```bash
$ docker build . -t spark2-thrift --build-arg SPARK_REPO=https://downloads.apache.org/spark/spark-2.4.8/spark-2.4.8-bin-hadoop2.7.tgz
```

# How to customize Spark thrift server configuration?
You can mount your config to `/opt/spark/conf/` in container.
By default, It sets
- port 10001 is used for Http port
- NOSASL auth mechanism
