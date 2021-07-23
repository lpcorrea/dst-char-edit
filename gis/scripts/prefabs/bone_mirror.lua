local assets =
{
    Asset("ANIM", "anim/bone_mirror.zip"),
    Asset("ATLAS", "images/inventoryimages/bone_mirror.xml"),
    Asset("ATLAS", "images/inventoryimages/bone_mirror_2.xml"),
    Asset("ATLAS", "images/inventoryimages/bone_mirror_3.xml"),
}


local function ShouldAcceptItem(inst, item, giver)
    return inst.components.bone_mirror:CanAcceptItem(item, giver)
end

local function OnGetItemFromPlayer(inst, giver, item)
    inst.components.bone_mirror:GetItem(item)
end

local function onuse(inst,doer)
    local owner = inst.components.inventoryitem:GetGrandOwner()
    if owner and owner.components.inventory ~= nil then
        owner.components.inventory:DropItem(inst)
    end
    if doer and doer:HasTag("wb_monster") then
        inst.components.bone_mirror:UseBy(doer)
        return true
    end
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    --inst.components.lootdropper:SpawnLootPrefab("boneshard")
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function getstatus(inst)
    return  inst.components.bone_mirror.level == 3 and "MAX"
        or inst.components.bone_mirror.level == 2 and "MIDDLE"
        or "SMALL"
end

local function OnPickedUp(inst)
    if inst.components.bone_mirror then
        inst.components.bone_mirror:Close()
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

	inst.DynamicShadow:SetSize(0.85, 0.35)

    inst.Transform:SetScale(1.3, 1.3, 1.3)

    inst.AnimState:SetBank("bone_mirror")
    inst.AnimState:SetBuild("bone_mirror")
    inst.AnimState:PlayAnimation("idle_1",true)
	
	MakeInventoryFloatable(inst)

    inst.MiniMapEntity:SetIcon("bone_mirror.tex")

    inst:AddTag("bone_mirror")
    inst:AddTag("trader")
	
    inst.myth_use_needtag = "wb_monster"
    inst.MYTH_USE_TYPE = "MIRROR"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/bone_mirror.xml"
    inst.components.inventoryitem:SetOnPutInInventoryFn(OnPickedUp)

    inst:AddComponent("bone_mirror")

    inst:AddComponent("myth_use_inventory")
    inst.components.myth_use_inventory.canuse = true
	inst.components.myth_use_inventory.canusescene  = true
	inst.components.myth_use_inventory:SetOnUseFn(onuse)

    inst:AddComponent("trader")
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer

    inst:AddComponent("lootdropper")
 
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)

    return inst
end


local function onopen(inst)
end

local function onclose(inst)
end


local function CanAcceptCount(self,item, maxcount)
    local stacksize = math.max(maxcount or 0, item.components.stackable ~= nil and item.components.stackable.stacksize or 1)
    if stacksize <= 0 then
        return 0
    end
    local acceptcount = 0
    if not (item.components.inventoryitem ~= nil and item.components.inventoryitem.canonlygoinpocket) then
        local overflow = self
        if overflow ~= nil then
            for k = 1, overflow.numslots do
                local v = overflow.slots[k]
                if v ~= nil then
                    if v.prefab == item.prefab and v.skinname == item.skinname and v.components.stackable ~= nil then
                        acceptcount = acceptcount + v.components.stackable:RoomLeft()
                        if acceptcount >= stacksize then
                            return stacksize
                        end
                    end
                elseif overflow:CanTakeItemInSlot(item, k) then
                    if overflow.acceptsstacks or stacksize <= 1 then
                        return stacksize
                    end
                    acceptcount = acceptcount + 1
                    if acceptcount >= stacksize then
                        return stacksize
                    end
                end
            end
        end
    end
    return acceptcount
end


local ORANGE_PICKUP_MUST_TAGS = { "_inventoryitem" }
local ORANGE_PICKUP_CANT_TAGS = { "INLIMBO", "NOCLICK", "knockbackdelayinteraction", "catchable", "fire", "minesprung", "mineactive" }
local function pickup(inst, owner)
    if owner == nil or owner.components.inventory == nil then
        return
    end

    local container = inst.components.container
    local has = {}
    for i = 1, container:GetNumSlots() do
        local item = container:GetItemInSlot(i)
        if item ~= nil  then
            has[item.prefab] = true
        end
    end

    if next(has) == nil then return end 

    local x, y, z = owner.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, TUNING.ORANGEAMULET_RANGE, ORANGE_PICKUP_MUST_TAGS, ORANGE_PICKUP_CANT_TAGS)
    local ba = owner:GetBufferedAction()
    for i, v in ipairs(ents) do
        if v.components.inventoryitem ~= nil and has[v.prefab] and 
            v.components.inventoryitem.canbepickedup and
            v.components.inventoryitem.cangoincontainer and
            not v.components.inventoryitem:IsHeld() and
            CanAcceptCount(inst.components.container,v, 1) > 0 and
            (ba == nil or ba.action ~= ACTIONS.PICKUP or ba.target ~= v) then
            SpawnPrefab("wb_sand_puff").Transform:SetPosition(v.Transform:GetWorldPosition())
            local v_pos = v:GetPosition()
            if v.components.stackable ~= nil then
                v = v.components.stackable:Get()
            end
            inst.components.container:GiveItem(v, nil, v_pos)
            return
        end
    end
end

local function ondrop(inst)
    if inst.task then
        inst.task:Cancel()
        inst.task = nil
    end
    if inst.components.container then
        inst.components.container:DropEverything()
    end
    inst:Remove()
end

local function onequip(inst, owner)
    if inst.components.container ~= nil then
        inst.components.container:Open(owner)
    end
    if inst.task then
        inst.task:Cancel()
    end
    inst.task = inst:DoPeriodicTask(TUNING.ORANGEAMULET_ICD, pickup, nil, owner)
end

local function onunequip(inst, owner)
    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
    if inst.task ~= nil then
        inst.task:Cancel()
        inst.task = nil
    end
end

local function containerfn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst:AddTag("CLASSIFIED")
    inst:AddTag("wb_armorstorage_back")
    inst:AddTag("wb_can_equip")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst) 
			inst.replica.container:WidgetSetup("backpack") 
		end
        return inst
    end
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(ondrop)

	inst:AddComponent("container")
	inst.components.container:WidgetSetup("backpack")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.PACK or EQUIPSLOTS.BACK or EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

	return inst
end

return Prefab("bone_mirror", fn, assets),
    Prefab("wb_armorstorage_back", containerfn)
		