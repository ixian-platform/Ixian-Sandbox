#!/bin/sh -e
if [ -f "update.next" ]; then
  apt-get update --yes
  apt-get upgrade --yes
  
  cd ~/Ixian/Ixian-Core
  git pull --rebase

  cd ~/Ixian/Ixian-DLT
  git pull --rebase

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

IXI_CHECKSUMLOCK_CMD=""
if [ "$IXI_CHECKSUMLOCK" != "" ]; then
  IXI_CHECKSUMLOCK_CMD="--checksumLock \"$IXI_CHECKSUMLOCK\""
elif [ "$NETWORK_TYPE" = "REGTEST" ]; then
  IXI_CHECKSUMLOCK_CMD="--checksumLock \"DOCKER\""
fi

if [ "$NETWORK_TYPE" = "MAINNET" ]; then
  ./IxianDLT --verboseOutput --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $DLT_PORT $IXI_CHECKSUMLOCK_CMD
elif [ "$NETWORK_TYPE" = "TESTNET" ]; then
  ./IxianDLT --verboseOutput --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $DLT_PORT -t $IXI_CHECKSUMLOCK_CMD
elif [ "$NETWORK_TYPE" = "REGTEST" ]; then
  if [ "$GENESIS_FUNDS" != "" ]; then
    if [ -d "data-testnet" ]; then
      # Genesis already generated
      ./IxianDLT --verboseOutput --walletPassword "$WALLET_PASSWORD" -n "localhost:1" -p $DLT_PORT --recover --networkType "$NETWORK_TYPE" $IXI_CHECKSUMLOCK_CMD
    else
      ./IxianDLT --verboseOutput --walletPassword "$WALLET_PASSWORD" -n "localhost:1" -p $DLT_PORT --genesis "$GENESIS_FUNDS" --networkType "$NETWORK_TYPE" $IXI_CHECKSUMLOCK_CMD
    fi
  else
    ./IxianDLT --verboseOutput --walletPassword "$WALLET_PASSWORD" $SEED_NODE_CMD -p $DLT_PORT --networkType "$NETWORK_TYPE" $IXI_CHECKSUMLOCK_CMD
  fi
else
  echo "Error, no NETWORK_TYPE is specified."
fi
