FROM openjdk:8-alpine

LABEL author="Alex Smith <alex.me.smith@gmail.com>"

RUN apk add --no-cache --update \
    tar \
    bash \
    wget \
    python3 \
    gcc \
    g++ \
    gfortran \
    py-numpy \
    python3-dev

RUN pip3 install numpy pyspark

RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN tar -xzf spark-2.4.3-bin-hadoop2.7.tgz
RUN mv spark-2.4.3-bin-hadoop2.7 /spark
RUN rm spark-2.4.3-bin-hadoop2.7.tgz

ENV PYSPARK_PYTHON python3
ENV SPARK_NO_DAEMONIZE=true

CMD [ "/spark/sbin/start-master.sh" ]
