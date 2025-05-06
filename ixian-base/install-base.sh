#!/bin/sh -e
apt-get update
apt-get dist-upgrade --yes

echo "Installing .NET8 and required packages..."
apt-get install dotnet-sdk-8.0 --yes
apt-get install gcc git make unzip curl --yes
#apt-get install net-tools dnsutils --yes
