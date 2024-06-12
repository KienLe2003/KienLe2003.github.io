# Use the official OpenJDK base image with Java
FROM openjdk:8-jdk

# Set environment variables for Spark
ENV SPARK_VERSION=3.0.1
ENV HADOOP_VERSION=3.2
ENV SPARK_HOME=/opt/spark

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget python3 python3-pip sqlite3


# Install Spark
RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -P /tmp && \
    tar xvf /tmp/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C /opt && \
    mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /opt/spark && \
    rm /tmp/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Install PySpark
RUN pip3 install pyspark pandas

# Add Spark to PATH
ENV PATH=$PATH:/opt/spark/bin

# Set the working directory

COPY  create.py ./create.py
COPY  ./Sales.csv ./Sales.csv





