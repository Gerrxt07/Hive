--[[ 
local ResourceName = "Hive"
local CurrentResourceName = GetCurrentResourceName()

AddEventHandler('onResourceStarting', function()
    if CurrentResourceName ~= ResourceName then
        print('Name ist nicht Hive')
        CancelEvent()
    end
end)

AddEventHandler("onResourceStart", function()
    if CurrentResourceName == ResourceName then
        UpdateCheck()

        local message = Locales[config.language]['script_started']
        print(message)

        if config.webhook ~= "" then
            print(Locales[config.language]['webhook_enabled'])
            return
        end
    end
end)
]]--

AddEventHandler("playerConnecting", PlayerConnecting)