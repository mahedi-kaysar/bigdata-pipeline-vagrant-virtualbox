#!/bin/bash

#Directories
#DATASET_DIR=/vagrant/examples/stackexchange/datasets/bull.csv

DATASET_DIR=/vagrant/examples/stackexchange/datasets/50000Posts.csv
JAR_DIR=/vagrant/examples/stackexchange/jar/tfjar/original-stack-exchange-analyser-0.0.1-SNAPSHOT.jar
HDFS_INPUT_DIR=stackexchange-input
HDFS_OUT_DIR=stackexchange-output

#Submit wordcount job on hadoop
hdfs dfs -rmr $HDFS_INPUT_DIR
#hdfs dfs -rmr $HDFS_OUT_DIR
hdfs dfs -mkdir $HDFS_INPUT_DIR
#hdfs dfs -mkdir $HDFS_OUT_DIR
hdfs dfs -copyFromLocal $DATASET_DIR $HDFS_INPUT_DIR
hadoop jar $JAR_DIR org.mahedi.bigdata.mapreduce.StackExchangeTFIDF $HDFS_INPUT_DIR/50000Posts.csv $HDFS_OUT_DIR
hdfs dfs -cat $HDFS_OUT_DIR/part*
hdfs dfs -rmr $HDFS_INPUT_DIR
hdfs dfs -copyToLocal $HDFS_OUT_DIR/part* /vagrant/examples/stackexchange/datasets/Top10WordsOf50000Posts.csv
hdfs dfs -rmr $HDFS_OUT_DIR
#hdfs dfs -mkdir $HDFS_INPUT_DIR
#hdfs dfs -copyFromLocal /vagrant/examples/stackexchange/datasets/50000posts-hive.csv $HDFS_INPUT_DIR
