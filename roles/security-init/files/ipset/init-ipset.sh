#!/bin/bash
ipset -L blacklist >/dev/null 2>&1
if [ $? -ne 0 ]
then
 ipset -N blacklist hash:net;
fi

ipset -L china >/dev/null 2>&1
if [ $? -ne 0 ]
then
 ipset -N china hash:net;
fi

ipset -L soho >/dev/null 2>&1
if [ $? -ne 0 ]
then
 ipset -N soho hash:net;
fi

for i in $(cat /etc/blacklist.ipset ); do ipset -A blacklist $i; done
for i in $(cat /etc/cn.ipset ); do ipset -A china $i; done
for i in $(cat /etc/soho.ipset ); do ipset -A soho $i; done