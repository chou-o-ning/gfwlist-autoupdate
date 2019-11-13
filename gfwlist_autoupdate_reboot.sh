#!/bin/sh

# Name:        gfwlist_autoupdate.sh
# Desription:  A script is executed from a crontab entry every day to update dnsmasq rules.
#              A script is executed from /etc/rc.local to update dnsmasq rules when router reboot.
# Version:     2019.11.13
# Author:      chou.o.ning@gmail.com
# Website:     https://github.com/chou-o-ning/gfwlist-autoupdate

# wget output file
FILE1=/root/dnsmasq_gfwlist_ipset_org.conf
FILE2=/root/dnsmasq_gfwlist_ipset_add_by_ning.conf
FILE3=/root/dnsmasq_gfwlist_ipset.conf
FILE4=/etc/dnsmasq_gfwlist_ipset.conf

# wget log file
LOGFILE=/root/wget.log

# wget download url
URL1=https://cokebar.github.io/gfwlist2dnsmasq/dnsmasq_gfwlist_ipset.conf
URL2=https://github.com/chou-o-ning/web/releases/download/latest/dnsmasq_gfwlist_ipset_add_by_ning.conf

# wait system up for 30s, so wget command will not failed.
sleep 30s

wget $URL1 --no-check-certificate -O $FILE1 -o $LOGFILE || exit 1
wget $URL2 --no-check-certificate -O $FILE2 -a $LOGFILE || exit 1

cat $FILE1 $FILE2 > $FILE3

cp $FILE3 $FILE4
/etc/init.d/dnsmasq restart 
