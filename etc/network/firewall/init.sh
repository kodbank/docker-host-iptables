#!/bin/bash

input="INPUT-CUSTOM"

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -N $input
iptables -A INPUT -j $input

ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT
ip6tables -N $input
ip6tables -A INPUT -j $input
