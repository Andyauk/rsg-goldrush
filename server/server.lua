local QRCore = exports['qr-core']:GetCoreObject()

-- give reward
RegisterServerEvent('rsg-goldrush:server:reward')
AddEventHandler('rsg-goldrush:server:reward', function()
    local src = source
    local Player = QRCore.Functions.GetPlayer(src)
	local foundgold = math.random(1,100)
	if foundgold < Config.GoldChance then
		local chance = math.random(1,100)
		if chance <= 50 then
			local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			-- add items
			Player.Functions.AddItem(item1, Config.SmallRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item1], "add")
			TriggerClientEvent('QRCore:Notify', src, 'not much in this pan', 'primary')
		elseif chance >= 50 and chance <= 80 then -- medium reward
			local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			-- add items
			Player.Functions.AddItem(item1, Config.MediumRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item1], "add")
			Player.Functions.AddItem(item2, Config.MediumRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item2], "add")
			TriggerClientEvent('QRCore:Notify', src, 'looks like good gold', 'primary')
		elseif chance > 80 then -- large reward
			local item1 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			local item2 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			local item3 = Config.RewardItems[math.random(1, #Config.RewardItems)]
			-- add items
			Player.Functions.AddItem(item1, Config.LargeRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item1], "add")
			Player.Functions.AddItem(item2, Config.LargeRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item2], "add")
			Player.Functions.AddItem(item3, Config.LargeRewardAmount)
			TriggerClientEvent("inventory:client:ItemBox", src, QRCore.Shared.Items[item3], "add")
			TriggerClientEvent('QRCore:Notify', src, 'gold fever jackpot..', 'primary')
		end
	else
		TriggerClientEvent('QRCore:Notify', src, 'no gold this time..', 'primary')
	end
end)
