#!/bin/bash
#Taking Screen Shot Every 1 Min
#Wrote By Sadegh Alirezaie For Those Who Like To Play On Linux Or Mac With All Love

now=$(date +"%Y-%m-%d-%H:%M:%S");
mkdir ~/Desktop/Myss/$now && cd "$_";
n=0;
while [ 1 = 1 ]; do
	n=$((n+1));
	time=$(date +"%T");
	scrot -d 5 '%Y-%m-%d-%H:%M:%S.jpg';
	echo "$n - Screenshot captured at $(date +'%T')";
done
