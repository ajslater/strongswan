#!/bin/sh

echo "Configuring iptables..."
iptables --table nat --append POSTROUTING --jump MASQUERADE
ip6tables --table nat --append POSTROUTING --jump MASQUERADE

echo "Copying configs from /config..."
cp /config/ipsec.conf /etc/ipsec.conf
cp /config/ipsec.secrets /etc/ipsec.secrets
cp /config/strongswan.conf /etc/strongswan.conf

echo "Starting ipsec..."
ipsec start --nofork
