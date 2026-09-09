# Bash script – fyll i koden

### Övningshäfte med kodskelett

*Tillämpad programmering, nivå 1 · TILL1000X · Gy25 — Storsjögymnasiet*

---

## Så funkar det

Varje övning nedan är ett ofullständigt bash-skript. Rader märkta `# TODO` är sådant du ska fylla i själv, och tomma platser som `echo`, `if [ ]` eller `NAMN=` är medvetet tomma – fyll i dem så att skriptet faktiskt gör det uppgiften beskriver. Skriv av hela skriptet (inklusive det som redan står där), spara det med rätt filnamn, gör det körbart med `chmod +x` och testa att det fungerar.

Alla övningar löses i ditt eget git-repo (se "Kom igång: eget repo" nedan för hur du sätter upp det). Committa och pusha löpande – till exempel efter varje klar övning – så att arbetet sparas på GitHub och inte bara ligger kvar lokalt på just den dator du sitter vid.

---

## Kom igång: eget repo

Innan du börjar med övningarna: lägg dem i ditt eget repo, i rätt mappstruktur. Gör det här en gång, sedan jobbar du vidare därifrån under resten av kursen.

### 1. Skapa ett nytt, tomt repo på GitHub

- Gå till github.com och skapa ett helt nytt repo via "New repository" – INTE via "Use this template" eller Fork på mallrepot.
- Under "Owner", välj organisationen Storsjogymnasiet – inte ditt eget personliga konto.
- Döp det enligt mönstret TILL1000X-fornamn-efternamn, t.ex. TILL1000X-anna-andersson.
- Lämna det tomt (ingen README, ingen .gitignore).
- Klicka "Create repository".

### 2. Klona ner sitt eget repo och kursens repo

```bash
git clone https://github.com/Storsjogymnasiet/TILL1000X-fornamn-efternamn.git
git clone https://github.com/Storsjogymnasiet/tillampad-programmering-EE25.git mall
```

> mall-mappen har ingen koppling till ditt eget repo och ska inte pushas någonstans – den används bara för att kika i och för att kopiera uppgiftsfiler ifrån (se steg 3).

### 3. Kopiera uppgiftsfilerna till sitt eget repo

Mapparna döps enligt mönstret 0X-lektion, t.ex. 03-bash för bash-lektionerna. Kodskelett-övningarna (00_hello.sh, 01_hej.sh, osv.) ligger i kursens repo (mallen) – kopiera dem därifrån till samma mapp i ditt eget repo, istället för att skriva av dem för hand.

```bash
cd TILL1000X-fornamn-efternamn
mkdir -p 03-bash
cp ../mall/03-bash/*.sh 03-bash/
```

### 4. Spara och skicka upp arbetet

```bash
git add .
git commit -m "Fyller i kodskelett-övningarna"
git push
```

> Committa och pusha ofta – till exempel efter varje klar övning – så att inget arbete bara ligger kvar lokalt på just den här datorn.

---

## Del 1 – Bash-grunder

### 00 – Hello world

**Tips:** I bash skriver du ut text till skärmen med echo. Allt du skriver efter echo, inom citattecken, blir precis det som visas – till exempel skriver `echo "Hello world"` ut den texten på egen rad.

**Tips:** Ett skript måste göras körbart innan du kan starta det med `./`. Kör `chmod +x 00_hello.sh` en gång, sedan kan du testa skriptet om och om igen med `./00_hello.sh` utan att behöva göra om det steget.

```bash
#!/bin/bash
# Uppgift: Skriv ut texten "Hello world".

# TODO: skriv ut texten
echo
```

### 01 – Hälsning

**Tips:** `read -p "fråga" VARIABEL` visar frågan på skärmen och väntar sedan på att användaren skriver något och trycker Enter. Det som skrivs sparas i variabeln du anger sist i kommandot.

**Tips:** Lägg märke till att du skriver variabelnamnet utan `$` när du tilldelar eller läser in ett värde (som i `read -p "..." NAMN`), men med `$` när du vill använda värdet, till exempel i `echo "Hej, $NAMN!"`. Att blanda ihop de här två är ett av de allra vanligaste nybörjarfelen i bash.

**Tips:** Testa gärna med ett namn som innehåller mellanslag, till exempel Anna Lo, för att se att hela namnet läses in korrekt trots mellanslaget.

