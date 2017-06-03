#!/bin/bash

clear;
echo "**************************************************************************";
echo "*		Welcome To Myss Version 3.1.0 For Linux.                 *";
echo "*		Developed by: Sadegh Alirezaie & Muhammad Asif.	         *";
echo "*		This Installation May Require Your Permission.           *";
echo "**************************************************************************";

#Stop execution in case of error
set -e

folder=$(pwd);

id=$USER;

#stop error detection
echo "Checking if Scrot is installed..!!";
set +e
if [ $(dpkg-query -W -f='${Status}' scrot 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  echo "Installing scrot";
  sudo apt-get install scrot;
fi

#start error detection
set -e

mkdir ~/Desktop/Myss;
mkdir ~/Desktop/Myss/scripts;
mkdir ~/Desktop/Myss/ss;
echo "Folder created on desktop for stroing screenshots";

sudo chmod 755 ~/$folder/myss-master/Linux/Myss.desktop;
sudo chmod 755 ~/$folder/myss-master/Linux/compress-myss.desktop;
sudo chmod 755 ~/$folder/myss-master/Linux/myss.sh;
sudo chmod 755 ~/$folder/myss-master/Linux/compress-myss.sh

cp ~/$folder/myss-master/Linux/myss.sh ~/Desktop/Myss/scripts/myss.sh ;
cp ~/$folder/myss-master/Linux/compress-myss.sh ~/Desktop/Myss/scripts/compress-myss.sh;
cp ~/$folder/myss-master/Linux/Myss.desktop ~/Desktop/Myss/;
cp ~/$folder/myss-master/Linux/compress-myss.desktop ~/Desktop/Myss/;

echo Exec=gnome-terminal -e /home/$id/Desktop/Myss/scripts/myss.sh >> ~/Desktop/Myss/Myss.desktop;
echo Exec=gnome-terminal -e /home/$id/Desktop/Myss/scripts/compress-myss.sh >> ~/Desktop/Myss/compress-myss.desktop;

echo "Sucess!";
echo "Myss has been installed, to start taking screenhsots run the myss file from desktop.";

sleep 4;

#rm -rf ~/$folder/myss-master;

exit;
