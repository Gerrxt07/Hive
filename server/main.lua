AddEventHandler('onResourceStarting', function(resourceName)
    if resourceName == 'Hive' then
        print('Name ist nicht Hive')
        CancelEvent()
    end
end)

AddEventHandler("onResourceStart", function()

    UpdateCheck()
    if config.webhook ~= "" then
        print("^4Webhook gefunden!")
        return
    end

    local message = Locales[config.language]['script_started']
    local discordmessage = string.sub(message, 15)
    print(message)
    SendWebhook(config.webhook, discordmessage)
end)

AddEventHandler("playerConnecting", PlayerConnecting)