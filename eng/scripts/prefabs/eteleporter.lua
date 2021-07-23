require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/eteleporter.zip"),
    Asset("ANIM", "anim/swap_engie_building.zip"),
}

local prefabs =
{
    "eshockfx",
    "ehealfx",
    "eteleringenter",
    "scrap",
    "collapse_small",
}

local function customfxstart(owner)
    local x,y,z = owner.Transform:GetWorldPosition()
--  inst.tefx = SpawnPrefab("ehealfx")
--  inst.tefx.Transform:SetPosition(x,1,z)
	owner.tefx = SpawnPrefab("ehealfx")
    owner.tefx.entity:SetParent(owner.entity)
    owner.tefx.entity:AddFollower()
    owner.tefx.Follower:FollowSymbol(owner.GUID, "shadow", 100, -150, 0)
	owner.tefx.Transform:SetScale(.5, .5, .5)
    if owner.startfx == nil then
        owner.startfx = owner:DoPeriodicTask(.2, function(owner)--TODO: One day, fix these on boats. Maybe.
            owner.ringfx = SpawnPrefab("eteleringenter")
            owner.ringfx.Transform:SetPosition(x,y,z)
        end)
	end
end

local function customfxend(owner)
    if owner.tefx then
	owner.tefx:Remove()
	end
	if owner.startfx then
	   owner.startfx:Cancel()
	   owner.startfx = nil
    end
end

local function onpreload(inst, data)
    inst.maker = data.maker
    inst.telenterID = data.telenterID
    if data.tag == 1 then
	inst:AddTag("lookingtolink")
    end
    if data.tag == 0 then
    inst.pairedGUID = data.pairedGUID
    end
end

local function onsave(inst, data)
    data.maker = inst.maker
    data.telenterID = inst.telenterID
    if inst:HasTag("lookingtolink") then
	data.tag = 1
    else
	data.tag = 0
	data.pairedGUID = inst.pairedGUID
    end
end

local function onbuilt(inst, builder)
	if builder and builder.engieID then
		print(builder.engieID)
		inst.telenterID = builder.engieID
		builder:PushEvent("engiebuilding")
	end

    inst.AnimState:PlayAnimation("place")
    local x,y,z = inst.Transform:GetWorldPosition()

    inst.SoundEmitter:PlaySound("dontstarve/creatures/rook/explo")
    inst:DoTaskInTime(.75, function()
	inst.fx = SpawnPrefab("eshockfx")
	inst.fx.Transform:SetPosition(x,y,z)
	inst.fx.Transform:SetScale(1, 0.5, 1)
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/lightninggoat/shocked_electric")
    end)

    inst:AddTag("lookingtolink")
    inst.maker = builder.name

    for k,v in pairs(Ents) do
	if v.maker == builder.name and v:HasTag("lookingtolink") and v:HasTag("eteleporter_exit") then
	    inst.paired = v
	    v.paired = inst
	    inst.pairedGUID = v.GUID
	    v.pairedGUID = v.GUID
	    inst.paired:RemoveTag("lookingtolink")
	    inst:RemoveTag("lookingtolink")
	    break
	end
    end
end

local function onhammered(inst, worker)
    if inst.ringfx then
	inst.ringfx:Remove()
    end
    if inst.tefx then
	inst.tefx:Remove()
    end
    if inst.paired then
	inst.paired:AddTag("lookingtolink")
	inst.paired.paired = nil
	inst.paired.pairedGUID = nil
    end

    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
    for k,v in pairs(Ents) do
	if v and v.engieID == inst.telenterID then
		v:PushEvent("engiebuilding")
		if v.components.sanity ~= nil then
		v.components.sanity:DoDelta(-TUNING.ENGIE_BUILDINGLOSS)
		end
        v.components.talker:Say(GetString(v, "ANNOUNCE_TELEPORTER_DOWN"))
	end
    end
end

local function onhit(inst)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation(inst.anim)
    local x,y,z = inst.Transform:GetWorldPosition()
    inst.fx = SpawnPrefab("eshockfx")
    inst.fx.Transform:SetPosition(x,y,z)
    inst.fx.Transform:SetScale(1, 0.5, 1)
	inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/lightninggoat/shocked_electric")
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
	if owner.components.health ~= nil and
    not owner.components.health:IsDead() then
	owner.components.talker:Say(GetString(owner, "ANNOUNCE_REPLANTING"))
	end
