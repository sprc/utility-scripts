#!/bin/sh
INSTALLED=$(dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -c "ok installed")
INSTALL_IF_MISSING=$2
DEFAULT_YES=$3

echo "$INSTALL_IF_MISSING"

if [ "$INSTALLED " = "1 " ]; then
	echo "$1 is installed."
	exit 0
else
	echo "$1 is not installed."
	if [ "$INSTALL_IF_MISSING " = "1 " ]; then
		if [ "$DEFAULT_YES " = " " ]; then
			sudo apt-get install $1
		else
			sudo apt-get install -y $1
		fi
		INSTALLED=$(dpkg-query -W -f='${Status}' "$1" 2>/dev/null | grep -c "ok installed")
		if [ "$INSTALLED " = "1 " ]; then
			echo "$1 was installed successfully."
			exit 0
		else
			echo "Failed to install $1"
			exit 1
		fi
	else
		exit 1
	fi
fi
