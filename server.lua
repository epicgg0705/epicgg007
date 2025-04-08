-- Import von ESX
local ESX = exports["es_extended"]:getSharedObject()

-- Funktion zum Senden einer Nachricht an den Discord-Channel
function sendDiscordLog(message)
    local webhook = Config.DiscordWebhook
    local embed = {
        {
            ["color"] = Config.DiscordLogColor, -- Rot, konfigurierbar
            ["title"] = "Verhaftungs-Log",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "ESX Jail System"
            }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = "Jail Bot",
        embeds = embed
    }), {['Content-Type'] = 'application/json'})
end

-- Befehl initialisieren: /jail
RegisterCommand('jail', function(source, args, rawCommand)
    local initiator = source
    local targetPlayerID = tonumber(args[1])
    local jailTime = tonumber(args[2])

    -- Berechtigungsprüfung
    local initiatorPlayer = ESX.GetPlayerFromId(initiator)
    if not initiatorPlayer or not Config.AllowedJobs[initiatorPlayer.getJob().name] then
        TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Du hast keine Berechtigung, diesen Befehl zu verwenden!"}})
        return
    end

    if not targetPlayerID or not jailTime or jailTime <= 0 then
        TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Ungültige Parameter! Benutze: /jail [Spieler-ID] [Zeit in Sekunden]"}})
        return
    end

    local targetPlayer = ESX.GetPlayerFromId(targetPlayerID)
    if not targetPlayer then
        TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Spieler mit der angegebenen ID wurde nicht gefunden!"}})
        return
    end

    TriggerClientEvent('esx_jail:teleportToJail', targetPlayerID, Config.JailLocation)
    TriggerClientEvent('chat:addMessage', targetPlayerID, {args = {"System", "Du wurdest für " .. jailTime .. " Sekunden ins Gefängnis gesteckt!"}})
    TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Du hast Spieler " .. targetPlayerID .. " für " .. jailTime .. " Sekunden ins Gefängnis gesteckt!"}})

    sendDiscordLog("Spieler " .. GetPlayerName(initiator) .. " hat Spieler " .. GetPlayerName(targetPlayerID) .. " für " .. jailTime .. " Sekunden ins Gefängnis gesteckt.")

    Citizen.CreateThread(function()
        Citizen.Wait(jailTime * 1000)
        TriggerClientEvent('esx_jail:releaseFromJail', targetPlayerID)
        TriggerClientEvent('chat:addMessage', targetPlayerID, {args = {"System", "Du wurdest aus dem Gefängnis entlassen!"}})
    end)
end, false)

-- Befehl initialisieren: /release
RegisterCommand('release', function(source, args, rawCommand)
    local initiator = source
    local targetPlayerID = tonumber(args[1])

    local initiatorPlayer = ESX.GetPlayerFromId(initiator)
    if not initiatorPlayer or not Config.AllowedJobs[initiatorPlayer.getJob().name] then
        TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Du hast keine Berechtigung, diesen Befehl zu verwenden!"}})
        return
    end

    if not targetPlayerID then
        TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Ungültige Spieler-ID! Benutze: /release [Spieler-ID]"}})
        return
    end

    local targetPlayer = ESX.GetPlayerFromId(targetPlayerID)
    if not targetPlayer then
        TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Spieler mit der angegebenen ID wurde nicht gefunden!"}})
        return
    end

    TriggerClientEvent('esx_jail:releaseFromJail', targetPlayerID)
    TriggerClientEvent('chat:addMessage', targetPlayerID, {args = {"System", "Du wurdest aus dem Gefängnis entlassen!"}})
    TriggerClientEvent('chat:addMessage', initiator, {args = {"System", "Du hast Spieler " .. targetPlayerID .. " aus dem Gefängnis entlassen!"}})

    sendDiscordLog("Spieler " .. GetPlayerName(initiator) .. " hat Spieler " .. GetPlayerName(targetPlayerID) .. " aus dem Gefängnis entlassen.")
end, false)