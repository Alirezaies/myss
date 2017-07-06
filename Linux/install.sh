#!/bin/bash

clear;
echo "**********************************************************************";
echo "* Welcome To Myss Version 3.2.1-beta For Linux.                      *";
echo "*	Developed by: Sadegh Alirezaie & Muhammad Asif.	             *";
echo "*	This Installation May Require Your Permission.               *";
echo "* This Installation Will Remove Th Myss Folder On Your Desktop       *";
echo "**********************************************************************";

rm -rf ~/Desktop/Myss
#Stop execution in case of error
set -e

folder=$(pwd);
connection=$(ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo ok || echo error);

if [[ connection="error" ]]; then
    echo "No Internet Connectivity, Please Try Again Later.";
    exit;
fi

echo "Checking Scrot Installation";
set +e

if [[ -f /etc/redhat-release ]]; then
    echo "Installing Scrot For RedHat: \n"

      if yum list installed scrot >/dev/null 2>&1; then
        echo "Scrot Is Already Installed, Skipping Installation."
      else
          sudo yum install scrot;
      fi

elif [[ -f /etc/debian_version ]]; then
    if [ $(dpkg-query -W -f='${Status}' scrot 2>/dev/null | grep -c "ok installed") -eq 0 ];
    then
      echo "Installing Scrot For Debian/Ubuntu: \n";
      sudo apt-get install scrot;
    fi

elif [[ -f /etc/arch-release]]; then
    if [ pacman -Qi scrot | grep -c "error" -eq 0 ];
    then
        echo "Installing Scrot On Arch Release\n";
        sudo pacman -Syyu;
        sudo pacman -S scrot;
else
    echo "Sorry, Your System Is Not Supported, Please Open An Issue On https://github.com/AlirezaieS/MySS";
fi



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

cp -f $folder/myss.sh ~/Desktop/Myss/scripts/myss.sh ;
cp -f $folder/compress-myss.sh ~/Desktop/Myss/scripts/compress-myss.sh;
cp -f $folder/Myss.desktop ~/Desktop/Myss/;
cp -f $folder/compress-myss.desktop ~/Desktop/Myss/;

echo "Exec=gnome-terminal -e /home/$USER/Desktop/Myss/scripts/myss.sh" >> ~/Desktop/Myss/Myss.desktop;
echo "Exec=gnome-terminal -e /home/$USER/Desktop/Myss/scripts/compress-myss.sh" >> ~/Desktop/Myss/compress-myss.desktop;

echo "Sucess!";
echo "Myss has been installed, to start taking screenhsots run the myss file from desktop.";

sleep 4;

exit;
