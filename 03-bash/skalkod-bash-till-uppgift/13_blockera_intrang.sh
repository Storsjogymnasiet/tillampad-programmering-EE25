#!/bin/bash
# blockera_intrang.sh - blockerar IP-adresser med för många misslyckade SSH-försök
# OBS: kräver att ufw är installerat och aktiverat. Var försiktig - ett skript
# som blockerar trafik automatiskt kan råka stänga ute dig själv.
# Tips: grep "Failed password", awk för att plocka ut IP, ufw deny from <IP>

GRANS=5
LOGG=

# TODO: bygg en pipeline (grep | awk | sort | uniq -c | sort -nr) som skickas till loopen nedan
while read -r ANTAL IP; do
    if [ ]; then

    fi
done