end

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_body", "swap_engie_building", "swap_body")
	customfxend(inst)
end

local function oninit(inst)
    if inst.pairedGUID then
	for k,v in pairs(Ents) do
	    if v.prefab == "eteleporter_exit" and v.pairedGUID == inst.pairedGUID then
	        inst.paired = v
	        v.paired = inst
	    end
        end
    end
    if inst.maker == 0 then
        local fx = SpawnPrefab("collapse_small")
        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
        fx:SetMaterial("metal")
	inst:Remove()
    end
end

local function onnear(inst, guy)
    inst.anim = "idle_loop"
    inst.AnimState:PlayAnimation(inst.anim, true)
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")
	if guy.replica.inventory ~= nil and guy.replica.inventory:GetEquippedItem(EQUIPSLOTS.BODY) ~= nil and guy.replica.inventory:GetEquippedItem(EQUIPSLOTS.BODY).prefab == "eteleporter" then
	return
	else
    customfxstart(inst)
	end
end

local function onfar(inst)
    inst.anim = "exit"
    inst.AnimState:PlayAnimation(inst.anim)
    inst.AnimState:PushAnimation("idle")
    customfxend(inst)
end

local function fn(inst, self, range)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("eteleporter.tex")

    inst:AddTag("structure")
    inst:AddTag("eteleporter_enter")
    inst:AddTag("ebuild")
	inst:AddTag("nonpotatable")
    inst:AddTag("heavy")
    inst.AnimState:SetBank("eteleporter")
    inst.AnimState:SetBuild("eteleporter")
    inst.AnimState:PushAnimation("idle")

    inst.no_wet_prefix = true
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("teleporter")
    inst:AddComponent("engieteleporter")
    inst:AddComponent("inventory")
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

	---------------------------------------
	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.cangoincontainer = false
    inst.components.inventoryitem:SetSinks(true)
	inst.components.inventoryitem.imagename = "esentry_item"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/esentry_item.xml"

	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = TUNING.TOOLBOX_SPEED_MULT
	inst.components.equippable.restrictedtag = "engie"
    ---------------------------------------

    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(2, 2)
    inst.components.playerprox.onnear = onnear
    inst.components.playerprox.onfar = onfar

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    MakeHauntableFreeze(inst) 
	
    inst.maker = 0
    inst.anim = "idle"

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    inst.OnBuiltFn = onbuilt

    inst:DoTaskInTime(.1, oninit)

    return inst
end

local function eshockfxfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst:AddTag("NOCLICK")
    inst:AddTag("FX")

    inst.AnimState:SetBank("goosemoose_nest_fx")
    inst.AnimState:SetBuild("goosemoose_nest_fx")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetMultColour( 10/255, 10/255, 200/255, 0 )

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:ListenForEvent("animover", inst.Remove)

    return inst
end

local function onenter(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local shape = .5
    y = 1
    inst.Transform:SetPosition(x,y,z)
    inst:DoPeriodicTask(.1, function(inst)
	shape = shape - .02
	y = y - .1
	inst.Transform:SetPosition(x,y,z)
	inst.Transform:SetScale(shape, .10, shape)
	if y <= 0.0 then
	    inst:Remove()
	end
    end)
end

local function enterfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.AnimState:SetBank("forcefield")
    inst.AnimState:SetBuild("forcefield")
    inst.AnimState:PlayAnimation("open")
    inst.AnimState:PushAnimation("idle_loop", true)
    inst.AnimState:SetMultColour( 250/255, 25/255, 25/255, 0 )
    inst.Transform:SetScale(.5, .10, .5)

    inst:AddTag("NOCLICK")
    inst:AddTag("FX")
    inst.persists = false

    inst:DoTaskInTime(0, onenter)

    return inst
end

return Prefab("common/eteleporter", fn, assets, prefabs),
	Prefab("eshockfx", eshockfxfn, assets),
	Prefab("eteleringenter", enterfn, assets)--,
--	MakePlacer("common/eteleporter_placer", "esentry_item", "esentry_item", "idle")