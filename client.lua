RegisterNetEvent('esx_jail:teleportToJail')
AddEventHandler('esx_jail:teleportToJail', function(jailLocation)
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, jailLocation.x, jailLocation.y, jailLocation.z)
    TriggerEvent('chat:addMessage', {args = {"System", "Du wurdest ins Gefängnis gebracht!"}})
end)

RegisterNetEvent('esx_jail:releaseFromJail')
AddEventHandler('esx_jail:releaseFromJail', function()
    local playerPed = PlayerPedId()
    -- Beispiel: Spieler zum Hauptpolizeirevier teleportieren
    SetEntityCoords(playerPed, 425.1, -979.5, 30.7)  -- Koordinaten des Reviers oder anderer Ort
    TriggerEvent('chat:addMessage', {args = {"System", "Du wurdest aus dem Gefängnis entlassen!"}})
end)
