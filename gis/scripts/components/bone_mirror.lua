
local function onlevel(self,level)
	if  level ~= 1 and self.inst.components.inventoryitem then
		self.inst.components.inventoryitem.atlasname = "images/inventoryimages/bone_mirror_"..level..".xml"
		self.inst.components.inventoryitem:ChangeImageName("bone_mirror_"..level)
		self.inst.AnimState:PlayAnimation("idle_"..level,true)
	end
end
local  bone_mirror = Class(function(self, inst)
	self.inst = inst
	self.level = 1
	self.skins = {}
    self.openlist = {}
	self.opencount = 0
end,
nil,
{
	level = onlevel,
}
)

function bone_mirror:CanAcceptItem(item, giver)
	if not item:HasTag("wb_armor") then
		return false
	elseif not(#self.skins <  self.level*2) then
		if giver and giver.components.talker then
			giver.components.talker:Say(STRINGS.WB_MIRROR_NOSPACE)
		end
		return false
	elseif table.contains(self.skins,item.prefab) then
		if giver and giver.components.talker then
			giver.components.talker:Say(STRINGS.WB_MIRROR_HASONE)
		end
		return false
	end
	return true
end

function bone_mirror:GetItem(item)
	if not table.contains(self.skins,item.prefab) then
		table.insert(self.skins,item.prefab)
		self:SendInfo()
	end
end


local function sendtome(self,doer)
	local res = {
		level = self.level,
		skins = self.skins,
		current = doer.components.white_bone_cloak and  doer.components.white_bone_cloak:GetSkin() or nil,
	}
	local success,result  = pcall(json.encode,res)
	if success then
		SendModRPCToClient(CLIENT_MOD_RPC["wb_mirror_clientdprc"]["wb_mirror_clientdprc"],doer.userid,1,result)
	end
end
function bone_mirror:SendInfo(doer)
	if doer then
		sendtome(self,doer)
	else
        for opener, _ in pairs(self.openlist) do
			if  opener:IsValid() then
				sendtome(self,opener)
			end
        end
	end
end

function bone_mirror:UseBy(doer)
    if doer ~= nil then
		if  self.openlist[doer] == nil then
        	self.inst:StartUpdatingComponent(self)
			self.openlist[doer] = true
			self.opencount = self.opencount + 1
		end		
		self:SendInfo(doer)
		doer.used_mirror = self.inst
	end
end

function bone_mirror:Close(doer)
    if doer == nil then
        for opener, _ in pairs(self.openlist) do
            self:Close(opener)
        end
        return
    end
    if doer ~= nil and self.openlist[doer] ~= nil then
        self.openlist[doer] = nil
        self.opencount = self.opencount - 1
        doer.used_mirror = nil

        if self.opencount == 0 then
            self.inst:StopUpdatingComponent(self)
        end
		SendModRPCToClient(CLIENT_MOD_RPC["wb_mirror_clientdprc"]["wb_mirror_clientdprc"],doer.userid,2)
    end
end

function bone_mirror:RemoveIngredients(ingredients,doer)
	for i, v in pairs(ingredients) do
		doer.components.inventory:ConsumeByName(v[1],v[2])
	end
end

function bone_mirror:HasIngredients(ingredients,doer)
	if not doer.components.inventory then
		return false
	end
	for i, v in pairs(ingredients) do
		local has = doer.components.inventory:Has(v[1], v[2])
		if not has then
			return false
		end
	end
	return true
end

function bone_mirror:DoLevelUp(doer)
	local need = TUNING.WB_BONE_MIRROR_RECIPR[self.level+1]
	if need  ~= nil then
		if self:HasIngredients(need,doer) then
			self:RemoveIngredients(need,doer)
			self:LevelUp()
		elseif doer.components.talker then
			doer.components.talker:Say(STRINGS.WB_MIRROR_NOTENOUGH)
		end
	end
end

function bone_mirror:LevelUp()
	SpawnPrefab("explode_reskin").Transform:SetPosition(self.inst.Transform:GetWorldPosition())
    self.level = self.level + 1
	if self.level > 2 and not table.contains(self.skins,"wb_armorfog") then
		table.insert(self.skins,"wb_armorfog")
	end
	self:SendInfo()
end

function bone_mirror:OnUpdate(dt)
    if self.opencount == 0 then
        self.inst:StopUpdatingComponent(self)
    else
        for opener, _ in pairs(self.openlist) do
			if not opener:IsValid() then
				self:Close(opener)
			elseif (opener.components.health and opener.components.health:IsDead() or opener:HasTag("playerghost")) or 
				not (opener:IsNear(self.inst, 3) and CanEntitySeeTarget(opener, self.inst)) then
				self:Close(opener)
			end
        end
    end
end
bone_mirror.OnRemoveEntity = bone_mirror.Close
bone_mirror.OnRemoveFromEntity = bone_mirror.Close

function bone_mirror:OnSave()
    return { level = self.level,skins = self.skins}
end

function bone_mirror:OnLoad(data)
    if data then
        self.level = data.level
		self.skins = data.skins
    end
end

return bone_mirror


