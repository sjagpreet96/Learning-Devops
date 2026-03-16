#!/bin/bash

echo "===Sytem Information=="

hostname=$(hostname)
echo "Hostname: $hostname"

usr=$(whoami)
echo"User: $usr"

dic=$(pwd)
echo "Current Directory: $dic"

date=$(date +%y-%m-%d)
echo "Date: $date"

disk_use=$(df -h)
echo -e "Disk Usage \n $disk_use"

memory=$(free -h)
echo -e "Memory Usage: \n $memory"

up_time=$(uptime -p)
echo -e "Uptime: \n $up_time"
