#!/bin/sh -e
if [ -f "~/update.next" ]; then
  apt-get update --yes
  apt-get upgrade --yes
  
  cd ~/Ixian/Ixian-Core
  git pull

  cd ~/Ixian/Ixian-DLT
  git pull

  sh rebuild.sh
  rm ~/update.next
fi

if [ "$WALLET_FILE" != "" ]; then
  cp $WALLET_FILE /opt/Ixian/Ixian-DLT/IxianDLT/bin/Release/net8.0/ixian.wal
fi

if [ "$WALLET_PASSWORD" = "" ]; then
  WALLET_PASSWORD="WALLETPASSWORD123"
fi

cd ~/Ixian/Ixian-DLT/IxianDLT/bin/Release/net8.0

SEED_NODE_CMD=""
if [ "$SEED_NODE" != "" ]; then
  SEED_NODE_CMD="-n \"$SEED_NODE\""
fi

if [ "$DLT_PORT" = "" ]; then
  DLT_PORT="10234"
fi

if [ "$NETWORK_TYPE" = "MAINNET" ]; then
  ./IxianDLT --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $DLT_PORT
elif [ "$NETWORK_TYPE" = "TESTNET" ]; then
  ./IxianDLT --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $DLT_PORT -t
elif [ "$NETWORK_TYPE" = "REGTEST" ]; then
  if [ "$GENESIS_FUNDS" != "" ]; then
    if [ -d "data-testnet" ]; then
      # Genesis already generated
      ./IxianDLT --walletPassword "$WALLET_PASSWORD" -p $DLT_PORT --recover -t
    else
      ./IxianDLT --walletPassword "$WALLET_PASSWORD" -p $DLT_PORT --genesis "$GENESIS_FUNDS" -t
    fi
  else
    ./IxianDLT --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $DLT_PORT -t
  fi
else
  echo "Error, no NETWORK_TYPE is specified."
fi
