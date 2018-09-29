#!/bin/sh

# Name:        gfwlist_autoupdate.sh
# Desription:  A script is executed from a crontab entry every day to update dnsmasq rules.
# Version:     2018.09.29
# Author:      chou.o.ning@gmail.com
# Website:     https://github.com/chou-o-ning/gfwlist-autoupdate

# wget output file
FILE1=dnsmasq_gfwlist_ipset_org.conf
FILE2=dnsmasq_gfwlist_ipset_add_by_ning.conf
FILE3=dnsmasq_gfwlist_ipset.conf

# wget log file
LOGFILE=wget.log

# wget download url
URL1=https://cokebar.github.io/gfwlist2dnsmasq/dnsmasq_gfwlist_ipset.conf
URL2=https://github.com/chou-o-ning/web/releases/download/latest/dnsmasq_gfwlist_ipset_add_by_ning.conf

wget $URL1 --no-check-certificate -O $FILE1 -o $LOGFILE || exit 1
wget $URL2 --no-check-certificate -O $FILE2 -a $LOGFILE || exit 1

cat $FILE1 $FILE2 > $FILE3

cp $FILE3 /etc/$FILE3
/etc/init.d/dnsmasq restart 
