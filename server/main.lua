RegisterServerEvent('s_programmerjob:dardinero')
AddEventHandler('s_programmerjob:dardinero', function()
        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)

        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)
        local money = math.random(1,10)
        xPlayer.Functions.AddMoney('cash', money)
        
end)