FROM openjdk:11-jdk

LABEL author="Alex Smith <alex.me.smith@gmail.com>"

RUN wget http://apache.mirror.anlx.net/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz
RUN tar -xzf spark-2.4.3-bin-hadoop2.7.tgz
RUN mv spark-2.4.3-bin-hadoop2.7 /spark
RUN rm spark-2.4.3-bin-hadoop2.7.tgz

ENV SPARK_NO_DAEMONIZE=true

CMD /spark/sbin/start-slave.sh $SPARK_MANAGER
