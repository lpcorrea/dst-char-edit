
local function oncheck(inst)
    if not (inst.owner and inst.owner:IsValid()) then
        inst:Remove()
    else
        local maxdis = inst.scoperange ~= nil and inst.scoperange*inst.scoperange or 1024
        local dis = inst:GetDistanceSqToInst(inst.owner)
        if dis > maxdis then
            inst.distime = inst.distime + FRAMES
        else
            inst.distime = 0
        end
        if inst.distime > 5 then
            inst:Remove()
        end
    end
end

local function setowner(inst,owner)
    inst.distime = 0
    inst.owner = owner
    inst:DoPeriodicTask(0,oncheck)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()

    inst:AddTag("white_bone_fog")
    inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")
	
	inst:AddComponent("timer")
	inst.components.timer:StartTimer("timeover", 120)
	inst:ListenForEvent("timerdone", inst.Remove)

    inst.SetOwner = setowner
    return inst
end

return Prefab("white_bone_fog", fn)
