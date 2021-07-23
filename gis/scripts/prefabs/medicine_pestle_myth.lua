local assets =
{
    Asset("ANIM", "anim/pound_medicine_myth.zip"),
    Asset("ANIM", "anim/medicine_pestle_anim.zip"),
    Asset("ANIM", "anim/medicine_pestle_anim_frog.zip"),
    Asset("ANIM", "anim/medicine_pestle_anim_winter.zip"),
	
    Asset("ANIM", "anim/swap_medicine_pestle_myth.zip"),
	
	Asset("ATLAS", "images/inventoryimages/medicine_pestle_myth.xml"),
}

local function onequip(inst, owner)
	inst.components.myth_itemskin:OverrideSymbol(owner, "swap_object")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    end
end

--特殊物品特殊作用
local specileffct = {
	deerclops_eyeball = function(player,item) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			player.components.health:DoDelta(60)
			if player.components.debuffable ~= nil and player.components.debuffable:IsEnabled() then
				player.components.debuffable:AddDebuff("myth_freezebuff", "myth_freezebuff")
			end
		end
	end, --巨鹿
	moonbutterflywings	= function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			player.components.health:DoDelta(15)
			if player.components.sanity then
				player.components.sanity:DoDelta(20)
			end
		end
	end, --月蛾翅膀
	cactus_meat	= function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.sanity then
				player.components.sanity:DoDelta(15)
			end
		end
	end, --	仙人掌肉
	cactus_flower = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			player.components.health:DoDelta(20)
			if player.components.sanity then
				player.components.sanity:DoDelta(15)
			end
			if player.components.debuffable ~= nil and player.components.debuffable:IsEnabled() then
				player.components.debuffable:AddDebuff("myth_sanity_regenbuff", "myth_sanity_regenbuff")
			end		
		end
	end ,--	仙人掌花
	spidergland	= function(player)
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if not player:HasTag("white_bone") then
				player.components.health:DoDelta(20)
			end
		end	
	end, --	蜘蛛腺
	royal_jelly	= function(player) 
        if player.components.debuffable ~= nil and player.components.debuffable:IsEnabled() and
            not (player.components.health ~= nil and player.components.health:IsDead()) and
            not player:HasTag("playerghost") then
            player.components.debuffable:AddDebuff("healthregenbuff", "healthregenbuff")
        end	
	end, --蜂王浆
	foliage	= function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if not player:HasTag("white_bone") then
				player.components.health:DoDelta(8)
			end
		end	
	end, --	蕨叶
	mandrake = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if not player:HasTag("white_bone") then
				player.components.health:DoDelta(300)
			end
		end
	end, --	曼德拉草
	wormlight = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.eater then
				for k =1 ,2 do			
					local item = SpawnPrefab("wormlight")
					if player.components.eater:CanEat(item) then
						player.components.eater:Eat(item)
					else
						item:Remove()
					end
				end
			end
		end	
	end, --	发光浆果
	wormlight_lesser = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.eater then
				for k =1 ,2 do
					local item = SpawnPrefab("wormlight_lesser")
					if player.components.eater:CanEat(item) then
						player.components.eater:Eat(item)
					else
						item:Remove()
					end
				end
			end
		end
	end ,--	小发光浆果
	lightbulb = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.sanity then
				player.components.sanity:DoDelta(5)
			end
		end	
	end ,--	荧光果
	petals = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.sanity then
				player.components.sanity:DoDelta(5)
			end
		end		
	end, --	花瓣
	butterflywings = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if not player:HasTag("white_bone") then
				player.components.health:DoDelta(8)
			end
		end
	end, --	蝴蝶翅膀
	succulent_picked = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if not player:HasTag("white_bone") then
				player.components.health:DoDelta(20)
			end
		end	
	end, --多肉
	lightninggoathorn = function(player) 
        if player.components.debuffable ~= nil and player.components.debuffable:IsEnabled() and
            not (player.components.health ~= nil and player.components.health:IsDead()) and
            not player:HasTag("playerghost") then
            player.components.debuffable:AddDebuff("buff_electricattack", "buff_electricattack")
        end	
	end,--羊角
	minotaurhorn = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			player.components.health:DoDelta(300)
		elseif	player:HasTag("playerghost") then
			player:PushEvent("respawnfromghost")
		end
	end, --犀牛角
	moon_tree_blossom = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.sanity then
				player.components.sanity:DoDelta(5)
			end
		end
	end,--月树花
	
	plantmeat = function(player) 
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.moisture then
				player.components.moisture:DoDelta(-15)
			end
		end
	end,--叶肉
}

