#!/bin/bash
source "/vagrant/scripts/common.sh"
function runHiveServices {
	echo "running hive metastore"
    	nohup hive --service metastore < /dev/null > /usr/local/hive/logs/hive_metastore_`date +"%Y%m%d%H%M%S"`.log 2>&1 &

	echo "running hive server2"
    	nohup hive --service hiveserver2 < /dev/null > /usr/local/hive/logs/hive_server2_`date +"%Y%m%d%H%M%S"`.log 2>&1 &
}
runHiveServices
