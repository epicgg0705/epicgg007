-- ESX Jail System Script

Ein simples, aber leistungsfähiges Gefängnissystem für ESX-basierte FiveM RP-Server. Unterstützt das Inhaftieren und Freilassen von Spielern mit Discord-Logging und flexibler Konfiguration.

-- Features

- `/jail [ID] [Sekunden]` – Inhaftiert einen Spieler
- `/release [ID]` – Entlässt einen Spieler aus dem Gefängnis
- Konfigurierbare Jail- und Release-Koordinaten
- Discord Webhook Logging
- Rechteverwaltung über definierte ESX Jobs (z. B. `police`, `sheriff`)
- Modernes ESX Import-System (kein `esx:getSharedObject` mehr)

-- Installation

1. Füge das Script in dein `resources`-Verzeichnis ein.
2. Stelle sicher, dass du `es_extended` installiert und korrekt konfiguriert hast.
3. Füge die Ressource in deiner `server.cfg` hinzu:


