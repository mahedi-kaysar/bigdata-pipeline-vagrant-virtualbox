#!/bin/bash

#Directories
DATASET_DIR=/vagrant/examples/wordcount/datasets/input.txt
JAR_DIR=/vagrant/examples/wordcount/jar/wordcount-mr-0.0.1.jar
HDFS_INPUT_DIR=wordcount-input
HDFS_OUT_DIR=wordcount-output_000

#Submit wordcount job on hadoop
hdfs dfs -mkdir $HDFS_INPUT_DIR
hdfs dfs -copyFromLocal $DATASET_DIR wordcount-input
hadoop jar $JAR_DIR com.example.wordcount_mr.WordCount $HDFS_INPUT_DIR/input.txt $HDFS_OUT_DIR
hdfs dfs -cat $HDFS_OUT_DIR/part*