local moshtree_spore = {
	spore_tall = true,
	spore_medium = true,
	spore_small = true,
}

local IngredientValues = {
	fruit = function(player, values)
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			if player.components.sanity then
				player.components.sanity:DoDelta(values or 0)
			end
		end	
	end,
	veggie = function(player, values)
		if player.components.health and not player.components.health:IsDead() and not player:HasTag("playerghost") then
			player.components.health:DoDelta(values or 0)
		end
	end,
}


local cooking = require("cooking")
local ingredients = cooking.ingredients
local function checkfoodvalue(food)
	if ingredients[food.prefab] ~= nil then
		local tags = ingredients[food.prefab].tags
		if tags.fruit ~= nil then
			food.addvalue = tags.fruit > 0.5 and 15 or 5
			return IngredientValues.fruit,food.addvalue
		elseif  tags.veggie ~= nil then
			food.addvalue = tags.veggie > 0.5 and 20 or 8
			return IngredientValues.veggie,food.addvalue
		end
	end
	return nil,0
end

local function spawnfx(inst)
    local fx = SpawnPrefab("myth_yutu_heal_fx")
    fx.entity:AddFollower():FollowSymbol(inst.GUID, inst.components.combat.hiteffectsymbol, 0, -50, 0)
    fx:Setup(inst)
end
				
local function addbuff(inst,player,fn1,fn2)
	local projectile = SpawnPrefab("myth_sparkle")
	if projectile then
		projectile.Transform:SetPosition(inst.Transform:GetWorldPosition())
		if  projectile.components.projectile then
			projectile.components.projectile:SetOnHitFn(function(hua, owner, target)
				if target:IsValid() then
					if fn1.fn ~= nil then
						fn1.fn(target,fn1.valus)
						spawnfx(target)
					end
					hua:Remove()
				end
			end)
			projectile.components.projectile:Throw(projectile, player)
		end	
	end
end
--潘晓效果
local function HearPanFlute(inst, musician, instrument)
    if inst ~= musician and
        (TheNet:GetPVPEnabled() or not inst:HasTag("player")) and
        not (inst.components.freezable ~= nil and inst.components.freezable:IsFrozen()) and
        not (inst.components.pinnable ~= nil and inst.components.pinnable:IsStuck()) and
        not (inst.components.fossilizable ~= nil and inst.components.fossilizable:IsFossilized()) then
        local mount = inst.components.rider ~= nil and inst.components.rider:GetMount() or nil
        if mount ~= nil then
            mount:PushEvent("ridersleep", { sleepiness = 10, sleeptime = TUNING.PANFLUTE_SLEEPTIME })
        end
        if inst.components.sleeper ~= nil then
            inst.components.sleeper:AddSleepiness(10, TUNING.PANFLUTE_SLEEPTIME)
        elseif inst.components.grogginess ~= nil then
            inst.components.grogginess:AddGrogginess(10, TUNING.PANFLUTE_SLEEPTIME)
        else
            inst:PushEvent("knockedout")
        end
    end
end

local function onmandrake(musician)
    local x, y, z = musician.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, TUNING.PANFLUTE_SLEEPRANGE, nil, { "FX", "DECOR", "INLIMBO" })
    for i, v in ipairs(ents) do
		HearPanFlute(v, musician)
    end
end

