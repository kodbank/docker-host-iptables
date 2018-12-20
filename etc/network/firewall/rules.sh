#!/bin/bash

input="INPUT-CUSTOM"


iptables -t filter -F $input
iptables -t filter -F DOCKER-USER
ip6tables -t filter -F $input

iptables -t filter -A $input -i lo -j ACCEPT -m comment --comment "Accept loopback traffic"
iptables -t filter -A $input -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related"
iptables -t filter -A $input -p icmp -m icmp --icmp-type echo-request -j ACCEPT -m comment --comment "Accept pings"
iptables -t filter -A $input -p tcp --dport 22 -j ACCEPT -m comment --comment "Accept SSH"
ip6tables -t filter -A $input -i lo -j ACCEPT -m comment --comment "Accept loopback traffic"
ip6tables -t filter -A $input -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related traffic"

# start custom rules

# end custom rules

iptables -t filter -A $input -j RETURN
ip6tables -t filter -A $input -j RETURN
