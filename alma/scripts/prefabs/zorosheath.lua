local assets =
{
	Asset("ANIM", "anim/zorosheath.zip"),
	Asset("ANIM", "anim/swap_zorosheath.zip"),
    Asset("ATLAS", "images/inventoryimages/zorosheath.xml"),
    Asset("IMAGE", "images/inventoryimages/zorosheath.tex"),
}

-- local function storeincontainer(inst, container)
    -- if container ~= nil and container.components.container ~= nil then
        -- inst:ListenForEvent("onputininventory", inst._oncontainerownerchanged, container)
        -- inst:ListenForEvent("ondropped", inst._oncontainerownerchanged, container)
        -- inst._container = container
    -- end
-- end

-- local function unstore(inst)
    -- if inst._container ~= nil then
        -- inst:RemoveEventCallback("onputininventory", inst._oncontainerownerchanged, inst._container)
        -- inst:RemoveEventCallback("ondropped", inst._oncontainerownerchanged, inst._container)
        -- inst._container = nil
    -- end
-- end

-- local function topocket(inst, owner)
   -- if inst._container ~= owner then
        -- unstore(inst)
        -- storeincontainer(inst, owner)
    -- end
    -- end

-- local function toground(inst)
    -- unstore(inst)
-- end

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_body", "swap_zorosheath", "backpack")
    owner.AnimState:OverrideSymbol("swap_body", "swap_zorosheath", "swap_body")
    inst.components.container:Open(owner)
    
end

local function onunequip(inst, owner)
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    inst.components.container:Close(owner)
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("zorosheath")
    inst.AnimState:SetBuild("zorosheath")
    inst.AnimState:PlayAnimation("idle")

    inst.MiniMapEntity:SetIcon("backpack.png")
    
    inst.foleysound = "dontstarve/movement/foley/backpack"

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()
	
	-- inst._container = nil
	
    -- inst._oncontainerownerchanged = function(container)
        -- topocket(inst, container)
    -- end

    -- inst._oncontainerremoved = function()
        -- unstore(inst)
    -- end
	
	-- inst:AddComponent("chosenzoro")
    -- inst:ListenForEvent("onputininventory", topocket)
    -- inst:ListenForEvent("ondropped", toground)
	    
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.keepondeath = true
	inst.components.inventoryitem.imagename = "zorosheath"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/zorosheath.xml"
	inst.components.inventoryitem.cangoincontainer = true

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("backpack")

    MakeHauntableLaunchAndDropFirstItem(inst)

    return inst
end

return Prefab("common/inventory/zorosheath", fn, assets)