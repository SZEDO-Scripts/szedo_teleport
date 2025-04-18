CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        for i, location in ipairs(Config.Locations) do
            local dist = #(playerCoords - location.marker)

            if dist < 10.0 then
                sleep = 0
                DrawMarker(Config.MarkerType, location.marker.x, location.marker.y, location.marker.z - 1.0,
                           0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                           Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z,
                           Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a,
                           false, true, 2, false, nil, nil, false)

                if dist < 1.5 then
                    ShowHelpNotification("Press ~INPUT_CONTEXT~ to travel.")
                    if IsControlJustReleased(0, Config.InteractKey) then
                        TeleportPlayer(location.teleport)
                    end
                end
            end
        end

        Wait(sleep)
    end
end)

function TeleportPlayer(coords)
    DoScreenFadeOut(500)
    Wait(500)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z)
    Wait(500)
    DoScreenFadeIn(500)
    SendNotify("You have successfully teleported!")
end

function SendNotify(msg)
    if Config.NotifyType == "okokNotify" then
        exports['okokNotify']:Alert("Teleport", msg, 5000, 'info')
    else
        print("[NOTIFY]", msg)
    end
end

function ShowHelpNotification(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end
