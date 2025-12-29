local lastVehicle = nil
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 then
            lastVehicle = veh
        end
        Wait(500)
    end
end)

local function getClosestLastVehicle()
    if not lastVehicle or not DoesEntityExist(lastVehicle) then
        notify('No vehicle found!', 'error')
        return nil
    end
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local vehCoords = GetEntityCoords(lastVehicle)
    local dist = #(pedCoords - vehCoords)
    if dist < (Config.StationDistance or 5.0) then
        return lastVehicle
    end
    debugPrint(('Too far from vehicle: %.2f > %.2f'):format(dist, Config.StationDistance or 5.0))
    notify('You are too far from your vehicle!', 'error')
    return nil
end


for _, blipData in pairs(Config.Blips or {}) do
    local blip = AddBlipForCoord(blipData.x, blipData.y, blipData.z)
    SetBlipSprite(blip, blipData.id)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, blipData.Scale)
    SetBlipColour(blip, blipData.Color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(blipData.Name)
    EndTextCommandSetBlipName(blip)
end

exports.ox_target:addModel(Config.FuelStations, {
    {
        distance = 2.0,
        icon = "fa-solid fa-gas-pump",
        label = 'Refuel Vehicle',
        onSelect = function()
            local veh = getClosestLastVehicle()
            if not veh then return end

            local vmodel = GetEntityModel(veh)
            local class = GetVehicleClass(veh)

            if Config.ElectricVehicles and Config.ElectricVehicles[vmodel] then
                notify('This vehicle is electric and cannot be refueled!', 'error')
                return
            end

            if Config.BlacklistedClasses and Config.BlacklistedClasses[class] or Config.BlacklistedVehicles and Config.BlacklistedVehicles[vmodel] then
                notify('This vehicle cannot be refueled at a station!', 'error')
                return
            end

            local tank = getTankSize(veh)
            SetVehicleFuelLevel(veh, tank)
            TriggerServerEvent('kid-fuel:set', VehToNet(veh), tank)
            notify('Vehicle refueled!', 'success')
        end
    }
})

exports.ox_target:addModel(Config.EVStations, {
    {
        distance = 2.0,
        icon = "fa-solid fa-charging-station",
        label = 'Recharge Vehicle',
        onSelect = function()
            local veh = getClosestLastVehicle()
            if not veh then return end

            local vmodel = GetEntityModel(veh)
            if not Config.ElectricVehicles or not Config.ElectricVehicles[vmodel] then
                notify('This vehicle is not electric and cannot be recharged!', 'error')
                return
            end

            local class = GetVehicleClass(veh)
            if Config.BlacklistedClasses and Config.BlacklistedClasses[class] or Config.BlacklistedVehicles and Config.BlacklistedVehicles[vmodel] then
                notify('This vehicle cannot be recharged at a station!', 'error')
                return
            end

            local battery = getTankSize(veh)
            SetVehicleFuelLevel(veh, battery)
            TriggerServerEvent('kid-fuel:set', VehToNet(veh), battery)
            notify('Vehicle recharged!', 'success')
        end
    }

})


function removeStationModels()
    for _, model in ipairs(Config.FuelStations or {}) do
        exports.ox_target:removeModel(model)
    end
    for _, model in ipairs(Config.EVStations or {}) do
        exports.ox_target:removeModel(model)
    end
end