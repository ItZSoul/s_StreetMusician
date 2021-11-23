RegisterServerEvent('s_programmerjob:givemoney')
AddEventHandler('s_programmerjob:givemoney', function(money)
        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        xPlayer.Functions.AddMoney('cash', money)
end)
