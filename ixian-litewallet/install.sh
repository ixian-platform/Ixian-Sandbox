#!/bin/sh -e
if [ $# -ne 4 ]; then
  echo "Setup requires 4 parameters"
  exit 1
fi

URL=$1
CORE_BRANCH=$2
LITEWALLET_BRANCH=$3
SHA=$4

mkdir ~/Ixian
cd ~/Ixian

echo "Fetching Ixian-Core and Ixian-LiteWallet"
git clone -b "$CORE_BRANCH" "$URL/Ixian-Core.git"
git clone -b "$LITEWALLET_BRANCH" "$URL/Ixian-LiteWallet.git"

cd Ixian-LiteWallet/IxianLiteWallet
sh rebuild.sh

