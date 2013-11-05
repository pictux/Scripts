#!/bin/sh
#title		: ccurl.sh (Custom CURL)
#description	: this script handles a curl command; 
#		  adds to the url (passed as ARG) a timestamp (specific for Emoncms.org); 
#		  if curl fails the script appends the url in a file
#author		: Mirco Piccin (www.xuni.it | www.pictux.org)
#date		: 2013-11
#version	: 0.2
#usage		: sh ccurl.sh "$URL"

CONNTIMEOUT=5
OUTFILE=/tmp/curl.out
NOCONNFILE=/tmp/noconnection.list

EPOCH=`date +%s`

if ! [ "${@}" ]; then
        exit 1
fi

if echo "$@" | egrep "time="; then
	URL="$@"
else
	URL="$@&time=$EPOCH"
fi

curl "$URL" --connect-timeout $CONNTIMEOUT

CURL_RC=$?

if [ $CURL_RC -eq 7 ] || [ $CURL_RC -eq 6 ]; then
	echo "$URL" >> $NOCONNFILE
	exit 1
fi

