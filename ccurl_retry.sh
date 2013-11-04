#!/bin/sh
#title          : ccurl_retry.sh (Custom CURL retry routine)
#description    : this script runs a custom CURL command on an url list; 
#author         : Mirco Piccin (www.xuni.it | www.pictux.org)
#date           : 2013-11
#version        : 0.1
#usage          : sh ccurl_retry.sh

NOCONNFILE=/tmp/noconnection.list
NEW_NOCONNFILE=/tmp/noconnection_tmp.list
CURL=`pwd`/./ccurl.sh

mv $NOCONNFILE $NEW_NOCONNFILE

while read line; do
       	$CURL $line
done <"$NEW_NOCONNFILE"

rm -f $NEW_NOCONNFILE
