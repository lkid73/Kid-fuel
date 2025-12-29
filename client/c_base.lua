SetFuelConsumptionState(true)
SetFuelConsumptionRateMultiplier(Config.FuelMultiplier)

local function initFuel(vehicle)
    if not DoesVehicleUseFuel(vehicle) then return end

    local class = GetVehicleClass(vehicle)
    local model = GetEntityModel(vehicle)
    if Config.BlacklistedClasses[class] or Config.BlacklistedVehicles[model] then
        SetFuelConsumptionState(false)
        debugPrint(('Fuel consumption disabled for blacklisted vehicle %s or class %s'):format(model, class))
        return
    else
        SetFuelConsumptionState(true)
        debugPrint(('Fuel consumption enabled for vehicle %s of class %s'):format(model, class))
    end

    local state = Entity(vehicle).state
    if state.fuel then
        SetVehicleFuelLevel(vehicle, state.fuel)
        return
    end

    local tank = getTankSize(vehicle)
    local fuel = tank

    if Config.RandomFuel.enabled then
        local percent = math.random(Config.RandomFuel.min, Config.RandomFuel.max)
        fuel = tank * (percent / 100)
    end

    SetVehicleFuelLevel(vehicle, fuel)
    TriggerServerEvent('kid-fuel:set', VehToNet(vehicle), fuel)

    debugPrint(('Initialized fuel %.2f / %.2f'):format(fuel, tank))
end

CreateThread(function()
    local lastVehicle = nil
    while true do
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            local class = GetVehicleClass(vehicle)
            local model = GetEntityModel(vehicle)
            if Config.BlacklistedClasses[class] or Config.BlacklistedVehicles[model] then
                SetFuelConsumptionState(false, vehicle)
            else
                SetFuelConsumptionState(true, vehicle)
            end
            if vehicle ~= lastVehicle then
                initFuel(vehicle)
                lastVehicle = vehicle
            end
            local fuel = GetVehicleFuelLevel(vehicle)
            TriggerServerEvent('kid-fuel:set', VehToNet(vehicle), fuel)
            TriggerServerEvent('kid-fuel:get', VehToNet(vehicle))
        else
            lastVehicle = nil
        end

        Wait(3000)
    end
end)

exports('GetFuel', function(vehicle)
    return GetVehicleFuelLevel(vehicle)
end)

exports('SetFuel', function(vehicle, amount)
    SetVehicleFuelLevel(vehicle, amount)
    TriggerServerEvent('kid-fuel:set', VehToNet(vehicle), amount)
end)

exports('GetTankSize', function(vehicle)
    return getTankSize(vehicle)
end)
