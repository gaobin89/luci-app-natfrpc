#!/bin/sh

file="/etc/natfrpc/natfrpc"
downloadurl=$(uci get natfrpc.@natfrpc[0].downloadurl)
PATH="/usr/sbin:/usr/bin:/sbin:/bin"

rm -rf $file                                                                                                                                                                                                                            
wget --tries 2 --connect-timeout 20 $downloadurl -O $file && \chmod a+wx $file                                                                                                                                                                                                                              
/etc/init.d/natfrpc restart
