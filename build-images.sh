#!/bin/bash

docker build -t spark-manager:latest manager
docker build -t spark-worker:latest worker