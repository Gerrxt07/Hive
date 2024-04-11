AddEventHandler("onResourceStart", function()
    if config.check_for_updates == true then

        local currentVersion = config.version
        PerformHttpRequest("https://api.github.com/repos/Gerrxt07/Hive/releases/latest", function(responseCode, resultData, resultHeaders)
            if responseCode == 200 then
                local releaseData = json.decode(resultData)
                local latestVersion = releaseData.tag_name

                if currentVersion < latestVersion then
                    local message = Locales[config.language]['new_update']
                    local discordmessage = string.sub(message, 15)
                    print(message)
                    SendWebhook(config.webhook, discordmessage)
                else
                    local message = Locales[config.language]['no_update']
                    local discordmessage = string.sub(message, 15)
                    print(message)
                    SendWebhook(config.webhook, discordmessage)
                end

            else
                local message = Locales[config.language]['update_server_error']
                local discordmessage = string.sub(message, 15)
                print(message)
                SendWebhook(config.webhook, discordmessage)
            end
        end, "GET", "", {})

    end


    local message = Locales[config.language]['script_started']
    local discordmessage = string.sub(message, 15)
    print(message)
    SendWebhook(config.webhook, discordmessage)

end)