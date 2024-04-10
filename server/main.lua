AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
    local player = source

    local name = GetPlayerName(player)
    local discord = GetPlayerIdentifierByType(player, 'discord')
    local steam = GetPlayerIdentifierByType(player, 'steam')
    local license = GetPlayerIdentifierByType(player, 'license')
    
    local ip = GetPlayerEndpoint(player)
    local tokens = GetPlayerTokens(player)

    print("^3[Prestige]: " .. "Name: " .. name .. "Discord: " .. discord .. "Steam: " .. steam .. "License: " .. license .. "IP: " .. ip)
    print("^3[Prestige]: Tokens:") 
    for k, v in pairs(tokens) do
        print(k, ":", v)
    end

    deferrals.done("NOPE!")
end)