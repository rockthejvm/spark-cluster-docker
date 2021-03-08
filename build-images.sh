# -- Software Stack Version

SPARK_VERSION="3.0.0"
HADOOP_VERSION="2.7"
JUPYTERLAB_VERSION="2.1.5"

# -- Building the Images

docker build \
  -f jupyter-cluster-base/Dockerfile \
  -t jupyter-cluster-base .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f jupyter-spark-base/Dockerfile \
  -t jupyter-spark-base .

docker build \
  -f jupyter-spark-master/Dockerfile \
  -t jupyter-spark-master .

docker build \
  -f jupyter-spark-worker/Dockerfile \
  -t jupyter-spark-worker .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f jupyterlab/Dockerfile \
  -t jupyterlab .
