AddEventHandler('onResourceStarting', function(resourceName)
    if resourceName == 'Hive' then
        print('Name ist nicht Hive')
        CancelEvent()
    end
end)

AddEventHandler("onResourceStart", function()

    UpdateCheck()
    if config.webhook ~= "" then
        print(Locales[config.language]['webhook_enabled'])
        return
    end

    local message = Locales[config.language]['script_started']
    print(message)
end)

AddEventHandler("playerConnecting", PlayerConnecting)