#!/bin/bash

echo "Welcome To Myss Version 2.0.0 For Linux.";
echo "This Installation May Require Your Permission.";

id=$USER;

mkdir ~/Desktop/Myss;

sudo chmod 755 ~/Downloads/myss-master/Linux/Myss.desktop;

sudo chmod 755 ~/Downloads/myss-master/Linux/myss.sh;

mv ~/Downloads/myss-master/Linux/myss.sh ~/myss.sh ;

mv ~/Downloads/myss-master/Linux/Myss.desktop ~/Desktop/;

echo Exec=gnome-terminal -e /home/$id/myss.sh >> ~/Desktop/Myss.desktop

echo Success!;

sleep 4;

rm -rf ~/Downloads/myss-master;

exit;
