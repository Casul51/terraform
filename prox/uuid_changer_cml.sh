#!/bin/sh

STORAGE=/etc/pve/qemu-server

cd "$STORAGE"

echo wow

while true
do

find . -type f -name "*.conf" -exec sed -i 's%smbios1\: uuid\=.*%smbios1: uuid=efa24d56-521b-7b51-6f70-ddd02bfe3595%' {} +

sleep 1s

done


