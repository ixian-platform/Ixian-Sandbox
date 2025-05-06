#!/bin/sh -e
if [ $# -ne 4 ]; then
	echo "Setup requires 4 parameters"
  exit 1
fi

URL=$1
CORE_BRANCH=$2
DLT_BRANCH=$3
SHA=$4

mkdir ~/Ixian
cd ~/Ixian

echo "Fetching Ixian-Core and Ixian-DLT"
git clone -b "$CORE_BRANCH" "$URL/Ixian-Core.git"
git clone -b "$DLT_BRANCH" "$URL/Ixian-DLT.git"

cd Ixian-DLT
sh rebuild.sh

echo "apiBind = http://*:8081/" > ~/Ixian/Ixian-DLT/IxianDLT/bin/Release/net8.0/ixian.cfg
