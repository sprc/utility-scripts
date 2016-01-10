#!/bin/bash
string=$1
f=$2
p="\$$3"
echo $string | awk -F"$f" "{print $p}"
