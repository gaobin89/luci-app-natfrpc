#!/bin/sh

file="/etc/natfrpc/natfrpc"
downloadurl=$(uci get natfrpc.@natfrpc[0].downloadurl)
PATH="/usr/sbin:/usr/bin:/sbin:/bin"

while :
do
        ping -c 1 -W 1 -q www.baidu.com 1>/dev/null 2>&1
        if [ "$?" == "0" ]; then
                break
        fi
        ping -c 1 -W 1 -q 202.108.22.5 1>/dev/null 2>&1
        if [ "$?" == "0" ]; then
                break
        fi
        sleep 5
        ping -c 1 -W 1 -q www.google.com 1>/dev/null 2>&1
        if [ "$?" == "0" ]; then
                break
        fi
        ping -c 1 -W 1 -q 8.8.8.8 1>/dev/null 2>&1
        if [ "$?" == "0" ]; then
                break
        fi
        sleep 5
done

if [ ! -f "$file" ];then
   /etc/natfrpc/download.sh                                                                                                                                                                                                                              
fi 
cd /etc/natfrpc
/etc/natfrpc/natfrpc $*
