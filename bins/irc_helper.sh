#!/bin/sh
sshReturn=1
while [ $sshReturn != 0 ]; do
  ssh golemirc
  sshReturn=$?
  if [ $sshReturn != 0 ]; then
    echo "SSH died with $sshReturn, reopening"
    sleep 2
  fi
done
