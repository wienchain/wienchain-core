#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.wienchain/wienchaind.pid file instead
wienchain_pid=$(<~/.wienchain/testnet/wienchaind.pid)
sudo gdb -batch -ex "source debug.gdb" wienchaind ${wienchain_pid}
