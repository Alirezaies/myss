#!/bin/bash
#compress all screenshots automatically
#developed my Ali Reza & Muhammad Asif

#set -e

echo "Press enter key to continue...!";
read key;

id=$USER;

cd ~/Desktop/Myss
tar -zcvf myss.tar.gz ss

echo "Compression successful..!";
sleep 4;
exit;

