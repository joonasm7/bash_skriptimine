#!/bin/bash
#Kasutaja lisamine genereeritud parooliga kontrollides, et kasutaja oleks root
#Joonas Masing
#
kasroot=$(whoami)
if [ $kasroot = "root" ]; then
	if [ $# -ne 1 ]; then
        echo "Kasutusjuhend: $0 failinimi"
	else
 		failinimi=$1
  		if [ -f $failinimi -a -r $failinimi ]; then
   		echo "fail on olemas!"
    		for rida in $(paste -d: $failinimi $paroolid)
    		do
        		kasutajanimi=$(echo "$rida" | cut -f1 -d:)
        		sh lisa_kasutaja $kasutajanimi
        		# genereerimise käsk
        		parool=$(pwgen -s 8 1)
        		echo "$kasutajanimi:$parool" | chpasswd
        		echo "$kasutajanimi - $parool" >> kasutajadparoolidega
    		done
 	 else
    	 echo "Esines probleem failiga $failinimi"
 	 fi
	 #kontrolli lõpp
	 fi
else
	 echo "Skripti käivitamiseks pead olema root kasutaja. "
# skript lõppeb
fi
