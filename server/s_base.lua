local Vehicles = {}

RegisterNetEvent('fuel:set', function(netId, fuel)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end

    Entity(entity).state.fuel = fuel
    Vehicles[netId] = fuel

    debugPrint(('Fuel set for %s: %.2f'):format(netId, fuel))
end)

RegisterNetEvent('fuel:get', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(entity) then return end

    local fuel = Vehicles[netId] or Entity(entity).state.fuel or 0
    debugPrint(('Fuel retrieved for %s: %.2f'):format(netId, fuel))
end)

AddEventHandler('entityRemoved', function(entity)
    if not DoesEntityExist(entity) then return end

    local netId = NetworkGetNetworkIdFromEntity(entity)
    if Vehicles[netId] then
        Vehicles[netId] = nil
        debugPrint('Cleaned fuel data for netId '..netId)
    end
end)
