#!/bin/bash
#Taking Screen Shot Every 1 Min
#Wrote By Sadegh Alirezaie & Muhammad Asif For Those Who Like To Play On Linux Or Mac With All Love

now=$(date +"%Y-%m-%d-%H:%M:%S");
echo "Screen Capture Started At $now";
echo "For Exit Press ' ctrl+c ' ";
echo "======== Log ========";
mkdir -p ~/Desktop/Myss/ss/$now && cd "$_";
touch logfile.log;
n=0;
while [ 1 = 1 ]; do
	n=$((n+1));
	time=$(date +"%T");
	scrot -d 60 '%Y-%m-%d-%H:%M:%S.jpg';
	echo "========= $now ========" >> logfile.log;
	ps -ef >> logfile.log;
	echo "$n - Screenshot captured at $(date +'%T')";
done
