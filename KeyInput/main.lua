local REGISTERS = {
--    "a",
--    "b",
--    "c",
--    "d",
    "e",
--    "f",
--    "g",
--    "h",
--    "i",
--    "j",
--    "k",
    "l",
--    "m",
    "n",
--    "o",
--    "p",
--    "q",
--    "r",
--    "s",
--    "t",
    "u",
--    "v",
--    "w",
--    "x",
--    "y",
--    "z",
    "HOME",
    "LEFT",
    "RIGHT",
    "UP",
}

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    for _, v in ipairs(REGISTERS) do
        print("[core-keyinterface] Registering new Keybind [" .. v .. "]")
        RegisterKeyMapping('+triggerkeybind ' .. v, 'Internal Keybind [' .. v .. ']', 'keyboard', v)
    end
end)

RegisterCommand("+triggerkeybind", function(source, args, rawCommand)
    TriggerEvent("keyinterface:pressed", args[1])
end)

RegisterCommand("-triggerkeybind", function(source, args, rawCommand)
    TriggerEvent("keyinterface:released", args[1])
end)