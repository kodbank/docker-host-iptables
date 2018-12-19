curl -fsSL https://vishalmalli.com/network/debconfig/static/firewall/standard/firewall-init.service -o /lib/systemd/system/firewall-init.service
curl -fsSL https://vishalmalli.com/network/debconfig/static/firewall/standard/firewall.service -o /lib/systemd/system/firewall.service
mkdir /etc/network/firewall/
curl -fsSL https://vishalmalli.com/network/debconfig/static/firewall/standard/init.sh -o /etc/network/firewall/init.sh
curl -fsSL https://vishalmalli.com/network/debconfig/static/firewall/standard/rules.sh -o /etc/network/firewall/rules.sh
chmod +x /etc/network/firewall/init.sh
chmod +x /etc/network/firewall/rules.sh
systemctl enable firewall-init
systemctl enable firewall
