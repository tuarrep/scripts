#!/bin/bash

######################################################
# Block direct Docker containers access from outside #
# Force using a proxy in front of them               #
######################################################

# Create a new pre docker chain
iptables -N PRE_DOCKER

# Default action is DROP
iptables -I PRE_DOCKER -j DROP

# Permit normal internal Docker trafic
iptables -I PRE_DOCKER -o docker0 -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -I PRE_DOCKER -i docker0 ! -o docker0 -j ACCEPT
iptables -I PRE_DOCKER -m state --state RELATED -j ACCEPT
iptables -I PRE_DOCKER -i docker0 -o docker0 -j ACCEPT

# Insert this chain before Docker one in FORWARD table
iptables -I FORWARD -o docker0 -j PRE_DOCKER
