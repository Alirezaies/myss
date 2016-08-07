#!/bin/bash

clear;
echo "**************************************************************************";
echo "*		Welcome To Myss Version 2.0.0 For Linux.                 *";
echo "*		Developed by: Sadegh Alirezaie & Muhammad Asif.	         *";
echo "*		This Installation May Require Your Permission.           *";
echo "**************************************************************************";

#Stop execution in case of error
set -e

#prompt user for location of installation folder
echo "Please specify name or path to the folder where myss-master is located: ";
read folder;

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
echo "Folder created on desktop for stroing screenshots";

sudo chmod 755 ~/$folder/myss-master/Linux/Myss.desktop;

sudo chmod 755 ~/$folder/myss-master/Linux/myss.sh;

cp ~/$folder/myss-master/Linux/myss.sh ~/myss.sh ;

cp ~/$folder/myss-master/Linux/Myss.desktop ~/Desktop/;

echo Exec=gnome-terminal -e /home/$id/myss.sh >> ~/Desktop/Myss.desktop;

echo Success!;
echo "Myss has been installed, to start taking screenhsots run the myss file from desktop.";

sleep 4;

#rm -rf ~/$folder/myss-master;

exit;
