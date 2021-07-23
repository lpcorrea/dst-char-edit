return Prefab("monkey_start_peach", function()
	local inst = CreateEntity()
	if not TheWorld.ismastersim then
		return inst
	end

	inst:DoTaskInTime(0, inst.Remove)
	if not PrefabExists("peach") then
		return inst
	else
		return SpawnPrefab("peach")
	end

end)