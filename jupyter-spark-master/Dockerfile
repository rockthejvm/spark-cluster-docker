FROM jupyter-spark-base

# -- Runtime

ARG spark_master_web_ui=8080
ARG spark_ui=4040

#EXPOSE ${spark_master_web_ui} ${SPARK_MASTER_PORT}
#EXPOSE ${spark_ui} ${SPARK_UI_PORT}
EXPOSE 8080
EXPOSE 4040
EXPOSE 7077
CMD bin/spark-class org.apache.spark.deploy.master.Master >> logs/spark-master.out
