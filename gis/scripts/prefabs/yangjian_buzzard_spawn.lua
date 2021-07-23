-------------------------------------------------------------------------------
local assets =
{
	Asset("ATLAS", "images/inventoryimages/yangjian_buzzard_spawn.xml"),
}

local function builder_onbuilt(inst, builder)
    if builder.yangjian_buzzard ~= nil then
        builder.components.talker:Say("我已经有一只了")
        builder.components.inventory:GiveItem(SpawnPrefab("smallmeat"))
        return 
    end
    local dist = 2
    local child = SpawnPrefab("yangjian_buzzard")

    --for skin
    local build = builder.AnimState:GetBuild()
    if build == "yangjian_gold" then
        child.AnimState:SetBuild("yangjian_buzzard_gold")
    end


    local angle =  math.random() * 2 * PI
    local pos = builder:GetPosition()
    local offset = FindWalkableOffset(pos, angle, dist, 8, false)
    if offset ~= nil then
        child.Transform:SetPosition(pos.x + offset.x, 30, pos.z + offset.z)
    else
        child.Transform:SetPosition(pos.x, 30, pos.y)
    end
    child.owner = builder
    builder.yangjian_buzzard  = child

    builder:ListenForEvent("onremove",function() 
        builder.yangjian_buzzard = nil
    end,child)

    child.sg:GoToState("glide")
    if not builder.components.health:IsDead() then
        builder.sg:GoToState("whistle_skyhound")
    end
end

--DebugSpawn"myth_siving_boss".sg:GoToState("glide")

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()

    inst:AddTag("CLASSIFIED")
    inst.persists = false

    inst:DoTaskInTime(0, inst.Remove)

    if not TheWorld.ismastersim then
        return inst
    end
    inst.OnBuiltFn = builder_onbuilt

    return inst
end

return Prefab("yangjian_buzzard_spawn", fn, assets)