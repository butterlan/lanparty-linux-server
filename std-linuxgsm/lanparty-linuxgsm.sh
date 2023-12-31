#!/bin/bash

OLDDIR="`pwd`"
cd /root/scripts/lanparty
git pull --rebase >> /dev/null 2>&1
source /root/scripts/lanparty/common.inc
checkHostname
checkLockFile
checkBootstrapped
touch $LOGFILE
cd $GSM_PATH
chmod +x $GSM_PATH/scripts/*

#configure gameserver
GAMESERVER=""

echo "###"
echo "###"
echo "###"
echo "###"
echo
echo "### Standard setup for LinuxGSM"
echo "    Logfile: $LOGFILE"

# ATTENTION: Dependencies!!!
source $GSM_PATH/parts-linux/standard-linuxgsm-components.inc
source $GSM_PATH/parts-linux/standard-gameserver-environment.inc

###
echo
echo "### Finishing installation"
echo
echo
echo "The procedure has completed"
echo "You can now manage your server"
echo "more information on https://linuxgsm.com/lgsm/$GAMESERVER/"
echo

markAsDoneGSM

#eof
