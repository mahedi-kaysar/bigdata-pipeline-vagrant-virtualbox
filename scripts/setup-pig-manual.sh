#!/bin/bash

source "/vagrant/scripts/common.sh"

function installSoftware {
	yum -y install wget
}

function downloadAndInstallPig {
	wget http://mirror.ox.ac.uk/sites/rsync.apache.org/pig/pig-0.15.0/pig-0.15.0.tar.gz
	tar -xzf pig-0.15.0.tar.gz -C /usr/local
	ln -s /usr/local/pig-0.15.0 /usr/local/pig
}

function installLocalPig {
	echo "install Pig from local file"
	FILE=/home/vagrant/
	tar -xzf $FILE -C /usr/local
}

function installRemotePig {
	
	echo "install Pig from remote file"
	curl -sS -o /vagrant/resources/$PIG_ARCHIVE -O -L $PIG_MIRROR_DOWNLOAD
	tar -xzf /vagrant/resources/$PIG_ARCHIVE -C /usr/local
}

function installPig {
	if resourceExists $PIG_ARCHIVE; then
		installLocalPig
	else
		installRemotePig
	fi
	ln -s /usr/local/$PIG_VERSION /usr/local/pig
}

function setupPig {
	echo "setup Pig"
	cp -f $PIG_RES_DIR/* /usr/local/pig/conf
	hdfs dfs -chown vagrant /user/pig
}

function setupEnvVars {
	echo "creating Pig environment variables"
	echo "export PATH=$PATH:/usr/local/pig/bin" >> /etc/profile
	source /etc/profile
}

echo "setup Pig"
installSoftware
downloadAndInstallPig
#installPig
#setupPig
setupEnvVars

echo "pig setup complete"
