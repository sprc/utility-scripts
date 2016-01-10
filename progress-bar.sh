#!/bin/bash
LABEL=$3
PERCENT=$(./math.sh "($100/$2)" 0)
PERCENT_Q=$(./math.sh $PERCENT/4 0)

echo -ne "\r"

if [ "LABEL " != " " ]; then
	echo -ne "$LABEL: "
fi

echo -ne "$PERCENT% "

for i in `seq 1 1 $(./math.sh 3-${#PERCENT})`
do
	echo -ne " "
done

echo -ne "["

for i in `seq 1 1 $PERCENT_Q`;
do
	echo -ne "="
done

echo -ne ">"

for i in `seq $PERCENT_Q 1 24`;
do
	echo -ne " "
done

echo -ne "]"
