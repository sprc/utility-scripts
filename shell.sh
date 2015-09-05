#!/bin/sh

set -e

# Uncomment to require root.
#if [ ! `id -u` -eq 0 ]; then
#        echo "Must be run as root."
#        exit 1
#fi

usage() {
	echo "Usage:"
	echo "sh shell.sh -a abra -c cadabra some more params of all shapes and sizes"
	exit 0
}

if [ $# -eq 0 ]; then
	usage
fi

# Initialize our flags and params
#set -- `getopt -n$0 -a -s sh --longoptions "help abra: cadabra: " "ha:c:" "$@"`

# $# is the number of arguments
while getopts "::::a::::" arg
do
	echo "go"
	echo "$arg $OPTARG"

	case "$arg" in
		a)
			abra="$OPTARG"
		;;
		c)
			cadabra="$OPTARG"
		;;
		h)
			usage
		;;
		\?)
			usage
		;;
		*)
			break
		;;
	esac
	shift
done

echo "-a="$abra
echo "-c="$cadabra
echo "Now we have our params: "
exit 0
echo 1:$1
echo 2:$2
echo 3:$3
echo 4:$4
echo 5:$5
echo 6:$6
echo 7:$7
echo 8:$8
echo 9:$9

# Uncomment if you need something to execute upon exit.
#cleanup() {
#	echo "Exit code: " $?
#	echo "Bye now."
#	exit 0;
#}
#trap 'cleanup' EXIT

# Actual script content goes here:
echo "$abra $abra $cadabra, I'm gonna spit out paramas"

params="'$1 $2 $3 $4 $5 $6 $7 $8 $9 $10 $11 $12 $13 $14 $15'" 
params=$(echo $params | sed "s/''//g" | sed "s/' '/|/g")

param1=$(echo $params | cut -d\| -f1)
param2=$(echo $params | cut -d\| -f2)
param3=$(echo $params | cut -d\| -f3)
param4=$(echo $params | cut -d\| -f4)
param5=$(echo $params | cut -d\| -f5)
param6=$(echo $params | cut -d\| -f6)
param7=$(echo $params | cut -d\| -f7)
param8=$(echo $params | cut -d\| -f8)
param9=$(echo $params | cut -d\| -f9)
param10=$(echo $params | cut -d\| -f10)
param11=$(echo $params | cut -d\| -f11)
param12=$(echo $params | cut -d\| -f12)
param13=$(echo $params | cut -d\| -f13)
param14=$(echo $params | cut -d\| -f14)
param15=$(echo $params | cut -d\| -f15)

echo $param1
echo $param2
echo $param3
echo $param4
echo $param5
echo $param6
echo $param7
echo $param8
echo $param9
echo $param10
echo $param11
echo $param12
echo $param13
echo $param14
echo $param15
