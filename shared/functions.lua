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
    deferrals.update(Locales[config.language]['identifier_check'])
    Wait(1000)

    local steam = false
    local discord = false
    local discordID = nil

    for _, v in pairs(identifiers) do
        if v:find("steam:") then
            steam = true
        end
        if v:find("discord:") then
            discord = true
            discordID = v:sub(9) -- Extract ID assuming format is "discord:1234567890"
        end
    end


    Wait(100)
    
    if not steam then
        deferrals.done(Locales[config.language]['identifier_nosteam'])
        return
    end

    if not discord then
        deferrals.done(Locales[config.language]['identifier_nodiscord'])
        return
    end

    if discord and steam then
        deferrals.update("Verifying on Discord...") -- Update the message

        -- Send HTTP request to Discord bot (using HTTP client of your choice)
        PerformHttpRequest('http://194.9.6.54:3000/verify', function(err, text, headers)
            if not err and text == "success" then
                deferrals.done("TEST DEATH END - ALLOWED") -- Allow player to join
            else
                deferrals.done("Discord verification failed. Please join our Discord for instructions.")
            end
        end, 'POST', json.encode({ discordId = discordID })) 
    else
        deferrals.done(Locales[config.language]['identifier_nodiscord'])
    end

    -- // TODO Add MYSQL Whitelist Check

    deferrals.done("TEST DEATH END")
end

function UpdateCheck()
    if config.check_for_updates == true then

        local currentVersion = config.version
        PerformHttpRequest("https://api.github.com/repos/Gerrxt07/Hive/releases/latest", function(responseCode, resultData, resultHeaders)
            if responseCode == 200 then
                local releaseData = json.decode(resultData)
                local latestVersion = releaseData.tag_name

                if currentVersion < latestVersion then
                    local message = Locales[config.language]['new_update']
                    local discordmessage = string.sub(message, 11)
                    print(message)
                    SendWebhook(config.webhook, discordmessage)
                else
                    local message = Locales[config.language]['no_update']
                    local discordmessage = string.sub(message, 11)
                    print(message)
                    SendWebhook(config.webhook, discordmessage)
                end

            else
                local message = Locales[config.language]['update_server_error']
                local discordmessage = string.sub(message, 11)
                print(message)
                SendWebhook(config.webhook, discordmessage)
            end
        end, "GET", "", {})

    end
end