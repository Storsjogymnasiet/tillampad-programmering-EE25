#!/bin/bash
# stada_gamla_filer.sh - tar bort filer äldre än ett antal dagar i en mapp
# Tips: getopts "nd:" för flaggorna -n och -d
#       find "$MAPP" -type f -mtime +"$GRANS" för att hitta gamla filer

TORRKORNING=0
GRANS=30

# TODO: hantera flaggorna -n och -d
while getopts "" FLAGGA; do
    case $FLAGGA in
        n) ;;
        d) ;;
        *) ;;
    esac
done


MAPP=

# TODO: kontrollera att mappen finns
if [ ]; then

    exit 1
fi

# TODO: visa eller ta bort filerna beroende på TORRKORNING
if [ ]; then

else

fi
