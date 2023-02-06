local canReset = true

ESX = nil

Citizen.CreateThread(function()
  while ESX == nil do
    Citizen.Wait(30)
    TriggerEvent('esx:getSharedObject', function(obj)
      ESX = obj
    end)
  end
end)

AddEventHandler("keyinterface:pressed", function(keyindex)
  if canReset and keyindex == "n" and IsControlPressed(0, 21) then
    canReset = false
    ESX.ShowNotification("~b~Dein Skin wurde neu geladen!")
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
      TriggerEvent('skinchanger:loadSkin', skin)
    end)
    Citizen.Wait(15000)
    canReset = true
  end
end)