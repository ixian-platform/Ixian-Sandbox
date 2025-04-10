#!/bin/sh -e
if [ $# -ne 3 ]; then
  echo "Setup requires 3 parameters"
  exit 1
fi

URL=$1
BRANCH=$2
SHA=$3

mkdir ~/Ixian
cd ~/Ixian

echo "Fetching Ixian-Core and Ixian-S2"
git clone -b "$BRANCH" "$URL/Ixian-Core.git"
git clone -b "$BRANCH" "$URL/Ixian-S2.git"

cd Ixian-S2
sh rebuild.sh

echo "apiBind = http://*:8081/" > ~/Ixian/Ixian-S2/IxianS2/bin/Release/net8.0/ixian.cfg
