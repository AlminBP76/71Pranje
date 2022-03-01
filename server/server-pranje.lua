ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('71Pranje:provjeraMozeLi')
AddEventHandler('71Pranje:provjeraMozeLi',function(kolicinaPranje)
    local igrac = ESX.GetPlayerFromId(source)
    local prljavePare = igrac.getAccount('black_money').money
    if prljavePare > kolicinaPranje and igrac.getAccount('black_money').money >= prljavePare then
        igrac.removeAccountMoney('black_money', kolicinaPranje)
        TriggerClientEvent("71Pranje:funkcijaPranje", source, kolicinaPranje)
    else
        TriggerClientEvent("esx:showNotification", source, "Nemas dovoljno prljavog kesa")
    end
end)

RegisterServerEvent('71Pranje:operiPare')
AddEventHandler('71Pranje:operiPare',function(kolicinaPranje)
	local igrac = ESX.GetPlayerFromId(source)
    if Konfig.provizija then
        local provizija = Konfig.provizijaProcenat
        local brisanje = kolicinaPranje / 100 * provizija
        local cistak = kolicinaPranje - brisanje
        igrac.addMoney(cistak)
        TriggerClientEvent("esx:showNotification", source, "Vase pare su oprane dobili ste: "..cistak.."€!")
    else
        igrac.addMoney(kolicinaPranje)
        TriggerClientEvent("esx:showNotification", source, "Vase pare su oprane dobili ste: "..kolicinaPranje.."€!")
    end
end)