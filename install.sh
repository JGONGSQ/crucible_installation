#! /bin/bash

$APP_USER = "atlcrucible"
$APP_GROUP = "ndiaatlassian"
$APP_INSTALL_PATH = "/opt/atlassian/crucible"
$APP_DATA_DIR = "/data/atlcrucible"
$JAVA_HOME = "/usr/lib/jvm/jre-1.8.0-openjdk"
$ENV_PATH = "/etc/environment"


# in some server, you might need to download the wget, unzip, java as well,
# `yum install wget`
# `yum install unzip`
# `yum install java-1.8.0-openjdk`
# `yum install httpd` # this may not be needed
# if not finding the url base, do `dhclient`

# make sure the java_home is defined in the linux env
echo JAVA_HOME=$JAVA_HOME >> $ENV_PATH
echo FISHEYE_INST=$APP_DATA_DIR >> $ENV_PATH

sudo groupadd $APP_GROUP
sudo useradd -g $APP_GROUP $APP_USER

# make the install and data directory with a path
mkdir -p $APP_INSTALL_PATH
mkdir -p $APP_DATA_DIR

# donwload the crucible
wget https://www.atlassian.com/software/crucible/downloads/binary/crucible-4.6.1.zip

# unzip the file to directory
unzip crucible-4.6.1.zip -d $APP_INSTALL_PATH

# change the ownership of the install folder
chown --recursive $APP_USER:$APP_GROUP $APP_INSTALL_PATH
chown --recursive $APP_USER:$APP_GROUP $APP_DATA_DIR

# cp the config.xml to the data dir
cp $APP_INSTALL_PATH/config.xml $APP_DATA_DIR

# after these few things need to check
# first make sure the 8060 port is open
# e.g.
# `firewall-cmd --list-port`
# if not need to open the 8060 port by:
# `firewall-cmd --permanent --add-service=http`
# `firewall-cmd --permanent --add-port=8085/tcp`
# `firewall-cmd --reload`