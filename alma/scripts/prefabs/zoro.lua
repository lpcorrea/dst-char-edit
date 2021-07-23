
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}
local start_inv = {
	-- Custom starting items
	"zorosheath",
	"zoroswordmouth",
	"shusui",
	"sandai",	
}

local untouchables = {
    crow = true,
    robin = true,
    robin_winter = true,
	smallbird = true,
	chester = true,
	
}    
 
-- This initializes for both clients and the host
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "zoro.tex" )
	inst:AddTag("zorospecific")
	
	inst:DoTaskInTime(0, function()
		local old = inst.replica.combat.IsValidTarget
		inst.replica.combat.IsValidTarget = function(self, target)
			if target and untouchables[target.prefab] then
				return false
			end
			return old(self, target)
		end
	end)
end

-- This initializes for the host only
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "wolfgang"
	-- Stats	
	inst.components.health:SetMaxHealth(300)
	inst.components.hunger:SetMax(300)
	inst.components.sanity:SetMax(300)
end

return MakePlayerCharacter("zoro", prefabs, assets, common_postinit, master_postinit, start_inv)
