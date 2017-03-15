#!/bin/bash
source "/vagrant/scripts/common.sh"

function installLocalPig {
	echo "install Pig from local file"
	FILE=/vagrant/resources/$PIG_ARCHIVE
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
	cp -f $PIG_RES_DIR/pig.sh /etc/profile.d/pig.sh
	. /etc/profile.d/pig.sh
}

echo "setup Pig"

installPig
setupPig
setupEnvVars

echo "pig setup complete"
