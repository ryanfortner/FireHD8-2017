#!/bin/bash

set -e

if [ `uname -m | grep 64` ]; then
	FASTBOOT=bin/fastboot
else
	FASTBOOT=bin/fastboot32
fi

echo "Brick preloader to continue via bootrom-exploit? (Type \"YES\" to continue)"
read YES
if [ "$YES" = "YES" ]; then
  echo "Bricking PL Header"
  echo "Check instructions on device"
  echo ""
  echo ""
  $FASTBOOT flash brick bin/brick.img
  echo "Now unplug the device and power off"
  echo "Then continue with bootrom-step-minimal.sh"
fi
