function getTankSize(vehicle)
    local size = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fPetrolTankVolume')
    if size <= 0.0 then
        size = Config.DefaultTankSize
    end
    return size
end

function notify(msg, type)
    if Config.notification == "custom" then
        -- Custom notification logic here
    elseif Config.notification == "ox_lib" then
        lib.notify({
            title = "Fuel Station",
            description = msg,
            type = type or "info"
        })
    elseif Config.notification == "standalone" then
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(false, false)
    end
end

function debugPrint(msg)
    if Config.Debug then
        print('[FuelSystem][Station]', msg)
    end
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if removeStationModels then removeStationModels() end
    end
end)
