# Big Data Environment Setup (vagrant-virtualbox)
This project aims for building scripts for being set up the environments of the big data analytics with the technologies including hadoop, yarn, hive, spark and so on.

# Install Vagrant and Virtual Box
This project uses vagrant and virtualbox for making the environment setup and configuration automated and portable which makes the project easily maintainable.

# Initialize vagrant and configure virtualbox 
This project chooses widely used linux platfrom CentOS. For finds the ContOS virtual box please check the listing here (http://www.vagrantbox.es/).

1) downlaod the virtual box in your workspace
	vagrant box add centos65 https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box
2) initialise vagrant
	vagrant init
3) start the VM	
	vagrant up

# write scripts for installing and configuring hadoop 
	(a) please visit the hadoop scripts
	(b) please visit the start-hadoop scripts
# CentOS commands (basics)
yum, cp, mv, rm, rmdir, ps, mkdir, cat, 
chmod, chown, find, kill, ssh, su, 
tail, grep
