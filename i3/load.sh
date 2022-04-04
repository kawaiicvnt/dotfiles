#! /bin/sh

uptime | awk -F'[a-z]:' '{ print $2}'

#while :
#do
#	date
#	sleep 1
#done
