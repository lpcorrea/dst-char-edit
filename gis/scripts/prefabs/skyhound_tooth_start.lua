local function fn()
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("CLASSIFIED")
    inst.persists = false
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inventoryitem")
    inst:DoTaskInTime(0, function()
    	if inst.components.inventoryitem then
    		local owner = inst.components.inventoryitem.owner
    		if owner and owner.components.skyhoundleash then
    			owner.components.skyhoundleash:SpawnAround()
    		end
    	end
    	inst:Remove()
    end)

    return inst
end

return Prefab("skyhound_tooth_start", fn, {})