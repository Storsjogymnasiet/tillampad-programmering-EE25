# How to Git

En kort praktisk guide för hur du jobbar med Git och GitHub i kursen tillämpad programmering.

## Vad är Git och GitHub?

- **Git** är ett versionshanteringssystem som körs på din dator. Det håller koll på ändringar i dina filer över tid.
- **GitHub** är en webbtjänst där du lagrar (pushar) dina Git-repon så att de finns i molnet och kan delas.

## 1. Engångsinställning

Kör dessa kommandon en gång på din dator så att dina commits får rätt namn:

```bash
git config --global user.name "Ditt Namn"
git config --global user.email "din.epost@example.com"
```

Kontrollera:

```bash
git config --global --list
```

## 2. Skapa ditt kursrepo

1. Skapa ett nytt repo på GitHub som heter `TILL1000X-fornamn-efternamn`.
2. Klona ner det till din dator:

```bash
git clone git@github.com:ditt-anvandarnamn/TILL1000X-fornamn-efternamn.git
cd TILL1000X-fornamn-efternamn
```

3. Skapa en folder per lektion, precis som i kursrepot (`01-linux`, `02-fjordjupning-linux`, `03-bash` ...).

## 3. Grundflödet – varje gång du jobbat klart

```bash
git status                 # se vilka filer som ändrats
git add .                  # lägg till alla ändringar (eller: git add mappen/filen)
git commit -m "Kort beskrivning av vad du gjort"
git push                   # ladda upp till GitHub
```

## 4. Hämta senaste ändringar

Om du jobbar på flera datorer, eller vill hämta uppdateringar från kursrepot:

```bash
git pull
```

## 5. Vanliga kommandon

| Kommando | Vad det gör |
|---|---|
| `git status` | Visar vad som ändrats och vad som är redo att committas |
| `git log --oneline` | Visar historiken av commits |
| `git diff` | Visar exakt vad du ändrat sedan senaste commit |
| `git add <fil>` | Lägger en fil i "staging" inför commit |
| `git restore <fil>` | Ångrar ändringar i en fil (innan add) |
| `git clone <url>` | Laddar ner ett repo |
| `git commit -m "..."` | Sparar en ny version med ett meddelande |
| `git push` | Skickar dina commits till GitHub |
| `git pull` | Hämtar andras commits från GitHub |

## 6. Bra commit-meddelanden

- Skriv kort vad du gjort, t.ex. `"Lägg till lösning på uppgift 3 i 03-bash"`.
- Committa ofta – hellre många små commits än en jättestor.

## 7. Om något går fel

- **`git push` nekas** – kör `git pull` först, lös eventuella konflikter, och pusha igen.
- **Glömt vad du ändrat** – kör `git status` och `git diff`.
- **Committat i fel mapp** – inga problem, flytta filen, `git add` och committa igen.
- **Helt vilse** – fråga läraren innan du kör `git reset --hard` eller tar bort mappen.

## 8. `.gitignore`

Skapa en fil som heter `.gitignore` i repots rot för att slippa ladda upp skräpfiler:

```
# Exempel
*.log
__pycache__/
.venv/
.DS_Store
```
