
local function BitAND(a,b) local p,c=1,0 while a>0 and b>0 do local ra,rb=a%2,b%2 if ra+rb>1 then c=c+p end a,b,p=(a-ra)/2,(b-rb)/2,p*2 end return c end

local function CollidesWithPlayer(phy)
    local mask = phy:GetCollisionMask()
    if mask < COLLISION.CHARACTERS then 
        return false
    else
        return BitAND(mask, COLLISION.CHARACTERS) > 0
    end
end

local function IsObstacle(phy)
    return phy:GetCollisionGroup() == COLLISION.OBSTACLES
end

local Mk_Hold_Animal = Class(function(self, inst)
    self.inst = inst
    self.time = 0
    self.dingshentime = 0
    self.holdding = false
    self.dstime = -10
    self._attacked = function()
        if self.holdding then
            self:Stop()
        end
    end
end)

local function gettime(inst)
    local time = 6 * (inst.components.health and inst.components.health:GetPercent() or 1)
    time = Remap(time, 0, 6, 3, 6)
    return time
end

function Mk_Hold_Animal:Start()
    if (GetTime() - self.dstime) < 10 then
        return 
    end
    self.dstime = GetTime()
    local inst = self.inst
    self.time = inst:HasTag("epic") and 2 or gettime(inst)
    self.dingshentime = 0
    self.holdding = true
    inst:AddTag('myth_dingshenshu')

    if not inst.components.colouradder then
        inst:AddComponent("colouradder")
    end
    inst.components.colouradder:PushColour(inst, 255/255, 212/255, 0/255, 0.2)

    local fx = SpawnPrefab( (inst:HasTag("epic") or inst:HasTag("largecreature") ) and "mk_dsf_fx_big"  or "mk_dsf_fx_small")
    inst:AddChild(fx)
    
    if inst.AnimState then
        inst.AnimState:Pause()
    end
    if inst.Physics then
        local mass = inst.Physics:GetMass()
        if IsObstacle(inst.Physics) then
        elseif not CollidesWithPlayer(inst.Physics) then
            inst.Physics:SetActive(false)
        elseif mass ~= 0 then 
            inst.myth_vels = {inst.Physics:GetVelocity()}
            inst.myth_mvels = {inst.Physics:GetMotorVel()}
            inst.myth_tempstop = true
            inst.Physics:Stop()
        elseif inst.Physics:GetMotorVel() ~= 0 then
            inst.Physics:SetActive(false)
        end
    end
    self.inst:ListenForEvent("attacked",self._attacked)
    self.inst:StartUpdatingComponent(self)
end

function Mk_Hold_Animal:Stop()
    self.time = 0
    self.dingshentime = 0
    self.holdding = false
    local inst = self.inst
    inst:RemoveTag('myth_dingshenshu')
    inst:RemoveEventCallback("attacked",self._attacked)
    inst:StopUpdatingComponent(self)

    if inst.components.colouradder then
        inst.components.colouradder:PopColour(inst)
    end

    if not inst:IsValid() then
        return
    end

    local fx = SpawnPrefab("mk_dsf_sound")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:Play("dontstarve_DLC001/common/iceboulder_smash")

    if inst.AnimState then
        inst.AnimState:Resume()
    end
    
    if inst.Physics then
        if IsObstacle(inst.Physics) then         
        elseif not CollidesWithPlayer(inst.Physics) then
            inst.Physics:SetActive(true)
        elseif inst.myth_tempstop then
            inst.myth_tempstop = nil
            inst.myth_vels = inst.myth_vels and inst.Physics:SetVel(unpack(inst.myth_vels))
            inst.myth_mvels = inst.myth_mvels and inst.Physics:SetMotorVel(unpack(inst.myth_mvels))
        elseif inst.Physics:GetMass() ~= 0 or inst.Physics:GetMotorVel() ~= 0 then
            inst.Physics:SetActive(true)
        end
    end
end

function Mk_Hold_Animal:OnUpdate(dt)
	self.dingshentime = self.dingshentime + dt
    local inst = self.inst
	if self.dingshentime >= self.time then
		self:Stop()
	end
    if inst.pendingtasks then
        for k in pairs(inst.pendingtasks or {})do
            k:AddTick()
        end
    end

    if inst.sg then
        inst.sg:AddMythTick(dt)
    end
    if inst.Physics and inst.myth_tempstop then
        inst.Physics:Stop()
    end
    if inst.components.timer then
        for k,v in pairs(inst.components.timer.timers)do
            if not v.paused then
                v.end_time = v.end_time + dt
            end
        end
    end
    if inst.components.combat then 
        if inst.components.combat.lastdoattacktime then
            inst.components.combat.lastdoattacktime = inst.components.combat.lastdoattacktime + dt
        end
    end
end

return Mk_Hold_Animal
