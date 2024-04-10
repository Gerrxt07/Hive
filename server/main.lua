AddEventHandler('playerConnecting', function()
    local player = source

    local name = GetPlayerName(player)
    local discord = GetPlayerIdentifierByType(player, 'discord')
    local steam = GetPlayerIdentifierByType(player, 'steam')
    local license = GetPlayerIdentifierByType(player, 'license')
    
    local ip = GetPlayerEndpoint(player)
    local tokens = GetPlayerTokens(player)

    print(name, discord, steam, license, ip, tokens)

    deferrals.done("NOPE!")
end)