# gfwlist-autoupdate.sh
这是一个简单的脚本，放在OpenWRT路由器的计划任务中，这样gfwlist文件有更新的时候，就可以同步更新。
# gfwlist_autoupdate_reboot.sh
这是一个简单的脚本，放在OpenWRT路由器的计划任务和/etc/rc.local中，这样gfwlist文件有更新的时候，就可以同步更新，另外路由器重启后也会更新gfwlist。

gfwlist来自两部分: 
1. https://cokebar.github.io/gfwlist2dnsmasq/dnsmasq_gfwlist_ipset.conf 由Cokebar Chi维护
2. https://github.com/chou-o-ning/web/releases/download/latest/dnsmasq_gfwlist_ipset_add_by_ning.conf 由本人维护


