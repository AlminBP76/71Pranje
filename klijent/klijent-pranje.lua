ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent("71Pranje:funkcijaPranje")
AddEventHandler("71Pranje:funkcijaPranje", function(kolicinaPranje)
    local cekanje = 25000
        exports.rprogress:Custom( ------------RPROGRESS MOZETE SA SVOJIM ZAMJENIT SAMO STAVITE ONDA DA VAM FREEZA IGRACA TJ DA SE NE MOZE MICATI
            {
                Async = true,
				Duration = cekanje,
                Label = "Novac se pere. . .",
				Easing = "easeLinear",
                DisableControls = {
                        Mouse = false,
                        Player = true,
                        Vehicle = true
                }
            },
            function(e)
                if not e then
                    ClearPedTasks(PlayerPedId())
                else
                    ClearPedTasks(PlayerPedId())
                end
            end) 
	Citizen.Wait(cekanje)
    TriggerServerEvent("71Pranje:operiPare", kolicinaPranje)
    end
end)

    exports.qtarget:AddBoxZone("ParoPraona", vector3(1135.65, -990.48, 46.11), 5.8, 2.4, {
        name="ParoPraona",
        heading=7,
        debugPoly=false,
        minZ=45.76,
        maxZ=47.56
    }, {
        options = {
        {
        event = "operi:pare",
        icon = "fas fa-money-bill",
        label = "Operi Pare",
        required_item = "kartica_pranje",
        },
    },
        distance = 4.0
    })

    
function operiPare(kolicinaPranje)
        local dialog = exports.zf_dialog:DialogInput({ --Trebalo bi da radi ako koristite nh_keyboard samo zamjenite export iz zf_dialog u nh_keyboard
            header = "Koliko novca zelite oprati?", 
            rows = {
                {
                    id = 0, 
                    txt = "Kolicina"
                }
            }
        })
        if dialog ~= nil then
            if dialog[1].input == nil then return end
            local kolicinaPranje = tonumber(dialog[1].input)
            TriggerServerEvent("71Pranje:provjeraMozeLi", kolicinaPranje)
		end
    end
end

AddEventHandler('operi:pare', function()
    operiPare(kolicinaPranje)
end)  


AddEventHandler("onResourceStop", function(res)
	if GetCurrentResourceName() == res then
	  exports.qtarget:RemoveZone('ParoPraona')
	end
  end) ----Za uklanjanje zone-a kad se stopa skripta----
---Protektajte od Exploitanja ovo, mozete ko sto je stifler uradio preko importsa u extendedu--------------------------
