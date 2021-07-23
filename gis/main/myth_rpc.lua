
--白骨妖精 rpc和ui
AddClientModRPCHandler( "wb_mirror_clientdprc", "wb_mirror_clientdprc", function(num,value)
    if num and type(num) == "number" then
        if num ==  1 and value and type(value) == "string" then
            local success, result = pcall(json.decode,value)
	        if result and ThePlayer and ThePlayer.HUD and ThePlayer.HUD.wb_mirror_ui then
                if not ThePlayer.HUD.wb_mirror_ui.shown then
                    ThePlayer.HUD.wb_mirror_ui:Show()
                end    
                ThePlayer.HUD.wb_mirror_ui:UpdateList(result)
	        end
        elseif num == 2 and ThePlayer and ThePlayer.HUD and ThePlayer.HUD.wb_mirror_ui then
            ThePlayer.HUD.wb_mirror_ui:Hide()
        elseif num == 3 and ThePlayer and value then
            ThePlayer:PushEvent("wbfogalpha",value)
        end
    end
end)

local wb_mirror_ui = require "widgets/wb_mirror_ui"
AddClassPostConstruct( "screens/playerhud",function(self)
    local old_CreateOverlays = self.CreateOverlays
    function self:CreateOverlays(owner)
        old_CreateOverlays(self,owner)
        if owner and  owner:HasTag("white_bone") then
            self.wb_mirror_ui = self.popupstats_root:AddChild(wb_mirror_ui(owner))
            self.wb_mirror_ui:Hide()
        end
    end
end)

local function levelup(inst,num,skin)
    if inst:HasTag("playerghost") or inst.components.health:IsDead() then return end
    if inst.used_mirror and inst.used_mirror:IsValid() then
        if num and type(num) =="number" then
            if num == 1 and skin and type(skin) =="string" and inst:HasTag("wb_monster")    then
                if  inst.components.white_bone_cloak then
                    inst.components.white_bone_cloak:SetSkin(skin)
                end
            elseif num == 2 then
                if inst.used_mirror.components.bone_mirror then
                    inst.used_mirror.components.bone_mirror:DoLevelUp(inst)
                end   
            elseif num == 3 then
                if  inst.components.white_bone_cloak then
                    inst.components.white_bone_cloak:ClearAll()
                end
            end
        end
        inst.used_mirror.components.bone_mirror:Close(inst)
    end
end
AddModRPCHandler("wb_mirror", "wb_mirror", levelup)