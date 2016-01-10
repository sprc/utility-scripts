#!/bin/bash
echo $1 | sed -e "s/$2/$3/g"
