#!/bin/bash

/opt/spark/sbin/start-thriftserver.sh

exec "$@"