```bash
#!/bin/bash
# Uppgift: Fråga användaren vad hen heter och hälsa sedan på personen.
# Tips: read -p "fråga" VARIABEL

# TODO: läs in namnet
read -p "" NAMN
# TODO: hälsa på användaren
echo
```

### 02 – Jämför ett tal

**Tips:** En if-sats i bash byggs upp som `if [ villkor ]; then ... else ... fi`. Tänk på att mellanslagen runt hakparenteserna `[` och `]` är obligatoriska – bash tolkar `[` som ett eget litet kommando, så `[$TAL -gt 10]` utan mellanslag ger ett felmeddelande istället för att fungera.

**Tips:** För att jämföra tal används korta bokstavskoder istället för symboler som `>` och `<`: `-gt` betyder "greater than" (större än), `-lt` betyder "less than" (mindre än), `-ge` betyder "större än eller lika med" och `-eq` betyder att talen är lika.

**Tips:** Testa skriptet med flera olika tal – ett som är mindre än 10, ett som är större, och själva talet 10 – så att du är säker på att gränsfallet (exakt 10) hamnar i rätt gren av if-satsen.

```bash
#!/bin/bash
# Uppgift: Läs in ett tal. Om talet är större än 10, skriv ett meddelande,
# annars ett annat.
# Tips: if [ $TAL -gt 10 ]; then ... else ... fi

# TODO: läs in talet
read -p "" TAL

# TODO: fyll i villkoret
if [ ]; then
    echo
else
    echo
fi
```

### 03 – Loopa igenom filer

**Tips:** `for FIL in *.txt; do ... done` loopar igenom alla filer i mappen som matchar mönstret `*.txt`. Bash expanderar mönstret till en lista av faktiska filnamn innan loopen ens börjar köras, så FIL får ett nytt filnamn för varje varv i loopen.

**Tips:** Skapa några tomma testfiler innan du kör skriptet, till exempel med `touch a.txt b.txt c.txt`, så har du faktiskt något att loopa igenom när du testar.

**Tips:** Om det inte finns någon .txt-fil i mappen kommer loopen ändå att köras en gång, men då med den bokstavliga texten `*.txt` som värde på FIL, eftersom mönstret inte gick att expandera till några riktiga filer. Testa gärna det scenariot också och fundera på om det är ett problem för just det här skriptet.

```bash
#!/bin/bash
# Uppgift: Loopa igenom alla .txt-filer i mappen och skriv ut varje filnamn.
# Tips: for FIL in *.txt; do ... done

# TODO: loopa igenom .txt-filerna
for FIL in ; do
    echo
done
```

### 04 – Array med namn

**Tips:** En array i bash skapas med `NAMN=(Anna Erik Maja)`. Lägg märke till att det inte ska vara några citattecken eller kommatecken mellan namnen, bara mellanslag.

**Tips:** Det vanligaste och säkraste sättet att loopa igenom alla element i en array är `for N in "${NAMN[@]}"; do ... done`. Citattecknen runt gör att namn med mellanslag i sig hanteras rätt, så det är bra att vänja sig vid att alltid skriva det på det sättet.

**Tips:** Vill du kolla hur många namn som finns i arrayen kan du skriva ut det separat i terminalen med `echo "${#NAMN[@]}"`.

```bash
#!/bin/bash
# Uppgift: Skapa en array med namnen Anna, Erik och Maja och hälsa på var och en.
# Tips: NAMN=(Anna Erik Maja)

# TODO: skapa arrayen
NAMN=()

for N in "${NAMN[@]}"; do
    echo
done
```

### 05 – Hälsning med argument

**Tips:** Till skillnad från tidigare övningar, där användaren skriver in värden medan skriptet redan kör, tar det här skriptet emot värden direkt när du startar det, till exempel `./05_halsa.sh Anna`. Då blir `$1` (det första argumentet) lika med Anna.

**Tips:** `$#` är en inbyggd variabel som alltid innehåller antalet argument som skickades med när skriptet startades, oavsett vilka de är eller hur de heter.

**Tips:** Testa att köra skriptet med noll, ett och flera argument (till exempel `./05_halsa.sh Anna Erik Maja`) och jämför vad `$1` och `$#` blir i varje fall – det brukar göra skillnaden mellan dem tydlig.

