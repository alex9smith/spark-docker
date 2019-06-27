FROM openjdk:8-alpine

RUN apk --update add wget tar bash
RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN tar -xzf spark-2.4.3-bin-hadoop2.7.tgz
RUN mv spark-2.4.3-bin-hadoop2.7 /spark
RUN rm spark-2.4.3-bin-hadoop2.7.tgz

ENV SPARK_LOCAL_IP localhost
ENV SPARK_MASTER_HOSTNAME spark-master
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEB_UI 8080
ENV SPARK_WORKER_WEBUI_PORT 8081
ENV SPARK_MASTER spark://${SPARK_MASTER_HOSTNAME}:${SPARK_MASTER_PORT}

COPY start-master.sh /start-master.sh
COPY start-worker.sh /start-worker.sh