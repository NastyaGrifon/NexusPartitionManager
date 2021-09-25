#!/bin/bash
# Purpose: Automating Nexus 5 Repartitioning
# Author: Nastya Grifon <neckronus@yandex.ru>
# Last updated on : 25-Sept-2021
# -----------------------------------------------

linux_adb_link=https://dl.google.com/android/repository/platform-tools-latest-linux.zip
platform_tools_link=https://developer.android.com/studio/releases/platform-tools

#continue if adb is installed and download if it's not
if ! command -v adb &> /dev/null ;then
    if test -f "./platform-tools/adb" && test -f "./platform-tools/fastboot"
    then 
        echo "Downloaded adb found"
        export adb='./platform-tools/adb'
        export fastboot='./platform-tools/fastboot'
    else
        echo "Could not find adb"
        echo -n "Do you want to download adb?"
        read answer_req
        if [ "$answer_req" != "${answer_req#[Yy]}" ] ;then
            wget -O platform_tools.zip $linux_adb_link &> /dev/null
            echo "Download complete. Extracting..."
            bsdtar -x -f platform_tools.zip
            export adb='./platform-tools/adb'
            export fastboot='./platform-tools/fastboot'
            echo "Successfully installed adb"
            rm platform_tools.zip
        else
            echo "The script won't work without Android Debug Bridge"
            echo "You can download it manually at $platform_tools_link"
            exit
        fi
    fi
fi

adb devices
adb root &> /dev/null
adb shell &> /dev/null