```bash
#!/bin/bash
# Uppgift: Skriv ut "Hej, <namn>!" utifrån första argumentet ($1),
# samt hur många argument som gavs ($#).

# TODO: hälsa med $1
echo
# TODO: skriv ut antal argument med $#
echo
```

### 06 – Hälsa på flera argument

**Tips:** `$@` är en inbyggd variabel som representerar samtliga argument som skickades med till skriptet, till skillnad från `$1` som bara är det allra första.

**Tips:** Skriv alltid `"$@"` med citattecken när du loopar igenom argumenten. Det gör att varje argument behandlas som ett eget, separat ord i loopen, även om ett argument råkar innehålla mellanslag. Utan citattecken (eller med `$*` istället) riskerar sådana argument att splittras fel.

**Tips:** Testa med flera namn samtidigt, till exempel `./06_argloop.sh Anna Erik Maja`, och se att loopen körs en gång per namn – precis som i array-övningen tidigare, fast namnen kommer från kommandoraden istället för från en array i koden.

```bash
#!/bin/bash
# Uppgift: Hälsa på alla namn som ges som argument.
# Tips: "$@" innehåller alla argument.

# TODO: loopa igenom alla argument
for NAMN in ; do
    echo
done
```

---

## Del 2 – Automatisera sysadmin-sysslor

Sju lite större övningar som bygger vidare på grunderna ovan.

### 07 – Skapa en datumstämplad mapp

**Tips:** `date +%Y-%m-%d` skriver ut dagens datum i formatet år-månad-dag, till exempel 2026-09-09. Spara resultatet i en variabel så att du kan återanvända det när du bygger ihop mappnamnet.

**Tips:** Ett tydligt mappnamn kombinerar det inlästa namnet och datumet, till exempel `MAPPNAMN="${NAMN}_${DATUM}"` – klamrarna runt variabelnamnen gör det tydligt var variabelnamnet slutar och resten av texten börjar, vilket annars lätt blir fel när text klistras ihop direkt efter en variabel.

**Tips:** `mkdir` skapar själva mappen utifrån namnet du satt ihop. Testa att köra skriptet två gånger i rad med samma indata samma dag – vad händer med mkdir då, och är det ett beteende skriptet borde hantera snyggare?

**Tips:** Kom ihåg att `$1` är det första argumentet som skickas med när du startar skriptet, till exempel `./07_skapa_mapp.sh projekt` – precis som i argument-övningarna i Del 1.

```bash
#!/bin/bash
# skapa_mapp.sh - tar emot ett namn och skapar en datumstämplad mapp
# Tips: date +%Y-%m-%d ger dagens datum, mkdir skapar mappen.

# TODO: kontrollera att ett argument gavs
if [ ]; then

    exit 1
fi

# TODO: spara namn, datum och mappnamn i variabler
NAMN=
DATUM=
MAPPNAMN=

echo
# TODO: skapa mappen
mkdir
echo
```

### 08 – Skapa en ny användare

**Tips:** `$EUID` är en inbyggd variabel som visar vilket användar-id skriptet körs med – root har alltid id 0. Ett vanligt sätt att kontrollera att skriptet körs med tillräckliga rättigheter är `if [ "$EUID" -ne 0 ]; then`, som avslutar skriptet om det inte körs som root.

**Tips:** `useradd -m -s /bin/bash ANVANDARE` skapar själva användaren: flaggan -m gör att en hemkatalog skapas åt användaren, och -s /bin/bash sätter bash som kontots standardskal.

**Tips:** Lösenordet sätts genom att skicka indata på formen användare:lösenord till chpasswd via en pipe, till exempel `echo "$ANVANDARE:$TILLFALLIGT_LOSENORD" | chpasswd`.

**Tips:** `passwd -e ANVANDARE` markerar kontots lösenord som utgånget, vilket tvingar användaren att sätta ett nytt lösenord direkt vid nästa inloggning – ett vanligt sätt att hantera tillfälliga lösenord på riktiga system.

**Tips:** Testa skriptet med `sudo ./08_skapa_user.sh testanvandare` och kontrollera sedan att kontot verkligen skapades, till exempel genom att titta på de sista raderna i /etc/passwd med `tail /etc/passwd`.

