#! /bin/bash

docker run --rm -it -v `pwd`/app:/app -v `pwd`/data:/data \
  --network sparkdocker_spark-network -w /app \
  spark-worker /bin/bash