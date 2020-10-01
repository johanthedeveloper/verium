#!/bin/bash

#setup config file
#/usr/libexec/verium/setupconfig.sh

#look config file
#source /root/verium/verium.conf

#startup verium
printf "Startup\n";
veriumd -daemon -conf=~/.verium/verium.conf
printf "Finished starting\n";

#sleep script
sleep infinity

printf "Shutdown\n";
