#!/bin/bash
# ------------------------------------------------------------
# 1. Skriva och köra ett skript
# ------------------------------------------------------------
echo "Hello world" # Skriver ut texten till terminalen

# ------------------------------------------------------------
# 2. Variabler och indata
# ------------------------------------------------------------
read -p "Vad heter du?" NAMN # Frågar användaren och sparar svaret i variabeln NAMN
echo "Hej, $NAMN !"          # Skriver ut en hälsning med värdet i NAMN

# ------------------------------------------------------------
# 3. Villkor (if)
# ------------------------------------------------------------
read -p "Ange ett tal: " TAL # Läser in ett tal och sparar det i variabeln TAL

if [ $TAL -gt 10 ]; then          # Jämför om TAL är större än 10
  echo "Talet är större än 10"    # Körs om villkoret ovan är sant
else                              # Annars, om villkoret var falskt...
  echo "Talet är 10 eller mindre" # Körs om TAL inte är större än 10
fi                                # Markerar slutet på if-satsen

# ------------------------------------------------------------
# 4. Loopar (for)
# ------------------------------------------------------------
for FIL in *.txt; do       # Loopar igenom alla .txt-filer i mappen, en i taget
  echo "Hittade fil: $FIL" # Skriver ut namnet på den aktuella filen
done                       # Markerar slutet på loopen

# ------------------------------------------------------------
# 5. Arrayer
# ------------------------------------------------------------
NAMN=(Anna Erik Maja) # Skapar en array med tre namn

for N in "${NAMN[@]}"; do # Loopar igenom varje namn i arrayen
  echo "Hej, $N!"         # Hälsar på det namn loopen befinner sig på
done                      # Markerar slutet på loopen

# ------------------------------------------------------------
# 6. Argument ($1, $#)
# ------------------------------------------------------------
echo "Hej, $1!"           # Skriver ut en hälsning till det första argumentet
echo "Du gav $# argument" # Skriver ut hur många argument som skickades med

# ------------------------------------------------------------
# 7. Argument i en loop ($@)
# ------------------------------------------------------------
for NAMN in "$@"; do # Loopar igenom alla argument skriptet startades med
  echo "Hej, $NAMN!" # Hälsar på det argument loopen befinner sig på
done                 # Markerar slutet på loopen

# ------------------------------------------------------------
# 8. Bonus: skapa_mapp.sh
# tar emot ett namn och skapar en datumstämplad mapp
# ------------------------------------------------------------
if [ $# -eq 0 ]; then                         # Kontrollerar om skriptet startades utan argument
  echo "Du måste ange ett namn som argument!" # Felmeddelande till användaren
  exit 1                                      # Avslutar skriptet direkt med en felkod
fi                                            # Markerar slutet på if-satsen

NAMN=$1                     # Sparar det första argumentet i variabeln NAMN
DATUM=$(date +%Y-%m-%d)     # Hämtar dagens datum i formatet år-månad-dag
MAPPNAMN="${NAMN}_${DATUM}" # Bygger ihop ett mappnamn av namn och datum

echo "Hej $NAMN!"                             # Hälsar på användaren
mkdir "$MAPPNAMN"                             # Skapar mappen med det ihopsatta namnet
echo "Klart! Mappen '$MAPPNAMN' har skapats." # Bekräftar att mappen skapades
