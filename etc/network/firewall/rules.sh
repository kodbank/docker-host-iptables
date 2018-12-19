#!/bin/bash

input="INPUT-CUSTOM"
forward="FORWARD-CUSTOM"


iptables -t filter -F $input
iptables -t filter -F $forward
iptables -t filter -F DOCKER-USER

ip6tables -t filter -F $input
ip6tables -t filter -F $forward

iptables -t filter -A $input -i lo -j ACCEPT -m comment --comment "Accept loopback traffic"
iptables -t filter -A $input -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related"
iptables -t filter -A $input -p icmp -m icmp --icmp-type echo-request -j ACCEPT -m comment --comment "Accept pings"
iptables -t filter -A $input -p tcp --dport 22 -j ACCEPT -m comment --comment "Accept SSH"

ip6tables -t filter -A $input -i lo -j ACCEPT -m comment --comment "Accept loopback traffic"
ip6tables -t filter -A $input -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related traffic"

# start custom rules
iptables -t filter -A DOCKER-USER -d 192.168.239.0/24 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related traffic for Docker"
iptables -t filter -A DOCKER-USER -d 192.168.240.0/24 -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related traffic for Docker"
iptables -t filter -A DOCKER-USER -d 192.168.239.0/24 -j DROP -m comment --comment "Drop external traffic for Docker"
iptables -t filter -A DOCKER-USER -d 192.168.240.0/24 -j DROP -m comment --comment "Drop external traffic for Docker"
iptables -t filter -A DOCKER-USER -j RETURN
# end custom rules

iptables -t filter -A $input -j RETURN
iptables -t filter -A $forward -j RETURN

ip6tables -t filter -A $input -j RETURN
ip6tables -t filter -A $forward -j RETURN
