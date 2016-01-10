#!/bin/bash

function getMemInfo()
{
	memInfo=$(cat /proc/meminfo | grep $1)
	memInfo=$(./piece.sh "$memInfo" ":" 2)
	memInfo=$(./replace.sh "$memInfo" " " "")
	memInfo=$(./replace.sh "$memInfo" "kB" "")
	echo "$memInfo"
}

BEGIN_DIRTY=$(getMemInfo "Dirty")

sync &

while [ "$DONE " = " " ];
do
	CURRENT_DIRTY=$(getMemInfo "Dirty")
	if [ $CURRENT_DIRTY -gt $BEGIN_DIRTY ]; then
		BEGIN_DIRTY=$CURRENT_DIRTY
	fi
	#echo $BEGIN_DIRTY $CURRENT_DIRTY
	PROGRESS=$(./math.sh $BEGIN_DIRTY-$CURRENT_DIRTY 0)
	#echo $PROGRESS
	echo ""
	./progress-bar.sh $PROGRESS $BEGIN_DIRTY "Syncing"
	sleep .3
	if [ $CURRENT_DIRTY -lt 256 ]; then
		DONE="1"
	fi
done
