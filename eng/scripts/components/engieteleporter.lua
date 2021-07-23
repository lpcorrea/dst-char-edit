local EngieTeleporter = Class(function(self, inst)
    self.inst = inst
    self.boundEntrance = nil
end)

function EngieTeleporter:TeleportAction(doer)	
--  local char_accounce_table = tp_sayings[doer.prefab] or tp_sayings["GENERIC"]
--  local say_index = math.floor(GetRandomMinMax(0,#char_accounce_table)) + 1
    if self.boundEntrance.pairedGUID == nil then
	doer.components.talker:Say(GetString(doer, "ANNOUNCE_UNIMPLEMENTED"))
    end

    if self.boundEntrance.pairedGUID then
	if not self.boundEntrance.paired:HasTag("carrying") then
	self.boundEntrance.paired:PushEvent("startfx")
	doer.SoundEmitter:PlaySound("dontstarve/common/researchmachine_lvl3_run", "sound")
	doer.AnimState:PlayAnimation("townportal_enter_pre")
	doer.sg:GoToState("forcetele")
	doer.components.locomotor:Clear()
	doer:Show()
	doer:ScreenFade(true, 0)
    doer:DoTaskInTime(1.3, function()
	doer.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())

    if doer.components.leader ~= nil then
        for follower, v in pairs(doer.components.leader.followers) do
            follower.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())
        end
    end

    --special case for the chester_eyebone: look for inventory items with followers
    if doer.components.inventory ~= nil then
        for k, item in pairs(doer.components.inventory.itemslots) do
            if item.components.leader ~= nil then
                for follower, v in pairs(item.components.leader.followers) do
                    follower.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())
                end
            end
        end
        -- special special case, look inside equipped containers
        for k, equipped in pairs(doer.components.inventory.equipslots) do
            if equipped.components.container ~= nil then
                for j, item in pairs(equipped.components.container.slots) do
                    if item.components.leader ~= nil then
                        for follower, v in pairs(item.components.leader.followers) do
                            follower.Physics:Teleport(self.boundEntrance.paired:GetPosition():Get())
                        end
                    end
                end
            end
        end
    end

	    doer:SnapCamera()
	    doer.sg:GoToState("idle")
	    doer.SoundEmitter:KillSound("sound")
	    self.boundEntrance.paired:PushEvent("endfx")
	    doer:DoTaskInTime(3*FRAMES, function()
		--doer.components.talker:Say( char_accounce_table[say_index] )
		doer.components.talker:Say(GetString(doer, "ANNOUNCE_ENGIE_TELEPORT")) -- for wisecracker
		doer.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/lightninggoat/shocked_electric")
		local telefx = SpawnPrefab("eshockfx")
		telefx.Transform:SetScale(.80, 0.5, .80)
		telefx.entity:AddFollower()
		telefx.Follower:FollowSymbol(doer.GUID, "swap_body", 0, 0, 0)
	    end)
	end)
	end
    end
end

return EngieTeleporter