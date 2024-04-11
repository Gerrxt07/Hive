AddEventHandler('playerConnecting', function(err, deferrals)
    deferrals.defer()
    deferrals.update("LOCALE: Checking identifier...")
    Citizen.wait(1000)

    local player = source
    local identifier = GetPlayerIdentifiers(player)

    local steam = false
    local discord = false

    for k,v in pairs(identifier) do
        if v:find("steam:") then
            steam = true
        end
        if v:find("discord:") then
            discord = true
        end
    end
    if not steam then
        err("LOCALE: Steam required...")
        CancelEvent()
        return
    end

    if not discord then
        err("LOCALE: Discord required...")
        CancelEvent()
        return
    end

    local name = GetPlayerName(player)
    local ip = GetPlayerEndpoint(player)
    local tokens = GetPlayerTokens(player)

    deferrals.done("TEST DEATH END")
end)