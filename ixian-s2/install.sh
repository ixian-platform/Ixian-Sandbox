#!/bin/sh -e
if [ $# -ne 4 ]; then
  echo "Setup requires 4 parameters"
  exit 1
fi

URL=$1
CORE_BRANCH=$2
S2_BRANCH=$3
SHA=$4

mkdir ~/Ixian
cd ~/Ixian

echo "Fetching Ixian-Core and Ixian-S2"
git clone -b "$CORE_BRANCH" "$URL/Ixian-Core.git"
git clone -b "$S2_BRANCH" "$URL/Ixian-S2.git"

cd Ixian-S2
sh rebuild.sh

echo "apiBind = http://*:8081/" > ~/Ixian/Ixian-S2/IxianS2/bin/Release/net8.0/ixian.cfg
