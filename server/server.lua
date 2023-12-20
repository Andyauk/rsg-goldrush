local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-goldrush/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-- give reward
RegisterServerEvent('rsg-goldrush:server:reward')
AddEventHandler('rsg-goldrush:server:reward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
	local foundgold = math.random(1,100)
	if foundgold < Config.GoldChance then
		local chance = math.random(1,100)
		if chance <= 50 then
			local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			-- add items
			Player.Functions.AddItem(item1, Config.SmallRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
			TriggerClientEvent('ox_lib:notify', src, {title = 'Primary', description = 'not much in this pan', type = 'primary', duration = 5000 })
		elseif chance >= 50 and chance <= 80 then -- medium reward
			local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			-- add items
			Player.Functions.AddItem(item1, Config.MediumRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
			Player.Functions.AddItem(item2, Config.MediumRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
			TriggerClientEvent('ox_lib:notify', src, {title = 'Primary', description = 'looks like good gold', type = 'primary', duration = 5000 })
		elseif chance > 80 then -- large reward
			local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			-- add items
			Player.Functions.AddItem(item1, Config.LargeRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item1], "add")
			Player.Functions.AddItem(item2, Config.LargeRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item2], "add")
			Player.Functions.AddItem(item3, Config.LargeRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[item3], "add")
			TriggerClientEvent('ox_lib:notify', src, {title = 'Primary', description = 'gold fever jackpot..', type = 'primary', duration = 5000 })
		end
	else
		TriggerClientEvent('ox_lib:notify', src, {title = 'Primary', description = 'no gold this time..', type = 'primary', duration = 5000 })
	end
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
