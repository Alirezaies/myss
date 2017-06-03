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
echo $folder;
id=$USER;

echo "Checking Scrot Installation";
set +e

if [ -f /etc/redhat-release]; then
    echo "Installing Scrot For RedHat: \n"

      if yum list installed scrot >/dev/null 2>&1; then
        echo "Scrot Is Already Installed, Skipping Installation."
      else
          sudo yum install scrot;
      fi

elif [ -f /etc/debian_version]; then
    if [ $(dpkg-query -W -f='${Status}' scrot 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
      echo "Installing Scrot For Debian/Ubuntu: \n";
      sudo apt-get install scrot;
    fi

else
    echo "Installing Scrot: \n";
    cd scrot;
    ./configure;
    make;
    su -c "make install";
    cd ../;




#start error detection
set -e

mkdir -p ~/Desktop/Myss;
mkdir -p ~/Desktop/Myss/scripts;
mkdir -p ~/Desktop/Myss/ss;
echo "Folder created on desktop for stroing screenshots";

sudo chmod 755 $folder/Myss.desktop;
sudo chmod 755 $folder/compress-myss.desktop;
sudo chmod 755 $folder/myss.sh;
sudo chmod 755 $folder/compress-myss.sh;

cp $folder/myss.sh ~/Desktop/Myss/scripts/myss.sh ;
cp $folder/compress-myss.sh ~/Desktop/Myss/scripts/compress-myss.sh;
cp $folder/Myss.desktop ~/Desktop/Myss/;
cp $folder/compress-myss.desktop ~/Desktop/Myss/;

echo Exec=gnome-terminal -e ~/Desktop/Myss/scripts/myss.sh >> ~/Desktop/Myss/Myss.desktop;
echo Exec=gnome-terminal -e ~/Desktop/Myss/scripts/compress-myss.sh >> ~/Desktop/Myss/compress-myss.desktop;

echo "Sucess!";
echo "Myss has been installed, to start taking screenhsots run the myss file from desktop.";

sleep 4;

#rm -rf ~/$folder/myss-master;

exit;
