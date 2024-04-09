ESX = exports["es_extended"]:getSharedObject()

local prezzo25 = STEFFONE.Prezzo25
local prezzo50 = STEFFONE.Prezzo50
local prezzo75 = STEFFONE.Prezzo75
local prezzo100 = STEFFONE.Prezzo100

Citizen.CreateThread(function()
    for k,v in pairs(STEFFONE.CordinateMarker) do
        TriggerEvent('gridsystem:registerMarker', {
            name = 'steffone_armour' .. k,
            pos = vector3(v.x,v.y,v.z),
            scale = vector3(1, 1, 1),
            msg = 'Premi [E] per interagire',
            control = 'E',
            type = 1,
            color = { r = 130, g = 120, b = 110 },
            action = function()
                local trigger = 'steffone:menudefault'
                if STEFFONE.ScegliMenu then
                    trigger = 'steffone:menuoxlib'
                end
                TriggerEvent(trigger)
            end
        })
    end
end)

RegisterNetEvent("steffone:menudefault", function()
    local ped = cache.ped
    local Elements = {
        {label = "Prendi armatura 25", name = "armatura25"},
        {label = "Prendi armatura 50", name = "armatura50"},
        {label = "Prendi armatura 75", name = "armatura75"},
        {label = "Prendi armatura 100", name = "armatura100"},
        {label = "Togli giubbo", name = "togligiubbo"},
    }

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Example_Menu", {
        title = "Example Menu",
        align = 'top-left',
        elements = Elements
    }, function(data, menu) 
        if data.current.name == "armatura25" then
            ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                if steffone then
                    SetPedArmour(ped, 25)
                    ESX.ShowNotification("Hai preso: 25%, e hai pagato: " .. prezzo25)
                
                end
            end, prezzo25)
        elseif data.current.name == "armatura50" then
            ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                if steffone then
                    SetPedArmour(ped, 50)
                    ESX.ShowNotification("Hai preso: 50% e hai pagato: " .. Prezzo50)
                end
            end, Prezzo50)
        elseif data.current.name == "armatura75" then
            ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                if steffone then
                    SetPedArmour(ped, 75)
                    ESX.ShowNotification("Hai preso: 75% e hai pagato: " .. prezzo75)
                end
            end, prezzo75)
        elseif data.current.name == "armatura100" then
            ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                if steffone then
                    SetPedArmour(ped, 100)
                    ESX.ShowNotification("Hai preso: 100% e hai pagato: " .. prezzo100)
                end
            end, prezzo100)
        elseif data.current.name == "togligiubbo" then
            ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                if steffone then
                    SetPedArmour(ped, 0)
                    ESX.ShowNotification("Hai tolto il giubbo")
                end
            end, prezzo)
        end
    end, function(data, menu) -- Funzione di cancellazione
        print("Chiusura del menu")
        menu.close() -- Chiusura del menu
    end)
end)

RegisterNetEvent("steffone:menuoxlib", function()
    local ped = cache.ped
    lib.registerContext({
        id = 'steffone_armatura',
        title = 'Prendi Armatura',
        options = {
            {
                title = 'Prendi Giubbo - 25',
                icon = "shield-halved",
                onSelect = function()
                    ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                        if steffone then
                            SetPedArmour(ped, 25)
                            ESX.ShowNotification("Hai preso: 25% e hai pagato: " .. prezzo25)
                        end
                    end, prezzo25)
                end
            },
            {
                title = 'Prendi Giubbo - 50',
                icon = "shield-halved",
                onSelect = function()
                    ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                        if steffone then
                            SetPedArmour(ped, 50)
                            ESX.ShowNotification("Hai preso: 50% e hai pagato: " .. prezzo50)
                        end
                    end, prezzo50)
                end
            },
            {
                title = 'Prendi Giubbo - 75',
                icon = "shield-halved",
                onSelect = function()
                    ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                        if steffone then
                            SetPedArmour(ped, 75)
                            ESX.ShowNotification("Hai preso: 75% e hai pagato: " .. prezzo75)
                        end
                    end, prezzo75)
                end
            },
            {
                title = 'Prendi Giubbo - 100',
                icon = "shield-halved",
                onSelect = function()
                    ESX.TriggerServerCallback('steffone:checkSoldi', function(steffone)
                        if steffone then
                            SetPedArmour(ped, 100)
                            ESX.ShowNotification("Hai preso: 100% e hai pagato: " .. prezzo100)
                        end
                    end, prezzo100)
                end
            },
            {
                title = 'Togli giubbo',
                icon = "x",
                onSelect = function()
                    SetPedArmour(ped, 0)
                    ESX.ShowNotification("Hai tolto il giubbo")
                end
            }
        }
    })
     
    lib.showContext('steffone_armatura')
end)