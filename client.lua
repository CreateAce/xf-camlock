local QBCore = exports['qb-core']:GetCoreObject()

local cameraLockEnabled = false
local fixedCameraPitch = 0.0  -- Sabit dikey açı

RegisterCommand('kamerakilit', function()
    cameraLockEnabled = not cameraLockEnabled
    if cameraLockEnabled then
        QBCore.Functions.Notify("Kamera kilidi açıldı", "success")
        fixedCameraPitch = GetGameplayCamRelativePitch()
    else
        QBCore.Functions.Notify("Kamera kilidi kapandı", "error")
    end
end, false)

CreateThread(function()
    while true do
        local sleep = 1000

        if cameraLockEnabled then
            sleep = 0 

            SetGameplayCamRelativePitch(fixedCameraPitch, 0.0)
        end

        Wait(sleep)
    end
end)
