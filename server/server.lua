ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('x-brakecutter:checkItem', function(source, cb, itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(itemName).count > 0 then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('x-brakecutter:cutBrakes', function(vehicleNetId)
    TriggerClientEvent('x-brakecutter:disableBrakes', -1, vehicleNetId)
end)

RegisterNetEvent('x-brakecutter:removeItem', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(itemName, 1)
end)