```bash
#!/bin/bash
# skapa_user.sh - skapar en ny användare med tillfälligt lösenord
# Tips: useradd -m -s /bin/bash, chpasswd, passwd -e

# TODO: kontrollera att skriptet körs som root
if [ ]; then

    exit 1
fi

# TODO: kontrollera att ett argument (användarnamn) gavs
if [ ]; then

    exit 1
fi

ANVANDARE=
TILLFALLIGT_LOSENORD=

# TODO: skapa användaren, sätt lösenordet och tvinga lösenordsbyte


echo
echo
echo
```

### 09 – Massskapa användare från en lista

**Tips:** `while read -r NAMN; do ... done < "$LISTA"` läser filen som pekas ut av $LISTA rad för rad. För varje rad i filen körs allt inne i loopen en gång, med NAMN satt till just den radens innehåll.

**Tips:** Flaggan -r till read är viktig att alltid ha med när du läser rad för rad ur en fil – utan den kan bakåtstreck i filens innehåll av misstag tolkas som specialtecken istället för vanlig text.

**Tips:** `id "$NAMN" &>/dev/null` är ett sätt att tyst kontrollera om en användare redan finns: kommandot lyckas (exitkod 0) om användaren finns, och misslyckas annars. Använd resultatet i en if-sats för att slippa försöka skapa samma användare två gånger.

**Tips:** Skapa en textfil att testa med, till exempel namnlista.txt med ett namn per rad (Anna, Erik, Maja). Kör sedan skriptet en andra gång med samma fil och kontrollera att det inte försöker skapa användare som redan finns sedan förra körningen.

```bash
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
```

### 10 – Schemalagda systemuppdateringar

**Tips:** `apt update` hämtar den senaste informationen om vilka paket och versioner som finns tillgängliga, medan `apt upgrade -y` faktiskt installerar uppdateringarna. Flaggan -y svarar automatiskt ja på frågor som annars skulle avbryta körningen, vilket krävs eftersom skriptet ska kunna köras utan att någon sitter och bekräftar.

**Tips:** `$?` är en inbyggd variabel som direkt efter ett kommando innehåller det kommandots exitkod – 0 betyder att allt gick bra, ett annat värde betyder att något gick fel. Kontrollera $? direkt efter apt upgrade för att veta vad du ska skriva i loggen.

**Tips:** Använd `date +"%Y-%m-%d %H:%M"` för att skapa en läsbar tidsstämpel till loggen, och skriv till loggfilen med `>>` (inte enkelt `>`, som skulle skriva över allt som redan loggats tidigare).

**Tips:** Testa alltid skriptet manuellt med `sudo ./10_auto_update.sh` innan du lägger in det i cron, så att du vet att det fungerar som tänkt innan det körs helt automatiskt mitt i natten.

**Tips:** Tänk på att cron kör med en betydligt enklare miljö än din vanliga terminal, bland annat en kortare PATH. Fungerar skriptet när du kör det själv men inte via cron, prova att skriva ut hela sökvägen till kommandona, till exempel /usr/bin/apt istället för bara apt.

```bash
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
```

### 11 – Städa gamla filer

**Tips:** `getopts "nd:" FLAGGA` läser av flaggor som skickas med på kommandoraden. Bokstäverna i strängen anger vilka flaggor som är giltiga: n och d i det här fallet. Kolonet direkt efter d betyder att -d förväntar sig ett värde efter sig (som hamnar i $OPTARG), medan -n inte behöver något kolon eftersom den bara är av eller på.

**Tips:** `find "$MAPP" -type f -mtime +"$GRANS"` hittar alla vanliga filer i den angivna mappen som är äldre än $GRANS dagar. -type f begränsar sökningen till filer (inte mappar), och +$GRANS betyder "mer än så här många dagar gammal".

**Tips:** Testa alltid med torrkörningsläget (flaggan -n) först, så att skriptet bara visar vilka filer som skulle tas bort, innan du kör det på riktigt och faktiskt raderar något.

**Tips:** För att kunna testa skriptet behöver du en fil som faktiskt räknas som gammal. `touch -d "40 days ago" gammal_fil.txt` skapar en tom fil men sätter dess ändringsdatum 40 dagar bakåt i tiden, så den dyker upp i find-sökningen ovan.

```bash
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
```

### 12 – Övervaka och starta om en tjänst

