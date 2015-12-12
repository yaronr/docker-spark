#!/bin/bash

SPARK_CLASS=""
type="$(tr [A-Z] [a-z] <<< "$1")"
SPARK_CONF_DIR="/usr/spark/conf/$type"

echo $type

if [[ $type  == "master" ]]; then
	SPARK_CLASS="org.apache.spark.deploy.master.Master"
elif [[ $type  == "worker" ]]; then
	SPARK_CLASS="org.apache.spark.deploy.worker.Worker"
else 
	echo "First parameter must be (master|worker)"
	exit -1
fi

#echo spark-class "$SPARK_CLASS ${@:2}"
/usr/spark/bin/spark-class "$SPARK_CLASS ${@:2}"
