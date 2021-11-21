
local random_one
local random_two

playing = false

Citizen.CreateThread(function()

SpawnNPC('s_m_m_mariachi_01', vector4(309.19, 180.57, 102.91,155.42))

local playing = false

    while playing == false do 
        local _sleep = 1000
        local player = PlayerPedId()
        local _playerpos = GetEntityCoords(player)
        if #(_playerpos - vector3(309.19, 180.57, 103.91)) < 4 then 
            _sleep = 0
            Create3DText(vector3(309.19, 180.57, 104.91), "Press ~g~E~w~ to join the group")
            if IsControlJustPressed(0, 38) then 
                playing = true
                TaskGoStraightToCoord(player, 309.62, 179.88, 103.93,4,1,108.09,0.0)
                Wait(1000)
                    
                    Wait(1000)
                    SetEntityHeading(player, 108.09)
                    TaskStartScenarioInPlace(player, "WORLD_HUMAN_MUSICIAN", 0, false)
                    FreezeEntityPosition(player, true)
            end
        end
        Wait(_sleep)

    while playing == true do 
        local player = PlayerPedId()
        local _playerpos = GetEntityCoords(player)
        random_one = math.random(1,600)
        random_two = math.random(1,600)

        if #(_playerpos - vector3(309.19, 180.57, 103.91)) < 4 then 
            Create3DText(vector3(309.19, 180.57, 104.91), "Press ~r~X~w~ to leave the group")
            if IsControlJustPressed(0, 73) then 
                playing = false
                 FreezeEntityPosition(player, false)
                 ClearPedTasksImmediately(player)
                SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
            else if random_one == random_two then 
                Wait(_sleep)
                QBCore.Functions.Notify('Someone on the street gave you some money!', 'success', 10000)
                TriggerServerEvent('s_programmerjob:givemoney')

            else
                random_one = math.random(1,10)
                random_two = math.random(1,100000)
              
            end 
            end
        end
        Wait(_sleep)
    end
    end
end)










Create3DText = function(coords, text)
    local x, y, z = table.unpack(coords)
    local onScreen, _x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)
    local fov = (1/GetGameplayCamFov()) * 100
    local scale = scale*fov 
    if onScreen then 
        SetTextScale (0.0*scale, 0.55*scale)
        SetTextFont (0)
        SetTextProportional(1)
        SetTextColour(255,255,255,255)
        SetTextDropShadow (0,0,0,0,255)
        SetTextEdge(2,0,0,0,150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(5)
        AddTextComponentString(text)
        DrawText(_x,_y)
        end
    end


SpawnNPC = function(modelo, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do 
        Wait(1)
    end

    createNPC = CreatePed(5 , hash, x,y,z,h, false, true)
    FreezeEntityPosition(createNPC, true)
    SetEntityInvincible(createNPC, true)
    SetBlockingOfNonTemporaryEvents(createNPC, true)
    TaskStartScenarioInPlace(createNPC, "WORLD_HUMAN_MUSICIAN", 0, false)
end