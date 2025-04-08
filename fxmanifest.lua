fx_version 'cerulean'
game 'gta5'

author 'epicgg007'
description 'ESX Jail System für GTA RP'
version '1.0.0'

-- Abhängigkeiten
dependencies {
    'es_extended',  -- ESX Framework
}

-- Import von ESX-Objekt
shared_script '@es_extended/imports.lua'

-- Server-Skripte
server_scripts {
    'server.lua',
    'config.lua', -- Konfigurationsdatei einbinden
}

-- Client-Skripte
client_scripts {
    'client.lua',
    'config.lua', -- Konfigurationsdatei einbinden
}

-- Sicherstellen, dass alle Dateien im richtigen Format sind
lua54 'yes'