#!/bin/bash
source "/vagrant/scripts/common.sh"
function stopServices {
	echo "stop spark cluster"
	/usr/local/spark/sbin/stop-all.sh
}
stopServices
