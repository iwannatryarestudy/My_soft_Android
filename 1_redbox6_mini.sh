####!/bin/bash

#!/data/data/com.termux/files/usr/bin/sh

read -p "Введите 2 последних октета " var1;
adb connect 192.168.$var1:5555 & sleep 5;

for var2 in $(cat disable_list_packages_redbox6_mini.txt)
do
adb shell pm disable-user --user 0 $var2;
done
find  .My_soft_Android/apps/ -maxdepth 1 -type f -name "*.apk"   -exec adb install {} \;
if [ $? -eq 0 ]
then
echo Done
else
echo Fail
fi

adb disconnect 1>/dev/null;
