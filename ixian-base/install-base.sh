#!/bin/sh -e
apt-get update
apt-get dist-upgrade --yes

echo "Installing .NET10 and required packages..."
apt-get install dotnet-sdk-10.0 --yes
apt-get install gcc git make unzip curl dos2unix --yes
#apt-get install net-tools dnsutils --yes
