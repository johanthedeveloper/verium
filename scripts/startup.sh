#!/bin/bash

#setup bootstrap
printf "Checking bootstrap\n";
/usr/libexec/verium/bootstrap.sh

#look config file
#source /root/verium/verium.conf

#startup verium
printf "Startup\n";
veriumd -daemon -conf=~/.verium/verium.conf
printf "Finished starting\n";

#sleep script
sleep infinity

printf "Shutdown\n";
