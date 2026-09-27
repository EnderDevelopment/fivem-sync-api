local ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while true do
        Citizen.Wait(Config.Sync.Interval)
        TriggerServerEvent('SquareSyncAPISystem:SyncData')
    end
end)

RegisterNetEvent('SquareSyncAPISystem:UpdateData')
AddEventHandler('SquareSyncAPISystem:UpdateData', function(data)
    -- Handle data update
    print('Data updated: ' .. json.encode(data))
end)