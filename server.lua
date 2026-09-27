local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('SquareSyncAPISystem:GetData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM square_sync_data WHERE player_id = @player_id', {
            ['@player_id'] = xPlayer.identifier
        }, function(result)
            if result[1] then
                cb(json.decode(result[1].data))
            else
                cb({})
            end
        end)
    else
        cb({})
    end
end)

RegisterServerEvent('SquareSyncAPISystem:SyncData')
AddEventHandler('SquareSyncAPISystem:SyncData', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        -- Sync data with API
        PerformHttpRequest(Config.API.BaseURL .. '/sync', function(statusCode, response, headers)
            if statusCode == 200 then
                local data = json.decode(response)
                MySQL.Async.execute('INSERT INTO square_sync_data (player_id, data) VALUES (@player_id, @data) ON DUPLICATE KEY UPDATE data = @data', {
                    ['@player_id'] = xPlayer.identifier,
                    ['@data'] = json.encode(data)
                }, function(rowsChanged)
                    TriggerClientEvent('SquareSyncAPISystem:UpdateData', source, data)
                end)
            end
        end, 'GET', '', {})
    end
end)