local function daoyao(inst,slot)
	inst.task[slot] = nil
	if inst.owner and inst.owner:IsValid() then
		local container = inst.components.container
		local fns = {[slot] = {}}
		local item = container:GetItemInSlot(slot)
		if item ~= nil then
			if inst.owner and inst.owner.components.hunger then
				inst.owner.components.hunger:DoDelta(-2)
			end
			if item.prefab == "mandrake" then
				onmandrake(inst.owner)
				spawnfx(inst.owner)
			end
			--if moshtree_spore[item.prefab] then
			--	forplant(inst.owner)
			--	spawnfx(inst.owner)
			--end			
			if specileffct[item.prefab] ~= nil then
				fns[slot].fn = specileffct[item.prefab]
			else 
				fns[slot].fn, fns[slot].valus = checkfoodvalue(item)
			end
			container:RemoveItem(container:GetItemInSlot(slot)):Remove()
		end	
		if fns[slot].fn ~= nil then
			fns[slot].fn(inst.owner,fns[slot].valus)
			spawnfx(inst.owner)
		end
		local x, y, z = inst.owner.Transform:GetWorldPosition()
		local ents = TheSim:FindEntities(x, 0, z, 15, {"player"})
		for i, v in ipairs(ents) do
			if v ~= inst.owner then
				addbuff(inst.owner,v,fns[slot])
			end
		end
	end
end

local function onget(inst,data)
	if data and data.slot then
		if	inst.task[data.slot] ~= nil then
			inst.task[data.slot]:Cancel()
		end
		inst.task[data.slot] = inst:DoTaskInTime(3,function() daoyao(inst,data.slot) end)
	end
end

local function onlose(inst,data)
	if data and data.slot then
		if	inst.task[data.slot] ~= nil then
			inst.task[data.slot]:Cancel()
			inst.task[data.slot] = nil
		end
	end
end

local function containerfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()

    if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst) 
			inst.replica.container:WidgetSetup("medicine_pestle_myth") 
		end
        return inst
    end
	inst.task = {}
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("medicine_pestle_myth")
	inst.components.container.OnRemoveEntity = inst.components.container.DropEverything

	inst.persists = false
	
    inst:ListenForEvent("itemget", onget)
    inst:ListenForEvent("itemlose", onlose)
		
    return inst
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("swap_medicine_pestle_myth")
    inst.AnimState:SetBuild("swap_medicine_pestle_myth")
    inst.AnimState:PlayAnimation("idle_none")

    inst:AddTag("sharp")
    inst:AddTag("pointy")
	inst:AddTag("medicine_pestle_myth")
    inst:AddTag("weapon")
	inst:AddTag("myth_removebydespwn")
	
	MakeInventoryFloatable(inst)
	
    inst:AddComponent("myth_itemskin")
    inst.components.myth_itemskin.character = 'myth_yutu'
    inst.components.myth_itemskin.prefab = 'medicine_pestle_myth'
    inst.components.myth_itemskin:SetData{
        frog = {
            swap = {build = "swap_medicine_pestle_myth", folder = "swap_frog"},
            icon = {atlas = "medicine_pestle_myth.xml", image = "medicine_pestle_myth_frog"},
            anim = {bank = "swap_medicine_pestle_myth", build = "swap_medicine_pestle_myth", anim = "idle_frog"},
        },
        winter = {
        	swap = {build = "swap_medicine_pestle_myth", folder = "swap_winter"},
            icon = {atlas = "medicine_pestle_myth.xml", image = "medicine_pestle_myth_winter"},
            anim = {bank = "swap_medicine_pestle_myth", build = "swap_medicine_pestle_myth", anim = "idle_winter"},
        },
        default = {
            swap = {build = "swap_medicine_pestle_myth", folder = "swap_none"},
            icon = {atlas = "medicine_pestle_myth.xml", image = "medicine_pestle_myth"},
            anim = {bank = "swap_medicine_pestle_myth", build = "swap_medicine_pestle_myth", anim = "idle_none"},
        },
    }
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(51)
	inst.components.weapon:SetRange(-0.3)

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/medicine_pestle_myth.xml"
	
    inst:AddComponent("equippable")
	inst.components.equippable.restrictedtag = "myth_yutu"
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("medicine_pestle_myth", fn, assets),
	Prefab("medicine_pestle_container_myth", containerfn)
