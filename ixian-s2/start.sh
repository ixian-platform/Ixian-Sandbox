#!/bin/sh -e
if [ -f "~/update.next" ]; then
  apt-get update --yes
  apt-get upgrade --yes

  cd ~/Ixian/Ixian-Core
  git pull

  cd ~/Ixian/Ixian-S2
  git pull

  sh rebuild.sh
  rm ~/update.next
fi

if [ "$WALLET_FILE" != "" ]; then
  cp $WALLET_FILE /opt/Ixian/Ixian-S2/IxianS2/bin/Release/net8.0/ixian.wal
fi

if [ "$WALLET_PASSWORD" = "" ]; then
  WALLET_PASSWORD="WALLETPASSWORD123"
fi

cd ~/Ixian/Ixian-S2/IxianS2/bin/Release/net8.0

SEED_NODE_CMD=""
if [ "$SEED_NODE" != "" ]; then
  SEED_NODE_CMD="-n \"$SEED_NODE\""
fi

if [ "$S2_PORT" = "" ]; then
  S2_PORT="10234"
fi

if [ "$NETWORK_TYPE" == "MAINNET" ]; then
  ./IxianS2 --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $S2_PORT
elif [ "$NETWORK_TYPE" = "TESTNET" ]; then
  ./IxianS2 --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $S2_PORT -t
elif [ "$NETWORK_TYPE" = "REGTEST" ]; then
  ./IxianS2 --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $S2_PORT -t
else
  echo "Error, no NETWORK_TYPE is specified."
fi
