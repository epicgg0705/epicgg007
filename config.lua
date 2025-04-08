Config = {}

-- Koordinaten des Gefängnisses, wohin Spieler teleportiert werden, wenn sie verhaftet werden
Config.JailLocation = {
    x = 1686.03,
    y = 2516.92,
    z = 45.56
}

-- Die Koordinaten des Ortes, an den Spieler entlassen werden (z.B. Polizeirevier)
Config.ReleaseLocation = {
    x = 425.1,
    y = -979.5,
    z = 30.7
}

-- Discord Webhook für die Log-Nachrichten
Config.DiscordWebhook = "https://discord.com/api/webhooks/YOUR_WEBHOOK_URL_HERE"

-- Jobs, die berechtigt sind, den /jail- und /release-Befehl auszuführen
Config.AllowedJobs = {
    police = true,
    sheriff = true, -- Füge hier weitere berechtigte Jobs hinzu, wenn nötig
}

-- Farben für das Discord-Log (optional)
Config.DiscordLogColor = 16711680 -- Rot, du kannst die Farbe ändern, falls gewünscht
