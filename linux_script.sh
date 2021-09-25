#!/bin/bash
# Purpose: Automating Nexus 5 Repartitioning
# Author: Nastya Grifon <neckronus@yandex.ru>
# Last updated on : 25-Sept-2021
# -----------------------------------------------

#check if adb is installed

if ! command -v adb &> /dev/null
then
    echo "adb could not be found"
    
    exit
fi

adb devices
adb root
adb shell
