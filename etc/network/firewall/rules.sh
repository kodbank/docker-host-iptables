#!/bin/bash

input="INPUT-CUSTOM"

iptables -F $input
iptables -F DOCKER-USER
ip6tables -F $input

iptables -A $input -i lo -j ACCEPT -m comment --comment "Accept loopback traffic"
iptables -A $input -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related"
iptables -A $input -p icmp -m icmp --icmp-type echo-request -j ACCEPT -m comment --comment "Accept pings"
iptables -A $input -p tcp --dport 22 -j ACCEPT -m comment --comment "Accept SSH"
ip6tables -A $input -i lo -j ACCEPT -m comment --comment "Accept loopback traffic"
ip6tables -A $input -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT -m comment --comment "Accept established, related traffic"

# start custom rules

# end custom rules

iptables -A $input -j RETURN
iptables -A DOCKER-USER -j RETURN
ip6tables -A $input -j RETURN
