local assets =
{
    Asset("ANIM", "anim/yangjian_buzzard.zip"),
    Asset("ANIM", "anim/yangjian_buzzard_gold.zip"),
    Asset("ANIM", "anim/buzzard_basic.zip"),
    Asset("ANIM", "anim/ui_yangjian_buzzard_1x1.zip"),

    Asset("SOUND", "sound/buzzard.fsb"), 
}

local brain = require("brains/buzzardbrain")

local function onopen(inst,data)
    if inst.owner ~= nil and data and data.doer ~= inst.owner then
        inst.components.container:Close()
        inst.sg:GoToState("taunt")
        return
    end
    --inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/buzzard/squack")
end

local function onclose(inst,doer)
    --inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/buzzard/squack")
    if inst.components.container:IsFull() and doer ~= nil and doer.userid ~= nil  then
        local str = {}
        for i, v in ipairs(AllPlayers) do
            if  v ~= doer then
                local x1,y1,z1  = v.Transform:GetWorldPosition()
                table.insert(str,{v.GUID,v.prefab, math.floor(x1),math.floor(z1)})
            end
        end
        local success1,a1  = pcall(json.encode,str)
        if next(str) ~= nil and success1 then
            inst.components.container.canbeopened = false
            SendModRPCToClient(CLIENT_MOD_RPC["yangjian_fly_map"]["fly_xtj"],doer.userid,a1)
        else
            inst.components.container:DropEverything()
            if inst.checekower ~= nil then 
                inst.checekower:Cancel()
                inst.checekower = nil
            end
            inst.sg:GoToState("flyaway")
        end
    end
end

local function oncheck(inst)
    if not (inst.owner ~= nil and inst:IsNear(inst.owner, 8)) then
        if inst.checekower ~= nil then 
            inst.checekower:Cancel()
            inst.checekower = nil
        end
        inst.components.container:Close()
        inst.sg:GoToState("flyaway")
    end
end


local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    inst.DynamicShadow:SetSize(1.25, .75)
    inst.Transform:SetFourFaced()

    MakeCharacterPhysics(inst, 15, .25)

    inst.AnimState:SetBank("buzzard")
    inst.AnimState:SetBuild("yangjian_buzzard")
    inst.AnimState:PlayAnimation("idle", true)


    inst:AddTag("buzzard")
    inst:AddTag("animal")
    inst:AddTag("scarytoprey")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetCanSleep(false)

    inst:AddComponent("inspectable")

    inst:AddComponent("knownlocations")

    inst:AddComponent("locomotor")
    inst.components.locomotor.walkspeed = TUNING.BUZZARD_WALK_SPEED
    inst.components.locomotor.runspeed = TUNING.BUZZARD_RUN_SPEED
    
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("yangjian_buzzard")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst.persists = false
    
    inst:SetStateGraph("SGyangjian_buzzard")

    inst.oncheck = oncheck

    return inst
end

return Prefab("yangjian_buzzard", fn, assets, prefabs)
