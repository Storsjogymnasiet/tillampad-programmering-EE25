#!/bin/bash
# skapa_anvandare_lista.sh - skapar en användare för varje namn i en fil
# Tips: while read -r NAMN; do ... done < "$LISTA"
#       id "$NAMN" &>/dev/null för att kolla om användaren redan finns

# TODO: kontrollera att skriptet körs som root
if [ ]; then

    exit 1
fi

# TODO: kontrollera att ett argument (fil) gavs
if [ ]; then

    exit 1
fi

LISTA=

# TODO: kontrollera att filen finns
if [ ]; then

    exit 1
fi

# TODO: läs filen rad för rad och skapa en användare per namn
while read -r NAMN; do
    if ; then

    fi


done < "$LISTA"

echo
