#!/bin/sh -e
if [ -f "update.next" ]; then
  apt-get update --yes
  apt-get upgrade --yes

  cd ~/Ixian/Ixian-Core
  git pull --rebase

  cd ~/Ixian/Ixian-LiteWallet
  git pull --rebase

  sh rebuild.sh
  rm ~/update.next
fi

if [ "$WALLET_FILE" != "" ]; then
  cp $WALLET_FILE /opt/Ixian/Ixian-LiteWallet/IxianLiteWallet/bin/Release/net8.0/ixian.wal
fi

if [ "$WALLET_PASSWORD" = "" ]; then
  WALLET_PASSWORD="WALLETPASSWORD123"
fi

cd ~/Ixian/Ixian-LiteWallet/IxianLiteWallet/bin/Release/net8.0

SEED_NODE_CMD=""
if [ "$SEED_NODE" != "" ]; then
  SEED_NODE_CMD="-n \"$SEED_NODE\""
fi

IXI_CHECKSUMLOCK_CMD=""
if [ "$IXI_CHECKSUMLOCK" != "" ]; then
  IXI_CHECKSUMLOCK_CMD="--checksumLock \"$IXI_CHECKSUMLOCK\""
elif [ "$NETWORK_TYPE" = "REGTEST" ]; then
  IXI_CHECKSUMLOCK_CMD="--checksumLock \"DOCKER\""
fi

if [ "$NETWORK_TYPE" = "MAINNET" ]; then
  ./IxianLiteWallet --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD $IXI_CHECKSUMLOCK_CMD
elif [ "$NETWORK_TYPE" = "TESTNET" ]; then
  ./IxianLiteWallet --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -t $IXI_CHECKSUMLOCK_CMD
elif [ "$NETWORK_TYPE" = "REGTEST" ]; then
  ./IxianLiteWallet --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -t $IXI_CHECKSUMLOCK_CMD
else
  echo "Error, no NETWORK_TYPE is specified."
fi
