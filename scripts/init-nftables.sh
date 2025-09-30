#!/bin/bash

apt-get update && apt-get install nftables -y
nft -f /etc/nftables.rules

tail -f /dev/null
