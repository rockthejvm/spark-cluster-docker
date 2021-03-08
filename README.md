# Spark Cluster Docker

This repository contains the Docker files to create a Spark cluster with a JupyterLab interface. This cluster is used as a teaching tool for the Rock the JVM online courses and live training sessions on Apache Spark:

- [Spark Essentials](https://rockthejvm.com/p/spark-essentials)
- [Spark Optimization](https://rockthejvm.com/p/spark-optimization)
- [Spark Performance Tuning](https://rockthejvm.com/p/spark-performance-tuning)
- plus corporate training sessions on the above

The cluster is set up for Spark 3.0.0.

## How to Install

As prerequisite, you need a Docker installation for your OS. This repository has been tested on Linux and macOS, but with a Bash interpreter it can also work on Windows as it is.

Then, you need to build the Docker images. This repository contains image definitions for

- a JupyterLab interface
- a Spark master node
- a Spark worker node (of which we'll instantiate two, each carrying 2 vCores and 1GB memory)

To build the images, run the build script from the root directory:

```
./build-images.sh
```

After the command is finished, still in the root directory, run

```
docker-compose up
```

That's it!

## Important Links

- The main JupyterLab interface: http://localhost:8888
- The Spark cluster UI (master node): http://localhost:8080
- The Spark cluster UI (worker node): http://localhost:8081 and http://localhost:8082
- The Spark application web UI (active during a Spark Shell): http://localhost:4040

## Other Tools

To kill the cluster, hit Ctrl-C in the terminal running it, or run this command from another terminal in the root directory:

```
docker-compose kill
```

To remove the containers altogether, run in the root directory

```
docker-compose rm
```

To start a (Scala) Spark Shell, run

```
./start-spark-shell.sh
```

To start a PySpark shell, run

```
./start-pyspark.sh
```

To start a Spark SQL shell, run

```
./start-spark-sql.sh
```

## How to upload data to the Spark cluster

You have two options:

1. Use the JupyterLab upload interface while it's active.
2. Copy your data to `shared-workspace` &mdash; the directory is auto-mounted on all the containers.

## How to port your notebooks to another Jupyter instance

Similar options:

1. Use the JupyterLab interface to download your notebooks as `.ipynb` files.
2. Copy the `.ipynb` files directly from the `shared-workspace` directory: everything you save will be immediately visible there.