**Tips:** `systemctl is-active --quiet TJANST` kontrollerar om en tjänst kör just nu. Flaggan --quiet gör att kommandot inte skriver ut något alls, utan bara sätter en exitkod (0 om tjänsten kör). Det gör att du kan använda hela kommandot direkt som villkor i en if-sats: `if systemctl is-active --quiet "$TJANST"; then`.

**Tips:** `systemctl restart TJANST` startar om tjänsten, vilket du vill göra om kontrollen ovan visar att den inte kör.

**Tips:** Testa med en tjänst du själv vågar stoppa, till exempel `sudo systemctl stop cron`. Kör sedan skriptet och se att det upptäcker att tjänsten är nere och startar om den.

**Tips:** Efter en omstart är det bra att kontrollera statusen en gång till med samma is-active-kommando, så att skriptet kan rapportera om omstarten faktiskt lyckades eller inte innan det avslutas.

```bash
#!/bin/bash
# bevaka_tjanst.sh - kontrollerar att en tjänst kör, startar om vid behov
# Tips: systemctl is-active --quiet, systemctl restart

# TODO: kontrollera att ett argument (tjänstnamn) gavs
if [ ]; then

    exit 1
fi

TJANST=
LOGGFIL=

# TODO: kontrollera status, starta om vid behov och kolla igen
if ; then

else


    if ; then

    else

    fi
fi
```

### 13 – Upptäck misstänkta inloggningsförsök

**Tips:** Loggfilen innehåller en rad per misslyckat inloggningsförsök, med texten "Failed password" i sig. `grep "Failed password" "$LOGG"` plockar ut just de raderna ur hela loggfilen, resten kan du bortse från.

**Tips:** Varje sådan rad innehåller IP-adressen som en av flera delar separerade med mellanslag. `awk '{print $(NF-3)}'` är ett vanligt sätt att plocka ut just den delen – testa gärna det steget för sig i terminalen på en riktig loggrad, så du ser vilket fält som faktiskt innehåller IP-adressen hos er.

**Tips:** Genom att skicka resultatet vidare genom `sort | uniq -c | sort -nr` grupperas identiska IP-adresser ihop, du får en räknare för hur många gånger varje adress förekommer, och hela listan sorteras med flest förekomster överst.

**Tips:** Bygg pipelinen stegvis: låt loopen först bara skriva ut resultatet med echo istället för att köra `ufw deny`, så att du kan se att rätt IP-adresser och rätt antal plockas ut innan skriptet faktiskt börjar blockera trafik.

**Tips:** Var extra försiktig om du testar det här på en server du själv loggar in på via SSH – skriptet känner inte skillnad på en angripare och dig själv, så du riskerar att blockera din egen uppkoppling om du inte tänker efter.

```bash
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
```

### 14 – Provisionera en dator/server

**Tips:** `PROGRAM=(git vim curl htop tree unzip)` skapar en array med namnen på de program som ska finnas installerade på datorn – precis som i array-övningen tidigare i häftet.

**Tips:** `dpkg -l | grep -qw "$PAKET"` kontrollerar tyst om ett paket redan är installerat. Flaggan -q gör att grep inte skriver ut något alls, och -w kräver att sökordet matchar ett helt ord, så att till exempel "vim" inte råkar matcha "vim-common" som redan finns installerat sedan tidigare.

**Tips:** `git config --global user.name "..."` och `git config --global user.email "..."` är typiska grundinställningar man vill sätta upp automatiskt på en nyinstallerad dator, så att git fungerar direkt.

**Tips:** Testa skriptet, och kör det sedan en andra gång direkt efter. Den andra gången ska det säga att alla paket redan finns installerade istället för att försöka installera om dem – om inte, har kontrollen mot dpkg -l inte fungerat som tänkt.

```bash
#!/bin/bash
# provisionera.sh - installerar standardprogram och grundinställningar
# Tips: PROGRAM=(git vim curl htop tree unzip)
#       dpkg -l | grep -qw "$PAKET" för att kolla om paketet redan finns

# TODO: skapa arrayen med program
PROGRAM=()

echo

# TODO: loopa och installera de program som saknas
for PAKET in "${PROGRAM[@]}"; do
    if ; then

    else

    fi
done

# TODO: sätt grundinställningar för git


echo
```
