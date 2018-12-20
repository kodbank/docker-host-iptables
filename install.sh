#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/vishalmalli/docker-host-iptables/master/lib/systemd/system/firewall-init.service -o /lib/systemd/system/firewall-init.service
curl -fsSL https://raw.githubusercontent.com/vishalmalli/docker-host-iptables/master/lib/systemd/system/firewall.service -o /lib/systemd/system/firewall.service
mkdir /etc/network/firewall/
curl -fsSL https://raw.githubusercontent.com/vishalmalli/docker-host-iptables/master/etc/network/firewall/init.sh -o /etc/network/firewall/init.sh
curl -fsSL https://raw.githubusercontent.com/vishalmalli/docker-host-iptables/master/etc/network/firewall/rules.sh -o /etc/network/firewall/rules.sh
chmod +x /etc/network/firewall/init.sh
chmod +x /etc/network/firewall/rules.sh
systemctl enable firewall-init
systemctl enable firewall
reboot
