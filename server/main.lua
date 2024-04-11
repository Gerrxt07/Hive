AddEventHandler('onResourceStarting', function(resourceName)
    if resourceName == 'Hive' then
        print('Name ist nicht Hive')
        CancelEvent()
    end
end)

AddEventHandler("onResourceStart", function()
    UpdateCheck()

    local message = Locales[config.language]['script_started']
    print(message)

    if config.webhook ~= "" then
        print(Locales[config.language]['webhook_enabled'])
        return
    end
end)

AddEventHandler("playerConnecting", PlayerConnecting)