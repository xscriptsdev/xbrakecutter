ESX = exports["es_extended"]:getSharedObject()
local brakeDisabledVehicles = {}

local function disableBrakes(vehicle)
    brakeDisabledVehicles[vehicle] = true


    CreateThread(function()
        while brakeDisabledVehicles[vehicle] do
            local driver = GetPedInVehicleSeat(vehicle, -1)
            if driver == PlayerPedId() then
                DisableControlAction(0, 72, true) 
                DisableControlAction(0, 76, true) 
            end
            Wait(0)
        end
    end)
end

local function cutBrakes(vehicle)
    local playerPed = PlayerPedId()


    RequestAnimDict(Config.AnimationDict)
    while not HasAnimDictLoaded(Config.AnimationDict) do
        Wait(100)
    end

    TaskPlayAnim(playerPed, Config.AnimationDict, Config.AnimationName, 8.0, 8.0, Config.ProgressDuration, 1, 0, false, false, false)


    local success = lib.progressCircle({
        duration = Config.ProgressDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false,
        }
    })

    ClearPedTasks(playerPed)

    if success then
        
        disableBrakes(vehicle)

       
        lib.notify({
            title = Config.BrakesCut,
            description = Config.BrakesCutDesc,
            type = "success"
        })

        
        TriggerServerEvent('x-brakecutter:removeItem', Config.CuttingToolItem)
    else
        lib.notify({
            title = Config.Canceled,
            description = Config.CanceledDesc,
            type = "error"
        })
    end
end

local function attemptToCutBrakes(vehicle)
    ESX.TriggerServerCallback('x-brakecutter:checkItem', function(hasItem)
        if hasItem then
            cutBrakes(vehicle)
        else
            lib.notify({
                title = Config.NoItem,
                description = Config.NoItemDesc,
                type = "error"
            })
        end
    end, Config.CuttingToolItem)
end

local function fixBrakes(vehicle)
    local playerPed = PlayerPedId()


    RequestAnimDict(Config.FixAnimationDict)
    while not HasAnimDictLoaded(Config.FixAnimationDict) do
        Wait(100)
    end

    TaskPlayAnim(playerPed, Config.FixAnimationDict, Config.FixAnimationName, 8.0, 8.0, Config.FixProgressDuration, 1, 0, false, false, false)


    local success = lib.progressCircle({
        duration = Config.FixProgressDuration,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
            mouse = false,
        }
    })

    ClearPedTasks(playerPed)

    if success then
    
        if brakeDisabledVehicles[vehicle] then
            brakeDisabledVehicles[vehicle] = nil 

            lib.notify({
                title = Config.BrakesFixed,
                description = Config.BrakesFixedDesc,
                type = "success"
            })

        
            TriggerServerEvent('x-brakecutter:removeItem', Config.RepairKitItem)
        else
            lib.notify({
                title = Config.BrakesNotCut,
                description = Config.BrakesNotCutDesc,
                type = "info"
            })
        end
    else
        lib.notify({
            title = Config.Canceled,
            description = Config.CanceledDesc,
            type = "error"
        })
    end
end

local function attemptToFixBrakes(vehicle)
    ESX.TriggerServerCallback('x-brakecutter:checkItem', function(hasItem)
        if hasItem then
            fixBrakes(vehicle)
        else
            lib.notify({
                title = Config.NoRepairKit,
                description = Config.NoRepairKitDesc,
                type = "error"
            })
        end
    end, Config.RepairKitItem)
end

CreateThread(function()
    exports.ox_target:addGlobalVehicle({
        {
            name = 'cut_brakes',
            icon = 'fas fa-wrench',
            label = 'Cut Brakes',
            onSelect = function(data)
                attemptToCutBrakes(data.entity)
            end,
            distance = 2.0,
            bones = {'wheel_lr', 'wheel_rr', 'wheel_lf', 'wheel_rf'} 
        },
        {
            name = 'fix_brakes',
            icon = 'fas fa-tools',
            label = 'Fix Brakes',
            onSelect = function(data)
                attemptToFixBrakes(data.entity)
            end,
            distance = 2.0
        }
    })
end)
