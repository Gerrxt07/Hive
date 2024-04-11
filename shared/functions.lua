-- Webhook-Function to send messages to an discord webhook
function SendWebhook(webhookURL, message)
    local webhookURL = webhookURL

    if webhookURL ~= "" then
        local postData = {
            content = message,
        }
        PerformHttpRequest(webhookURL, function(_, _, _) end, 'POST', json.encode(postData), { ['Content-Type']= 'application/json' })
    end
    
end

function PlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local identifiers = GetPlayerIdentifiers(player)
    
    deferrals.defer()
    deferrals.update("LOCALE: Checking identifier...")
    Citizen.wait(1000)

    local steam = false
    local discord = false

    for _, v in pairs(identifiers) do
        if v:find("steam:") then
            steam = true
        end
        if v:find("discord:") then
            discord = true
        end
    end

    Citizen.wait(100)
    
    if not steam then
        deferrals.done("LOCALE: Steam required...")
        return
    end

    if not discord then
        deferrals.done("LOCALE: Discord required...")
        return
    end

    deferrals.done("TEST DEATH END")
end