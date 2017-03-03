#!/bin/bash

#Directories
DATASET_DIR=/vagrant/examples/clickstream/datasets/msnbc990928.seq
JAR_DIR=/vagrant/examples/clickstream/jar/clickstream-spark-0.0.1-SNAPSHOT.jar
HDFS_INPUT_DIR=clickstream-input
HDFS_OUT_DIR=clickstream-output_000

#Submit clickstream job on spark
hdfs dfs -mkdir $HDFS_INPUT_DIR
hdfs dfs -copyFromLocal $DATASET_DIR $HDFS_INPUT_DIR

spark-submit --class org.mahedi.clickstream.ClickStream --master spark://10.211.55.101:7077 /vagrant/examples/clickstream/jar/clickstream-spark-0.0.1-SNAPSHOT.jar hdfs://10.211.55.101/user/root/$HDFS_INPUT_DIR/msnbc990928.seq
