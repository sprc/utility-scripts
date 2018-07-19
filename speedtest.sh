#!/bin/bash
if [ "$1" = "" ]; then
	echo "No destination specified!"
else
	FILE="$1/test-zero.txt"

	touch "$FILE"

	if [ -f $FILE ]; then
		echo "File exists. Beginning test."
		dd if=/dev/zero of=$FILE conv=fdatasync bs=384k count=3k
		echo 3 | sudo tee /proc/sys/vm/drop_caches
		dd if=$FILE of=/dev/null bs=384k count=3k
		rm -f $FILE
	else
		echo "File $FILE does not exist."
	fi
fi
