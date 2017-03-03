#!/bin/bash
source "/vagrant/scripts/common.sh"
function startServices {
	echo "starting Spark history service"
	/usr/local/spark/sbin/start-history-server.sh
	echo "start spark cluster in standalone client mode"
	/usr/local/spark/sbin/start-master.sh
}
startServices
