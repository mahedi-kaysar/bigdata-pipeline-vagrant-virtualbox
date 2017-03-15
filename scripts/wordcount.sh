#!/bin/bash

#Directories
#DATASET_DIR=/vagrant/examples/wordcount/datasets/input.txt
DATASET_DIR=/vagrant/examples/wordcount/datasets/stack-exchange-dataset.csv
JAR_DIR=/vagrant/examples/wordcount/jar/original-wordcount-mr-0.0.1-SNAPSHOT.jar
HDFS_INPUT_DIR=wordcount-input
HDFS_OUT_DIR=wordcount-output

#Submit wordcount job on hadoop
hdfs dfs -rmr $HDFS_INPUT_DIR
hdfs dfs -rmr $HDFS_OUT_DIR
hdfs dfs -mkdir $HDFS_INPUT_DIR
hdfs dfs -copyFromLocal $DATASET_DIR $HDFS_INPUT_DIR
hadoop jar $JAR_DIR com.example.wordcount_mr.WordCount $HDFS_INPUT_DIR/stack-exchange-dataset.csv $HDFS_OUT_DIR
hdfs dfs -cat $HDFS_OUT_DIR/part*