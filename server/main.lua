RegisterServerEvent('s_programmerjob:givemoney')
AddEventHandler('s_programmerjob:givemoney', function()
        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)

        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local money = math.random(1,10)
        xPlayer.Functions.AddMoney('cash', money)
        
end)