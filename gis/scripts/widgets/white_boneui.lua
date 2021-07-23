local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"
local UIAnimButton = require "widgets/uianimbutton"

local UIAnim = require "widgets/uianim"

local function IsHUDScreen()
	local defaultscreen = false
	if TheFrontEnd:GetActiveScreen() and TheFrontEnd:GetActiveScreen().name and type(TheFrontEnd:GetActiveScreen().name) == "string" and TheFrontEnd:GetActiveScreen().name == "HUD" then
		defaultscreen = true
	end
	return defaultscreen
end

local White_Boneui = Class(Widget, function(self, owner)
	Widget._ctor(self, "White_Boneui")
	
	self.owner = owner
	self.wbbg = self:AddChild(Widget("wbbg")) 	
	-- ui移除时干掉监听器
	self.inst:ListenForEvent("onremove", function()
		if self.handler ~= nil then
			self.handler:Remove()
		end
	end)
	
	if self.owner:HasTag("white_bone") then
		--按键
		self.handler = 
		TheInput:AddKeyDownHandler(KEY_H, function() 
			if not IsHUDScreen() then return end
			self.wbimage.onclick() 
		end)

		self.wbimage = self.wbbg:AddChild(UIAnimButton("white_boneui", "white_boneui"))
		self.wbimage.animstate:PlayAnimation("idle")
		self.wbimage:SetOnClick(function()
			self.wbimage.animstate:PlayAnimation("click")
			self.wbimage.animstate:PushAnimation("idle",false)
			SendModRPCToServer( MOD_RPC["myth_transform"]["myth_transform"],2)
		end)
    elseif self.owner:HasTag("monkey_king") then
    	--按键
    	self.handler = 
		TheInput:AddKeyDownHandler(KEY_H, function() 
			if not IsHUDScreen() then return end
			self.wbimage.onclick() 
		end)
		
		self.wbimage = self.wbbg:AddChild(UIAnimButton("monkey_kingui", "monkey_kingui"))
		self.wbimage.animstate:PlayAnimation("idle_normal")
		self.checkfn = function(owner)
			if owner._mknightvision:value() == false then
				if not self.wbimage.animstate:IsCurrentAnimation("turn_off") then
					self.wbimage.animstate:PlayAnimation("idle_normal")
				end
			end
		end
		self.wbimage:SetOnClick(function()
			if self.owner.clickcd then return end
			if self.owner._mknightvision ~= nil and self.owner._mknightvision:value() == false then
				self.wbimage.animstate:PlayAnimation("turn_on")
			else
				self.wbimage.animstate:PlayAnimation("turn_off")
			end
			self.owner.clickcd = true 
			self.owner:DoTaskInTime(0.3, function() self.owner.clickcd = false self.checkfn(self.owner) end)
			SendModRPCToServer( MOD_RPC["myth_transform"]["myth_transform"],1)
		end)
		self.owner:ListenForEvent("monkeynightvisiondirty", function(inst)
			self.checkfn(inst)
		end)
    elseif self.owner:HasTag("pigsy") then
    	--按键
    	self.handler = 
		TheInput:AddKeyDownHandler(KEY_H, function() 
			if not IsHUDScreen() then return end
			if not (self.wbimage and self.wbimage.shown) then return end
			self.wbimage.onclick() 
		end)
		
		self.wbimage = self.wbbg:AddChild(UIAnimButton("pigsy_marryui", "pigsy_marryui"))
		self.wbimage.animstate:PlayAnimation("turnoff")
		self.checkfn = function(owner)
			if owner._becomehpig:value() == false then
				if not self.wbimage.animstate:IsCurrentAnimation("turnoff") then
					self.wbimage.animstate:PlayAnimation("turnoff")
				end
			end
		end
		self.wbimage:SetOnClick(function()
			if self.owner.clickcd then return end
			if self.owner._becomehpig ~= nil and self.owner._becomehpig:value() == false then
				self.wbimage.animstate:PlayAnimation("turnon")
			else
				self.wbimage.animstate:PlayAnimation("turnoff")
			end
			self.owner.clickcd = true 
			self.owner:DoTaskInTime(0.3, function() self.owner.clickcd = false self.checkfn(self.owner) end)
			SendModRPCToServer( MOD_RPC["myth_transform"]["myth_transform"],4)
		end)
		self.owner:ListenForEvent("becomehpigdirty", function(inst)
			self.checkfn(inst)
		end)
		self.owner:ListenForEvent("canbecomehpigdirty", function(inst)
			if self.owner._canbecomehpig:value() then
				self.wbimage:Show()
			end	
		end)
		self.wbimage:Hide()
		self.inst:DoTaskInTime(0.1,function()
			if self.owner._becomehpig:value() then
				self.wbimage.animstate:PlayAnimation("turnon")
			end
			if self.owner._canbecomehpig:value() then
				self.wbimage:Show()
			end			
		end)

	elseif self.owner:HasTag("yangjian") then
		--按键
		self.handler =
		TheInput:AddKeyDownHandler(KEY_H, function() 
			if not IsHUDScreen() then return end
			self.wbimage.onclick() 
		end)
		self.wbimage = self.wbbg:AddChild(UIAnimButton("yangjianui", "yangjianui"))
		self.wbimage.animstate:PlayAnimation("idle")
		self.wbimage:SetOnClick(function()
			if self.owner.clickcd then return end
			if self.owner._skyeye ~= nil and self.owner._skyeye:value() == false then
				self:SpawnFx()
				self.wbimage.animstate:PlayAnimation("turn_on")
				self.wbimage.animstate:PushAnimation("opened",false)
			else
				self.wbimage.animstate:PlayAnimation("turn_off")
				self.wbimage.animstate:PushAnimation("idle",false)
			end
			self.owner.clickcd = true 
			self.owner:DoTaskInTime(0.3, function() self.owner.clickcd = false end)
			SendModRPCToServer( MOD_RPC["myth_transform"]["myth_transform"],3)
		end)
		self.owner:ListenForEvent("skyeye_dirty", function(inst)
			if inst._skyeye:value() == false then
				if not self.wbimage.animstate:IsCurrentAnimation("turn_off") then
					self.wbimage.animstate:PlayAnimation("idle")
				end
			end
		end)
	end	
	self.wbimage:SetScale(.28,.28,.28)
end)

function White_Boneui:SpawnFx()
	if not self.owner:HasTag("yangjian") then return end
	self.wbimagefx = self.wbimage:AddChild(UIAnimButton("lavaarena_hammer_attack_fx", "yj_spear_elec_shockfx_build"))
	self.wbimagefx:SetScale(0.8)
	self.wbimagefx:SetPosition(0,-90,0)
	self.wbimagefx.animstate:SetLightOverride(1)
	self.wbimagefx.animstate:PlayAnimation("crackle_loop")
	self.inst:DoTaskInTime(self.wbimagefx.animstate:GetCurrentAnimationLength(),function()
		self.wbimagefx:Kill()
	end)
end


return White_Boneui