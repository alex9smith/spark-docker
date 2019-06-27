# Spark Docker
Dockerfiles to run a local dev spark cluster.

## Launching the cluster
Build the manager and worker images.
```
./build-images.sh
```
Launch the cluster through `docker-compose`.
```
docker-compose up
```
By default it has 1 master and one worker node, if you want more workers pass the `--scale` argument to `docker-compose`.
```
docker-compose up --scale spark-worker=3
```

## Submitting a job
All containers mount the `app` and `data` directories in the current working directory to `/app` and `/data` respectively. Put your compiled jar or .py file in the local `app` directory and any input data in `data`.

This removes the need to copy jars to each container indiviually. 

Jobs are submitted to the cluster using another container acting as the Spark driver. `start-runner.sh` will open an interactive bash session in a new container.
```
./start-runner.sh
```
Then submit the job to the cluster, changing the class and paths as necessary.
```
/spark/bin/spark-submit --master spark://manager:7077 --class \
    org.apache.spark.examples.SparkPi \
    /spark/examples/jars/spark-examples_2.11-2.4.3.jar 5
```

### PySpark
A PySpark job can be run in the same way using `spark-submit`.
```
/spark/bin/spark-submit --master spark://manager:7077 \
    examples/pyspark-example.py
```
## Monitoring
The Spark manager Web UI is available at [http://localhost:8080/](http://localhost:8080/) where you can see the status of the cluster and any submitted jobs.