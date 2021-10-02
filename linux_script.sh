#!/bin/bash
# Purpose: Automating Nexus 5 Repartitioning
# Author: Nastya Grifon <neckronus@yandex.ru>
# Last updated on : 25-Sept-2021
# -----------------------------------------------

linux_adb_link=https://dl.google.com/android/repository/platform-tools-latest-linux.zip
platform_tools_link=https://developer.android.com/studio/releases/platform-tools

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
#echo -e"I ${RED}love${NC} Stack Overflow"

# Log stderr to linux.log
exec 2>./logs/linux.log

# Continue if adb is installed and download if it's not
if ! command -v adb &>/dev/null; then
    if test -f "./platform-tools/adb" && test -f "./platform-tools/fastboot"; then
        echo -e "${GREEN}Downloaded adb found${NC}"
        export adb='./platform-tools/adb'
        export fastboot='./platform-tools/fastboot'
    else
        echo -e "${RED}Could not find adb${NC}"
        echo -e -n "Do you want to download adb?"
        read answer_req
        if [ "$answer_req" != "${answer_req#[Yy]}" ]; then
            wget -O platform_tools.zip $linux_adb_link >&2
            echo -e "${GREEN}Download complete. Extracting...${NC}"
            bsdtar -x -f platform_tools.zip
            export adb='./platform-tools/adb'
            export fastboot='./platform-tools/fastboot'
            echo -e "${GREEN}Successfully installed adb${NC}"
            rm platform_tools.zip
        else
            echo -e "${RED}The script won't work without Android Debug Bridge"
            echo -e "You can download it manually at $platform_tools_link ${NC}"
            exit
        fi
    fi
fi

adb devices
adb root
adb shell
