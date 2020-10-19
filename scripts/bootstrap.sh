#!/bin/bash

if [ ! -d "/root/.verium/" ]; then
    echo "/root/.verium/ not exist"

    printf "\e[32mCreating directory\e[0m\n"
	mkdir -p /root/.verium/

    printf "\e[32mGetting bootstrap.zip\e[0m\n"
	wget https://pivericoin.blob.core.windows.net/piverium/bootstrap.zip -O /root/.verium/bootstrap.zip
	
    printf "\e[32mUnzipping bootstrap.zip\e[0m\n"
	unzip -q /root/.verium/bootstrap.zip -d /root/.verium/

    printf "\e[32mCopy content bootstrap\e[0m\n"
	mv /root/.verium/bootstrap/* /root/.verium/
	
	printf "\e[32mCopy directory bootstrap\e[0m\n"
	rm /root/.verium/bootstrap/ -r
	
	printf "\e[32mCopy file bootstrap.zip\e[0m\n"
	rm /root/.verium/bootstrap.zip 
fi
