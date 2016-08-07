#!/bin/bash
#Taking Screen Shot Every 1 Min
#Wrote By Sadegh Alirezaie For Those Who Like To Play On Linux Or Mac With All Love

now=$(date +"%Y-%m-%d-%H:%M:%S");
startTime=$(date +"%H:%M:%S");
mkdir ~/Desktop/Myss/$now && cd "$_";
touch sys.log;
n=0;
echo "Welcome To Myss Version 3.0.0, Screen Capture Started At $startTime"
echo " For Exit Press 'ctrl+c'";
echo "...:::: Capture Log ::::...";
while [ 1 = 1 ]; do
	n=$((n+1));
	time=$(date +"%T");
	scrot -d 3 '%Y-%m-%d-%H:%M:%S.jpg';
	echo "$n - Screenshot captured at $(date +'%T')";
	tail /var/log/syslog >> sys.log;
	echo "======== Break At $startTime ========" >> sys.log;
done
