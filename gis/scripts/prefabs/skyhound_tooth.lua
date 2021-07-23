local assets = {
    Asset("ANIM", "anim/skyhound_tooth.zip"),
    Asset("ANIM", "anim/skyhound_tooth_water.zip"),
    Asset("ATLAS", "images/inventoryimages/skyhound_tooth.xml"),
    Asset("IMAGE", "images/inventoryimages/skyhound_tooth.tex"),
}

local function accept_test(inst, item, giver)
    if giver:HasTag("skyhound_master") 
    and giver.components.skyhoundleash
    and giver.components.skyhoundleash:CanSpawn()
    and (item.prefab == "reviver" or item.prefab == "amulet") then
        return true
    end
end

local function on_accept(inst, giver, item)
    if giver.components.skyhoundleash
    and giver.components.skyhoundleash:CanSpawn() then
        local pt = giver:GetPosition()
        giver.components.skyhoundleash:SpawnPetAt(pt:Get())
        inst:Remove()
    end
end

local function on_refuse(inst, giver, item)
end

local function onpickupfn(inst, pickupguy)
    if pickupguy and not pickupguy:HasTag("skyhound_master") 
    and  pickupguy.prefab ~= "wormhole" 
    and pickupguy.prefab ~= "puppet" then
        if pickupguy.components.inventory then
            pickupguy:DoTaskInTime(0, function()
                pickupguy.components.inventory:DropItem(inst, true, true)
            end)
        end
    end
end

local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    inst.entity:AddMiniMapEntity()

    MakeInventoryPhysics(inst)

    
    inst.AnimState:SetBank("skyhound_tooth")
    inst.AnimState:SetBuild("skyhound_tooth")
    inst.AnimState:PlayAnimation("idle")
    -- inst.MiniMapEntity:SetIcon("skyhound_tooth.tex")

    MakeInventoryFloatable(inst, "small", nil, {0.6, 0.55, 0.6})
    inst.AnimState:AddOverrideBuild("skyhound_tooth_water")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("skyhound_tooth")
    inst:AddComponent("skyhoundrebirth")
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    -- inst.components.inventoryitem.imagename = "skyhound_tooth"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/skyhound_tooth.xml"
    inst.components.inventoryitem.onpickupfn = onpickupfn
    inst:AddComponent("trader")
    -- inst.components.trader:SetAbleToAcceptTest()
    inst.components.trader:SetAcceptTest(accept_test)
    inst.components.trader.onaccept = on_accept
    inst.components.trader.onrefuse = on_refuse

    inst:ListenForEvent("floater_startfloating", function(inst) inst.AnimState:PlayAnimation("float") end)
    inst:ListenForEvent("floater_stopfloating", function(inst) inst.AnimState:PlayAnimation("idle") end)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("skyhound_tooth", fn, assets)