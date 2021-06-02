#!/bin/bash
#
#Kasutajate lisamise skript, mis võtab andmed kahest erinevast failist
#Joonas Masing
#
#
if [ $# -ne 2 ]; then
    echo "Kasutusjuhend: $0 kasutajad ja paroolid"
else
kasutajad=$1
paroolid=$2
  if [ -f $kasutajad -a -r $kasutajad ] && [ -f $paroolid -a -r $paroolid ]; then
    echo "failid on korras"
    for rida in $(paste -d: $kasutajad $paroolid)
    do
kasutajanimi=$(echo "$rida" | cut -f1 -d:)
      sh lisa_kasutaja $kasutajanimi
echo "$rida" | chpasswd
    done
  else
    echo "probleem failiga $failinimi"
  fi
# parameetrite kontrolli lõpp
fi
