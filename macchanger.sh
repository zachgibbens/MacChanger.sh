#!/bin/bash
DEV=wlp1s0
FILE=/root/oui.txt
PREFIX=$(cat $FILE | grep base\ 16 | shuf -n 1|cut -d"(" -f1|cut -d" " -f1)
SUFFIX=$(openssl rand -hex 3)
MACADDR=$(echo $PREFIX$SUFFIX | sed -e 's/.\{2\}/&:/g;s/.$//')
ip link set dev $DEV down address $MACADDR

