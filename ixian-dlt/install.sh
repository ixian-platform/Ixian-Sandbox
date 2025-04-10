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

echo "Fetching Ixian-Core and Ixian-DLT"
git clone -b "$BRANCH" "$URL/Ixian-Core.git"
git clone -b "$BRANCH" "$URL/Ixian-DLT.git"

cd Ixian-DLT
sh rebuild.sh

echo "apiBind = http://*:8081/" > ~/Ixian/Ixian-DLT/IxianDLT/bin/Release/net8.0/ixian.cfg
