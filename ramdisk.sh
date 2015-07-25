#!/bin/bash
if [ "$1" = "" ]; then
	echo "Directory must be specified to mount the ramdisk in!"
else
	dir=$1
	user=$(whoami)
	sudo mkdir $dir
	sudo mount -t ramfs -o size=8g ext4 $dir
	sudo chown $user:$user $dir
fi
