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

## 2. Spara dina inloggningsuppgifter (slippa skriva lösenord varje gång)

Du behöver bara göra **ett** av alternativen nedan.

### Alternativ A: SSH-nyckel (rekommenderas)

Med SSH loggar du in med en nyckel istället för lösenord. Klona repon med SSH-url (`git@github.com:...`).

```bash
# 1. Skapa en nyckel (tryck Enter på alla frågor för standardval)
ssh-keygen -t ed25519 -C "din.epost@example.com"

# 2. Visa den publika nyckeln och kopiera hela raden
cat ~/.ssh/id_ed25519.pub
```

Klistra sedan in nyckeln på GitHub: **Settings → SSH and GPG keys → New SSH key**.

Testa att det funkar:

```bash
ssh -T git@github.com
```

### Alternativ B: Credential helper (om du använder HTTPS-url)

Om du klonar med `https://github.com/...` kan Git spara din inloggning efter första gången:

```bash
# Linux – sparar krypterat/lokalt tills du loggar ut
git config --global credential.helper store

# macOS – sparar i Keychain
git config --global credential.helper osxkeychain

# Windows – använd Git Credential Manager (följer med Git for Windows)
git config --global credential.helper manager
```

Nästa gång du pushar anger du användarnamn och en **Personal Access Token** (Settings → Developer settings → Personal access tokens) som lösenord. Efter det kommer Git ihåg den.

> Obs: `credential.helper store` sparar token i klartext i `~/.git-credentials`. Använd bara på din egen dator.

### Byta befintligt repo från HTTPS till SSH

```bash
git remote set-url origin git@github.com:ditt-anvandarnamn/TILL1000X-fornamn-efternamn.git
```

## 3. Skapa ditt kursrepo

1. Skapa ett nytt repo på GitHub som heter `TILL1000X-fornamn-efternamn`.
2. Klona ner det till din dator:

```bash
git clone git@github.com:ditt-anvandarnamn/TILL1000X-fornamn-efternamn.git
cd TILL1000X-fornamn-efternamn
```

3. Skapa en folder per lektion, precis som i kursrepot (`01-linux`, `02-fjordjupning-linux`, `03-bash` ...).

## 4. Grundflödet – varje gång du jobbat klart

```bash
git status                 # se vilka filer som ändrats
git add .                  # lägg till alla ändringar (eller: git add mappen/filen)
git commit -m "Kort beskrivning av vad du gjort"
git push                   # ladda upp till GitHub
```

## 5. Hämta senaste ändringar

Om du jobbar på flera datorer, eller vill hämta uppdateringar från kursrepot:

```bash
git pull
```

## 6. Vanliga kommandon

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

## 7. Bra commit-meddelanden

- Skriv kort vad du gjort, t.ex. `"Lägg till lösning på uppgift 3 i 03-bash"`.
- Committa ofta – hellre många små commits än en jättestor.

## 8. Om något går fel

- **`git push` nekas** – kör `git pull` först, lös eventuella konflikter, och pusha igen.
- **Glömt vad du ändrat** – kör `git status` och `git diff`.
- **Committat i fel mapp** – inga problem, flytta filen, `git add` och committa igen.
- **Helt vilse** – fråga läraren innan du kör `git reset --hard` eller tar bort mappen.

## 9. `.gitignore`

Skapa en fil som heter `.gitignore` i repots rot för att slippa ladda upp skräpfiler:

```
# Exempel
*.log
__pycache__/
.venv/
.DS_Store
```
