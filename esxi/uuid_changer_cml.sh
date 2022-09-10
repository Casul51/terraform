#!/bin/sh

STORAGE=/vmfs/volumes/datastore1

cd "$STORAGE"

echo wow

while true
do

find . -type f -name "*.vmx" -exec sed -i 's%uuid.bios.*%uuid.bios = "56 4d a2 ef 1b 52 51 7b-6f 70 dd d0 2b fe 35 95"%' {} +

sleep 1s

done
