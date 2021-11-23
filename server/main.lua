RegisterServerEvent('s_programmerjob:givemoney')
AddEventHandler('s_programmerjob:givemoney', function(money)
        local src = source
        local xPlayer = QBCore.Functions.GetPlayer(src)

        if money <= Config.max_money then
                xPlayer.Functions.AddMoney('cash', money)
        else
                print("Player with ID: ".. src .." is trying to get money")
        end
end)
