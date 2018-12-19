#!/bin/bash

input="INPUT-CUSTOM"
forward="FORWARD-CUSTOM"

iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP
iptables -t filter -P OUTPUT ACCEPT
iptables -t filter -N $input
iptables -t filter -N $forward
iptables -t filter -A INPUT -j $input
iptables -t filter -A FORWARD -j $forward

ip6tables -t filter -P INPUT DROP
ip6tables -t filter -P FORWARD DROP
ip6tables -t filter -P OUTPUT ACCEPT
ip6tables -t filter -N $input
ip6tables -t filter -N $forward
ip6tables -t filter -A INPUT -j $input
ip6tables -t filter -A FORWARD -j $forward
