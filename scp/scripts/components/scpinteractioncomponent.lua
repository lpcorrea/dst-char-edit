local ScpInteractionComponent = Class(function(self, inst)
    self.inst = inst
    self.lifetime = 20
end)

function ScpInteractionComponent:DoSpawn(doer)
	local x, y, z = self.inst.Transform:GetWorldPosition()

    SpawnPrefab("statue_transition").Transform:SetPosition(x, y, z)
    SpawnPrefab("statue_transition_2").Transform:SetPosition(x, y, z)
    doer.components.scpcomponent:SpawnPetAt(x, y, z, "scpzombie")
    if doer.components.pestilencecounter ~= nil then
        doer.components.pestilencecounter:DoDelta(20)
        --inst.components.grogginess:SetEnableSpeedMod(true)
        doer.components.sanity.dapperness = 0
        doer.components.grogginess.grog_amount = 0
        doer.components.locomotor:RemoveExternalSpeedMultiplier(doer, "countergrogginess")
    end
    self.inst:Remove()
end

return ScpInteractionComponent