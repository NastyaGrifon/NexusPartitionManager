#!/bin/bash
# Purpose: Automating Nexus 5 Repartitioning
# Author: Nastya Grifon <neckronus@yandex.ru>
# Last updated on : 25-Sept-2021
# -----------------------------------------------

linux_adb_link=https://dl.google.com/android/repository/platform-tools-latest-linux.zip
platform_tools_link=https://developer.android.com/studio/releases/platform-tools

#check if adb is installed
if ! command -v asssdb &> /dev/null
then
    echo "Could not find adb"
    echo -n "Do you want to download adb?"
    read answer_req
    if [ "$answer_req" != "${answer_req#[Yy]}" ] ;then
        wget -O platform_tools.zip $linux_adb_link
        else
        echo "The script won't work without Android Debug Bridge"
        echo "You can download it manually at $platform_tools_link"
        exit
    fi
fi

#adb devices
#adb root &> /dev/null
#adb shell &> /dev/null
