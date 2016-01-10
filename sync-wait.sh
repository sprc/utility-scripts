#!/bin/bash

function getMemInfo()
{
	memInfo=$(cat /proc/meminfo | grep $1)
	memInfo=$(./piece.sh "$memInfo" ":" 2)
	memInfo=$(./replace.sh "$memInfo" " " "")
	memInfo=$(./replace.sh "$memInfo" "kB" "")
	if [ "$memInfo " = " " ]; then
		memInfo=0
	fi
	echo "$memInfo"
}

BEGIN_DIRTY=$(getMemInfo "Dirty:")
BEGIN_WB=$(getMemInfo "Writeback:")
BEGIN=$(./math.sh $BEGIN_DIRTY+$BEGIN_WB 0)

echo ""

sync &

while [ "$DONE " = " " ];
do
	CURRENT_DIRTY=$(getMemInfo "Dirty:")
	CURRENT_WB=$(getMemInfo "Writeback:")
	CURRENT=$(./math.sh $CURRENT_DIRTY+$CURRENT_WB 0)

	if [ "$BEGIN " = "0 " ]; then
		BEGIN=1
	fi

	if [ $CURRENT -gt $BEGIN ]; then
		BEGIN=$CURRENT
	fi
	PROGRESS=$(./math.sh $BEGIN-$CURRENT 0)

	if [ $CURRENT -lt 256 ]; then
		DONE="1"
		./progress-bar.sh $CURRENT $CURRENT "Syncing to disk"
	else
		./progress-bar.sh $PROGRESS $BEGIN "Syncing to disk"
		sleep .5
	fi
done

echo ""
