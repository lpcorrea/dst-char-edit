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
    "eteleringexit",
    "scrap",
    "collapse_small",
}

local function customfxend(inst)
    inst.AnimState:PlayAnimation("exit")
    inst.tefx:Remove()
	if inst.startfx ~= nil then
	inst.startfx:Cancel()
	inst.startfx = nil
	end
end

local function customfxstart(inst)
    inst.AnimState:PlayAnimation("idle_loop", true)
    local x,y,z = inst.Transform:GetWorldPosition()
    inst.tefx = SpawnPrefab("ehealfx")
    inst.tefx.Transform:SetPosition(x,1,z)
    inst.tefx.Transform:SetScale(.5, .5, .5)
    if inst.startfx == nil then
        inst.startfx = inst:DoPeriodicTask(.2, function(inst)
            inst.ringfx = SpawnPrefab("eteleringexit")
            inst.ringfx.Transform:SetPosition(x,y,z)
        end)
    end
end

local function onpreload(inst, data)
    inst.maker = data.maker
    inst.telexitID = data.telexitID
    if data.tag == 1 then
	inst:AddTag("lookingtolink")
    end
    if data.tag == 0 then
        inst.pairedGUID = data.pairedGUID
    end
end

local function onsave(inst, data)
    data.maker = inst.maker
    data.telexitID = inst.telexitID
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
		inst.telexitID = builder.engieID
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
	if v.maker == builder.name and v:HasTag("lookingtolink") and v:HasTag("eteleporter_enter") then
	    v.paired = inst
	    inst.paired = v
	    inst.pairedGUID = inst.GUID
	    v.pairedGUID = inst.GUID
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
	if v and v.engieID == inst.telexitID then
		v:PushEvent("engiebuilding")
		if v.components.sanity ~= nil then
		v.components.sanity:DoDelta(-TUNING.ENGIE_BUILDINGLOSS)
		end
        v.components.talker:Say(GetString(v, "ANNOUNCE_TELEPORTER_DOWN"))
	end
    end
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
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
	inst:RemoveTag("carrying")
end

local function onequip(inst, owner)
	owner.AnimState:OverrideSymbol("swap_body", "swap_engie_building", "swap_body")
	inst:AddTag("carrying")
end

local function oninit(inst)
    if inst.pairedGUID then
	for k,v in pairs(Ents) do
	    if v.prefab == "eteleporter" and v.pairedGUID == inst.pairedGUID then
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
    inst:AddTag("eteleporter_exit")
    inst:AddTag("ebuild")
	inst:AddTag("nonpotatable")
    inst:AddTag("heavy")
    inst.AnimState:SetBank("eteleporter")
    inst.AnimState:SetBuild("eteleporter")
    inst.AnimState:PlayAnimation("idle")

    inst.no_wet_prefix = true
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventory")
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    MakeHauntableFreeze(inst) 

    inst.maker = 0

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload
    inst.OnBuiltFn = onbuilt

    inst:DoTaskInTime(0, oninit)

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
    inst.components.equippable.walkspeedmult = (TUNING.TOOLBOX_SPEED_MULT * 10)
	inst.components.equippable.restrictedtag = "engie"
    ---------------------------------------

    inst:ListenForEvent("endfx", customfxend)
    inst:ListenForEvent("startfx", customfxstart)

    return inst
end

local function onexit(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local shape = .3
    y = 0
    inst.Transform:SetPosition(x,y,z)
    inst:DoPeriodicTask(.1, function(inst)
	shape = shape + .02
	y = y + .1
	inst.Transform:SetPosition(x,y,z)
	inst.Transform:SetScale(shape, .10, shape)
	if y >= 1.0 then
	    inst:Remove()
	end
    end)
end

local function exitfn()
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
    inst.Transform:SetScale(.3, .10, .3)

    inst:AddTag("NOCLICK")
    inst:AddTag("FX")
    inst.persists = false

    inst:DoTaskInTime(0, onexit)

    return inst
end

return Prefab("common/eteleporter_exit", fn, assets, prefabs),
	Prefab("eteleringexit", exitfn, assets)--,
--	MakePlacer("common/eteleporter_exit_placer", "esentry_item", "esentry_item", "idle")