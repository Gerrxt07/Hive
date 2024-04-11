AddEventHandler('onResourceStarting', function(resourceName)
    if resourceName == 'Hive' then
        print('Name ist nicht Hive')
        CancelEvent()
    end
end)

AddEventHandler("playerConnecting", PlayerConnecting)