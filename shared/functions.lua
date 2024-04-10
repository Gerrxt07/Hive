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