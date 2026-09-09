#!/bin/bash
# auto_update.sh - uppdaterar systemet och loggar resultatet
# Tips: apt update och apt upgrade -y, skriv till loggfilen med >>

LOGGFIL=
DATUM=

echo >> "$LOGGFIL"

# TODO: kör apt update och logga resultatet


# TODO: kör apt upgrade -y och logga om det lyckades eller inte
if ; then

else

fi

echo >> "$LOGGFIL"

# Schemaläggs t.ex. med:
# 0 3 * * * /home/elev/skript/auto_update.sh   (kör varje natt klockan 03:00)
