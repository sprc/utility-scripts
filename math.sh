#!/bin/sh

if [ " $1$2" = " " ] || [ "$1" = "-h"  ] || [ "$1" = "--help" ]; then
	echo ""
        echo "Simple math helper."
	echo ""
        echo "Usage:"
	echo ""
	echo "\$ sh math.sh \"expression\" scale"
	echo ""
        echo "Example:"
	echo ""
        echo "\$ sh math.sh \"1 / 3\" 4"
        echo "0.3333"
	echo ""
	echo "Uses bc. Basically boils down to this:"
	echo ""
	echo "\$ echo \$(printf \"%.\"\$place\"f\" \$(echo \"scale=\$(echo \"\"\$place + 1\"\" | bc);\$expression\" | bc))"
	echo ""
	exit 0
fi

expression=$1
place=$2

if [ " " = " $place" ] ; then
	place=2
fi

#echo $expression
#echo $place

echo $(printf "%."$place"f" $(echo "scale=$(echo ""$place + 1"" | bc);$expression" | bc))
