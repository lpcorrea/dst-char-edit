local upvaluehelper = require "components/myth_upvaluehelper"

local function DefaultRangeCheck(doer, target)
    if target == nil then
        return
    end
    local target_x, target_y, target_z = target.Transform:GetWorldPosition()
    local doer_x, doer_y, doer_z = doer.Transform:GetWorldPosition()
    local dst = distsq(target_x, target_z, doer_x, doer_z)
    return dst <= 16
end

local function ExtraPickupRange(doer, dest)
    if dest ~= nil then
        local target_x, target_y, target_z = dest:GetPoint()

        local is_on_water =
            TheWorld.Map:IsOceanTileAtPoint(target_x, 0, target_z) and
            not TheWorld.Map:IsPassableAtPoint(target_x, 0, target_z)
        if is_on_water then
            return 0.75
        end
    end
    return 0
end

local PICK_BARRITHOLE = GLOBAL.Action({canforce = true})
PICK_BARRITHOLE.id = "PICK_BARRITHOLE"
PICK_BARRITHOLE.str = STRINGS.ACTIONS.PICK
PICK_BARRITHOLE.fn = function(act)
    if act.target ~= nil and act.target.components.pickable_rabbithole ~= nil then
        return act.target.components.pickable_rabbithole:Pick(act.doer)
    end
end
AddAction(PICK_BARRITHOLE)

AddComponentAction(
    "SCENE",
    "pickable_rabbithole",
    function(inst, doer, actions)
        if inst:HasTag("canpickuprabithole") and doer:HasTag("myth_yutu") then
            table.insert(actions, ACTIONS.PICK_BARRITHOLE)
        end
    end
)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.PICK_BARRITHOLE, "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.PICK_BARRITHOLE, "dolongaction"))

local MYTH_PICKRABBIT =
    GLOBAL.Action({canforce = true, rangecheckfn = DefaultRangeCheck, extra_arrive_dist = ExtraPickupRange})
MYTH_PICKRABBIT.id = "MYTH_PICKRABBIT"
MYTH_PICKRABBIT.str = STRINGS.ACTIONS.PICKUP
MYTH_PICKRABBIT.fn = function(act)
    if
        act.target ~= nil and act.target.prefab == "rabbit" and act.target.components.inventoryitem ~= nil and
            act.doer.prefab == "myth_yutu"
     then
        act.target:PushEvent("detachchild")
        act.doer:PushEvent("onpickupitem", {item = act.target})
        act.doer.components.inventory:GiveItem(act.target, nil, act.target:GetPosition())
        return true
    end
end
AddAction(MYTH_PICKRABBIT)

AddComponentAction(
    "SCENE",
    "myth_pickrabbit",
    function(inst, doer, actions)
        if doer:HasTag("myth_yutu") then
            table.insert(actions, ACTIONS.MYTH_PICKRABBIT)
        end
    end
)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.MYTH_PICKRABBIT, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.MYTH_PICKRABBIT, "doshortaction"))

AddPrefabPostInit(
    "rabbithole",
    function(inst)
        if TheWorld.ismastersim then
            inst:AddComponent("pickable_rabbithole")
        end
    end
)

--月娥寻路
TUNING.MYTH_YUEDAO = {}

AddPrefabPostInit(
    "world",
    function(inst)
        inst:DoTaskInTime(
            0,
            function()
                for i, node in ipairs(TheWorld.topology.nodes) do
                    if node.tags and table.contains(node.tags, "lunacyarea") then
                        table.insert(TUNING.MYTH_YUEDAO, {x = node.x, z = node.y})
                    end
                end
            end
        )
    end
)

local pickupchange = false
AddComponentPostInit(
    "playercontroller",
    function(self)
        if not pickupchange then
            pickupchange = true
            local GetPickupAction = upvaluehelper.Get(self.GetActionButtonAction, "GetPickupAction")
            if GetPickupAction ~= nil then
                local old_GetPickupAction = GetPickupAction

                local function NewGetPickupAction(self, target, tool)
                    if target ~= nil and target.prefab == "rabbit" and self.inst.prefab == "myth_yutu" then
                        if target:HasTag("smolder") then
                            return ACTIONS.SMOTHER
                        else
                            return ACTIONS.MYTH_PICKRABBIT
                        end
                    end
                    return old_GetPickupAction(self, target, tool)
                end
                upvaluehelper.Set(self.GetActionButtonAction, "GetPickupAction", NewGetPickupAction)
            end
        end
    end
)

local ChangeIsCrazyGuy = false
AddPrefabPostInit(
    "rabbit",
    function(inst)
        --兔兔这么可爱 为什么要杀兔兔
        inst:DoTaskInTime(
            0,
            function()
                if inst.replica.health then
                    local old_CanMurder = inst.replica.health.CanMurder
                    inst.replica.health.CanMurder = function(self, ...)
                        if ThePlayer ~= nil and ThePlayer.prefab == "myth_yutu" then
                            return false
                        end
                        return old_CanMurder(self, ...)
                    end
                end
            end
        )
        if TheWorld.ismastersim then
            inst:AddComponent("myth_pickrabbit")
            inst:ListenForEvent(
                "death",
                function(inst, data)
                    local pos = inst:GetPosition()
                    TheWorld:PushEvent("rabbitkilled", {pos = pos})
                end
            )
        end

        if inst.components.sanityaura and not ChangeIsCrazyGuy then
            ChangeIsCrazyGuy = true
            local IsCrazyGuy = upvaluehelper.Get(inst.components.sanityaura.aurafn, "IsCrazyGuy")
            if IsCrazyGuy then
                local old_IsCrazyGuy = IsCrazyGuy
                local function NewIsCrazyGuy(guy)
                    if guy and guy.prefab == "myth_yutu" then
                        return false
                    end
                    return old_IsCrazyGuy(guy)
                end
                upvaluehelper.Set(inst.components.sanityaura.aurafn, "IsCrazyGuy", NewIsCrazyGuy)
            end
        end
        --兔兔这么可爱 为什么要吃兔兔
        if inst.components.cookable then
            local old_product = inst.components.cookable.product
            local old_OnCookedFn = inst.components.cookable.oncooked
            inst:ListenForEvent(
                "onputininventory",
                function(inst, owner) --COOK 行为只和玩家有关所以只需要判定玩家的就行
                    if owner ~= nil and owner:HasTag("player") then
                        if owner.prefab == "myth_yutu" then
                            if inst.components.cookable then
                                inst:RemoveComponent("cookable")
                            end
                        elseif not inst.components.cookable then
                            inst:AddComponent("cookable")
                            inst.components.cookable.product = old_product
                            inst.components.cookable:SetOnCookedFn(old_OnCookedFn)
                        end
                    end
                end
            )
        end
    end
)


local function RestoreLeader(inst)
    inst.leadertask = nil
    local leader = inst.components.entitytracker:GetEntity("leader")
    if leader ~= nil and not (leader.components.health and leader.components.health:IsDead()) then
        inst.components.follower:SetLeader(leader)
        leader:PushEvent("restoredfollower", { follower = inst })
    end
end

local function OnStopFollowing(inst)
    inst.leader_offset = nil
    if not inst.components.health:IsDead() then
        local leader = inst.components.entitytracker:GetEntity("leader")
        if leader ~= nil and not (leader.components.health and leader.components.health:IsDead()) then
            inst.leadertask = inst:DoTaskInTime(.2, RestoreLeader)
        end
    end
end
--local houndchange = false
local hounds = {"hound", "firehound", "icehound", "moonhound", "clayhound", "mutatedhound"}
for _, v in ipairs(hounds) do
    AddPrefabPostInit(
        v,
        function(inst)
            --if not houndchange then
                inst:DoTaskInTime(
                    0,
                    function()
                        local event1 = upvaluehelper.GetEventHandle(inst, "stopfollowing", "prefabs/hound")
                        if event1 ~= nil then
                            inst:RemoveEventCallback("stopfollowing", event1)
                            inst:ListenForEvent("stopfollowing", OnStopFollowing)
                        end
                    end
                )
                --houndchange = true
            --end
        end
    )
end

local OverrideSanity = false
AddPrefabPostInit(
    "player_classified",
    function(inst)
        if TheWorld.ismastersim and not OverrideSanity then
            OverrideSanity = true
            inst:DoTaskInTime(
                0.1,
                function()
                    local fn = upvaluehelper.GetEventHandle(inst, "sanitydelta", "prefabs/player_classified")
                    if fn ~= nil then
                        local UpdateAnimOverrideSanity = upvaluehelper.Get(fn, "UpdateAnimOverrideSanity")
                        if UpdateAnimOverrideSanity then
                            local old_UpdateAnimOverrideSanity = UpdateAnimOverrideSanity
                            local function NewUpdateAnimOverrideSanity(parent)
                                if parent and parent.prefab == "myth_yutu" then
                                    parent.AnimState:SetClientSideBuildOverrideFlag("insane", false)
                                    return
                                end
                                return old_UpdateAnimOverrideSanity(parent)
                            end
                            upvaluehelper.Set(fn, "UpdateAnimOverrideSanity", NewUpdateAnimOverrideSanity)
                        end
                    end
                end
            )
        end
    end
)

local aaCrazyGuy = false
AddPrefabPostInit(
    "bunnyman",
    function(inst)
        if inst.components.combat then
            local old_targetfn = inst.components.combat.targetfn
            inst.components.combat.targetfn = function(inst, ...)
                local old_target = old_targetfn ~= nil and old_targetfn(inst, ...)
                if old_target ~= nil and old_target.prefab == "myth_yutu" then
                    return nil
                end
                return old_target
            end
        end
        if inst.components.sanityaura and not aaCrazyGuy then
            aaCrazyGuy = true
            local IsCrazyGuy = upvaluehelper.Get(inst.components.sanityaura.aurafn, "IsCrazyGuy")
            if IsCrazyGuy then
                local old_IsCrazyGuy = IsCrazyGuy
                local function NewIsCrazyGuy(guy)
                    if guy and guy.prefab == "myth_yutu" then
                        return false
                    end
                    return old_IsCrazyGuy(guy)
                end
                upvaluehelper.Set(inst.components.sanityaura.aurafn, "IsCrazyGuy", NewIsCrazyGuy)
            end
        end
    end
)
--[[
AddClassPostConstruct("widgets/crafttabs", function(self)
    local last_hunger_seg = nil
    local last_hunger_penalty_seg = nil
    local function UpdateRecipesForHungerIngredients(owner, data)
        local hunger = owner.replica.hunger
        if hunger ~= nil then
            local current_seg = math.floor(math.ceil(data.newpercent * hunger:Max()) / CHARACTER_INGREDIENT_SEG)
            local penalty_seg = hunger:GetPercent()
            if current_seg ~= last_hunger_seg or
                penalty_seg ~= last_hunger_penalty_seg then
                last_hunger_seg = current_seg
                last_hunger_penalty_seg = penalty_seg
                self:UpdateRecipes()
            end
        end
    end
	if self.owner:HasTag("myth_yutu") then
		self.inst:ListenForEvent("hungerdelta", UpdateRecipesForHungerIngredients, self.owner)
	end
end)]]
--捣药

local function ResumeHands(inst)
    --需要恢复贴图显示状态
    local hands = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    if hands ~= nil and not hands:HasTag("book") then
        inst.AnimState:Show("ARM_carry")
        inst.AnimState:Hide("ARM_normal")
    else
        inst.AnimState:Hide("ARM_carry")
        inst.AnimState:Show("ARM_normal")
        inst.AnimState:ClearOverrideSymbol("swap_object")
    end
end

AddStategraphState(
    "wilson",
    State {
        name = "myth_sg_pre",
        tags = {"doing", "busy", "nodangle"},
        onenter = function(inst, timeout)
            inst:PerformBufferedAction()
            inst.sg:SetTimeout(2*FRAMES)
        end,
        ontimeout = function(inst)
            inst.sg:GoToState("idle")
        end
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "myth_sg_pre",
        tags = {"doing", "busy"},
        onenter = function(inst, timeout)
            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(2*FRAMES)
        end,
        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.sg:GoToState("idle")
        end
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "myth_daoyao",
        tags = {"busy", "pausepredict"},
        onenter = function(inst)
            inst.components.hunger:DoDelta(-5)
            local build = "medicine_pestle_anim"
            local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if weapon ~= nil and weapon.components.myth_itemskin then
                if weapon.components.myth_itemskin.skin:value() ~= "none" then
                    build = "medicine_pestle_anim_" .. weapon.components.myth_itemskin.skin:value()
                end
            end
            inst.AnimState:OverrideSymbol("swap_object", build, "objectpestle")
            inst.AnimState:OverrideSymbol("mortar_myth", build, "mortar")

            inst.AnimState:Show("ARM_carry")
            inst.AnimState:Show("ARM_normal")

            inst.AnimState:PlayAnimation("pound_medicine_myth_pre")
            inst.AnimState:PushAnimation("pound_medicine_myth_loop", true)
        end,
        timeline = {
            TimeEvent(
                .5,
                function(inst)
                    inst.sg:RemoveStateTag("busy")
                    inst.sg:RemoveStateTag("pausepredict")
                end
            ),
            TimeEvent(
                .6,
                function(inst)
                    inst.medicine = SpawnPrefab("medicine_pestle_container_myth")
                    inst.medicine.entity:SetParent(inst.entity)
                    inst.medicine.Transform:SetPosition(0, 0, 0)
                    inst.medicine.owner = inst
                    if inst.medicine.components.container then
                        inst.medicine.components.container:Open(inst)
                    end

                    inst.SoundEmitter:PlaySound("dontstarve/quagmire/common/mealing_stone/proximity_LP", "myth_daoyao")
                end
            )
        },
        ontimeout = function(inst)
            inst:DoTaskInTime(
                inst.AnimState:GetCurrentAnimationLength() -
                    inst.AnimState:GetCurrentAnimationTime() % inst.AnimState:GetCurrentAnimationLength(),
                function()
                    ResumeHands(inst)
                    local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
                    if weapon ~= nil and weapon.components.myth_itemskin then
                        weapon.components.myth_itemskin:OverrideSymbol(inst, "swap_object")
                    end
                    inst.AnimState:PlayAnimation("pound_medicine_myth_pst", false)
                    inst:DoTaskInTime(
                        inst.AnimState:GetCurrentAnimationLength(),
                        function()
                            inst.sg:GoToState("idle")
                        end
                    )
                end
            )
        end,
        events = {
            EventHandler(
                "equip",
                function(inst)
                    inst.sg:GoToState("idle")
                end
            ),
            EventHandler(
                "unequip",
                function(inst)
                    inst.sg:GoToState("idle")
                end
            )
        },
        onexit = function(inst)
            if inst.medicine then
                inst.medicine.components.container:DropEverything()
                inst.medicine.components.container:Close()
                inst.medicine:Remove()
                inst.medicine = nil
            end
            local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if weapon ~= nil and weapon.components.myth_itemskin then
                weapon.components.myth_itemskin:OverrideSymbol(inst, "swap_object")
            end
            inst.SoundEmitter:KillSound("myth_daoyao")
            ResumeHands(inst)
        end
    }
)
AddStategraphState(
    "wilson",
    State {
        name = "summon_butterfly",
        tags = {"doing", "busy", "nodangle"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("wendy_channel")
            inst.AnimState:PushAnimation("wendy_channel_pst", false)

            if inst.bufferedaction ~= nil then
                inst.sg.statemem.action = inst.bufferedaction
            end
        end,
        timeline = {
            TimeEvent(
                4 * FRAMES,
                function(inst)
                    inst.sg:RemoveStateTag("busy")
                end
            ),
            TimeEvent(
                62 * FRAMES - 0.4,
                function(inst)
                    inst:PerformBufferedAction()
                end
            )
        },
        events = {
            EventHandler(
                "animqueueover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("idle")
                    end
                end
            )
        },
        onexit = function(inst)
            if inst.bufferedaction == inst.sg.statemem.action then
                inst:ClearBufferedAction()
            end
        end
    }
)
AddStategraphState(
    "wilson_client",
    State {
        name = "summon_butterfly",
        tags = {"doing", "busy"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("wendy_channel")
            inst.AnimState:PushAnimation("wendy_channel_pst", false)

            inst:PerformPreviewBufferedAction()
        end,
        timeline = {
            TimeEvent(
                4 * FRAMES,
                function(inst)
                    inst.sg:RemoveStateTag("busy")
                end
            ),
            TimeEvent(
                62 * FRAMES - 0.4,
                function(inst)
                    inst:ClearBufferedAction()
                end
            )
        },
        onupdate = function(inst)
            if inst:HasTag("doing") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.AnimState:PlayAnimation("wendy_channel_pst")
                inst.sg:GoToState("idle", true)
            end
        end,
        events = {
            EventHandler(
                "animqueueover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("idle")
                    end
                end
            )
        }
    }
)

local function equiweapon(inst)
    local weapon = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
    if weapon and not inst.components.health:IsDead() then
        inst.components.inventory:Unequip(EQUIPSLOTS.HANDS) --这么写会把一些有充能或者等级连击之类的武器点数清空啊
        inst.components.inventory:Equip(weapon)
    end
end

AddStategraphState(
    "wilson",
    State {
        name = "myth_yutu_dig_start",
        tags = {"predig", "working"},
        onenter = function(inst)
            inst.AnimState:Show("ARM_carry")
             --强制显示手
            inst.AnimState:Hide("ARM_normal")
            inst.AnimState:AddOverrideBuild("swap_myth_shovel") --换build
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("mythi_shovel_pre")
            inst.sg.statemem.swap_dig = true
        end,
        events = {
            EventHandler(
                "unequip",
                function(inst)
                    inst.sg:GoToState("idle")
                end
            ),
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg.statemem.swap_dig = false
                        inst.sg:GoToState("myth_yutu_dig")
                    end
                end
            )
        },
        onexit = function(inst)
            if inst.sg.statemem.swap_dig then
                inst.AnimState:ClearOverrideBuild("swap_myth_shovel")
            end
            ResumeHands(inst)
        end
    }
)
AddStategraphState(
    "wilson",
    State {
        name = "myth_yutu_dig",
        tags = {"predig", "digging", "working"},
        onenter = function(inst)
            inst.AnimState:Show("ARM_carry")
             --强制显示手
            inst.AnimState:Hide("ARM_normal")
            inst.AnimState:OverrideSymbol("swap_myth_shovel", "swap_shovel", "swap_shovel")
            inst.AnimState:PlayAnimation("mythi_shovel_loop")
            inst.sg.statemem.action = inst:GetBufferedAction()
        end,
        timeline = {
            TimeEvent(
                15 * FRAMES,
                function(inst)
                    inst:PerformBufferedAction()
                    inst.sg:RemoveStateTag("predig")
                    inst.SoundEmitter:PlaySound("dontstarve/wilson/dig")
                end
            ),
            TimeEvent(
                35 * FRAMES,
                function(inst)
                    if
                        inst.components.playercontroller ~= nil and
                            inst.components.playercontroller:IsAnyOfControlsPressed(
                                CONTROL_SECONDARY,
                                CONTROL_ACTION,
                                CONTROL_CONTROLLER_ACTION
                            ) and
                            inst.sg.statemem.action ~= nil and
                            inst.sg.statemem.action:IsValid() and
                            inst.sg.statemem.action.target ~= nil and
                            inst.sg.statemem.action.target.components.workable ~= nil and
                            inst.sg.statemem.action.target.components.workable:CanBeWorked() and
                            inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action, true) and
                            CanEntitySeeTarget(inst, inst.sg.statemem.action.target)
                     then
                        inst:ClearBufferedAction()
                        inst:PushBufferedAction(inst.sg.statemem.action)
                    end
                end
            )
        },
        events = {
            EventHandler(
                "unequip",
                function(inst)
                    inst.sg:GoToState("idle")
                end
            ),
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.AnimState:PlayAnimation("mythi_shovel_pst")
                        inst.sg:GoToState("idle", true)
                    end
                end
            )
        },
        onexit = function(inst)
            inst.AnimState:ClearOverrideBuild("swap_myth_shovel")
            ResumeHands(inst)
        end
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "myth_yutu_dig_start",
        tags = {"predig", "working"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            if not inst:HasTag("working") then
                inst.AnimState:PlayAnimation("mythi_shovel_pre")
                inst.AnimState:PushAnimation("mythi_shovel_lag", false)
            end

            inst:PerformPreviewBufferedAction()
            inst.sg:SetTimeout(2)
        end,
        onupdate = function(inst)
            if inst:HasTag("working") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.AnimState:PlayAnimation("mythi_shovel_pst")
                inst.sg:GoToState("idle", true)
            end
        end,
        ontimeout = function(inst)
            inst:ClearBufferedAction()
            inst.AnimState:PlayAnimation("mythi_shovel_pst")
            inst.sg:GoToState("idle", true)
        end
    }
)

-------------------===土行孙

local function droptarget(inst)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 12, {"_combat"}, {"player", "playerghost", "INLIMBO"})
    for i, v in ipairs(ents) do
        if
            v and v:IsValid() and not (v.components.health ~= nil and v.components.health:IsDead()) and
                v.components.combat
         then
            if v.components.combat.target == inst then
                v.components.combat:GiveUp()
            end
        end
    end
end

--静止状态

local function playzhu(inst,anim,loop)
    local onwater = inst:IsOnOcean(false)
    if onwater then
        inst.AnimState:HideSymbol("hound_maw")
        inst.AnimState:PlayAnimation("pigsy_water_"..anim,loop)
    else
        inst.AnimState:ShowSymbol("hound_maw")
        inst.AnimState:PlayAnimation("pigsy_"..anim,loop)
    end
end


AddStategraphPostInit(
    "wilson",
    function(sg)
        local idle = sg.states["idle"]
        if idle then
            local old_onenter = idle.onenter
            idle.onenter = function(inst, pushanim)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_idle", pushanim)
                    return
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_idle", pushanim)
                    return
                end
                return old_onenter(inst, pushanim)
            end
        end
    end
)

AddStategraphState(
    "wilson",
    State {
        name = "underground_idle",
        tags = {"idle", "canrotate", "under_ground"},
        onenter = function(inst)
            inst.SoundEmitter:KillSound("move_underground")
            inst.components.locomotor:Stop()
            inst.components.locomotor:Clear()
            if inst.components.drownable ~= nil and inst.components.drownable:ShouldDrown() then
                inst.sg:GoToState("sink_fast")
                return
            end
            inst.AnimState:PlayAnimation("idle_underground", true)
        end
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "pig_zhuzhu_idle",
        tags = {"idle", "canrotate", "pig_zhuzhu"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.components.locomotor:Clear()
            if inst.components.drownable ~= nil and inst.components.drownable:ShouldDrown() then
                inst.sg:GoToState("sink_fast")
                return
            end
            inst.AnimState:SetDeltaTimeMultiplier(0.5)
            playzhu(inst,"idle", true)
            --inst.AnimState:PlayAnimation("pigsy_idle", true)
        end,
        onexit = function(inst)
            inst.AnimState:SetDeltaTimeMultiplier(1)
        end
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "underground_jumpout",
        tags = {"doing", "busy", "canrotate", "nopredict", "nomorph"},
        onenter = function(inst)
            inst._underground:set(false)
            inst.components.locomotor:Stop()
            --inst.components.health:SetInvincible(true)
            inst:StartThread(
                function()
                    for k = 1, 3 do
                        local fx = SpawnPrefab("groundpound_fx")
                        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
                        Sleep(0.2)
                    end
                end
            )
            inst.AnimState:PlayAnimation("jumpout")
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("idle")
                    end
                end
            )
        },
        onexit = function(inst)
            --inst.components.health:SetInvincible(false)
        end
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "underground_jumpin",
        tags = {"doing", "busy", "canrotate", "nopredict", "nomorph"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("jump")
            inst:StartThread(
                function()
                    for k = 1, 4 do
                        local fx = SpawnPrefab("groundpound_fx")
                        fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
                        Sleep(0.2)
                    end
                end
            )
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        droptarget(inst)
                        inst._underground:set(true)
                        inst.AnimState:OverrideSymbol("wormmovefx", "mole_build", "wormmovefx")
                        inst.sg:GoToState("underground_idle")
                    end
                end
            )
        }
    }
)

AddStategraphPostInit(
    "wilson_client",
    function(sg)
        local idle = sg.states["idle"]
        if idle then
            local old_onenter = sg.onenter
            sg.onenter = function(inst, pushanim)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_idle", pushanim)
                    return
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_idle", pushanim)
                    return
                end
                return old_onenter(inst, pushanim)
            end
        end
    end
)
AddStategraphState(
    "wilson_client",
    State {
        name = "underground_idle",
        tags = {"idle", "canrotate", "under_ground"},
        onenter = function(inst, pushanim)
            inst.entity:SetIsPredictingMovement(false)
            inst.components.locomotor:Stop()
            inst.components.locomotor:Clear()
            if pushanim == "cancel" then
                return
            elseif inst:HasTag("nopredict") or inst:HasTag("pausepredict") then
                inst:ClearBufferedAction()
                return
            elseif pushanim == "noanim" then
                inst.sg:SetTimeout(2)
                return
            end
            inst.AnimState:PlayAnimation("idle_underground", true)
        end,
        onexit = function(inst)
            inst.entity:SetIsPredictingMovement(true)
        end
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "pig_zhuzhu_idle",
        tags = {"idle", "canrotate", "pig_zhuzhu"},
        onenter = function(inst, pushanim)
            inst.entity:SetIsPredictingMovement(false)
            inst.components.locomotor:Stop()
            inst.components.locomotor:Clear()
            if pushanim == "cancel" then
                return
            elseif inst:HasTag("nopredict") or inst:HasTag("pausepredict") then
                inst:ClearBufferedAction()
                return
            elseif pushanim == "noanim" then
                inst.sg:SetTimeout(2)
                return
            end
            inst.AnimState:SetDeltaTimeMultiplier(0.5)
            playzhu(inst,"idle", true)
            --inst.AnimState:PlayAnimation("pigsy_idle", true)
        end,
        onexit = function(inst)
            inst.AnimState:SetDeltaTimeMultiplier(1)
            inst.entity:SetIsPredictingMovement(true)
        end
    }
)
----------移动
local IsFlying = function(inst) return inst and inst.components.mk_flyer and inst.components.mk_flyer:IsFlying()end
local function GetSandstormLevel(inst)
    if inst.GetStormLevel ~= nil then
        return inst:GetStormLevel()
    end
    return 0
end

local function ConfigureRunState(inst)
    if inst.components.rider:IsRiding() then
        inst.sg.statemem.riding = true
        inst.sg.statemem.groggy = (inst:HasTag("groggy") or inst:HasTag("bajieele"))
        inst.sg:AddStateTag("nodangle")
    elseif inst.components.inventory:IsHeavyLifting() then
        inst.sg.statemem.heavy = true
    elseif inst:HasTag("wereplayer") then
        inst.sg.statemem.iswere = true
        if inst:HasTag("weremoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.moosegroggy = true
            else
                inst.sg.statemem.moose = true
            end
        elseif inst:HasTag("weregoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.goosegroggy = true
            else
                inst.sg.statemem.goose = true
            end
        elseif inst:HasTag("groggy") then
            inst.sg.statemem.groggy = true
        else
            inst.sg.statemem.normal = true
        end
    elseif GetSandstormLevel(inst) >= TUNING.SANDSTORM_FULL_LEVEL and not inst.components.playervision:HasGoggleVision() then
        inst.sg.statemem.sandstorm = true
    elseif (inst:HasTag("groggy") or inst:HasTag("bajieele")) then
        inst.sg.statemem.groggy = true
    elseif inst:IsCarefulWalking() then
        inst.sg.statemem.careful = true
    else
        inst.sg.statemem.normal = true
    end
end
local function GetRunStateAnim(inst)
    return (inst.sg.statemem.heavy and "heavy_walk")
        or (inst.sg.statemem.sandstorm and "sand_walk")
        or ((inst.sg.statemem.groggy or inst.sg.statemem.moosegroggy or inst.sg.statemem.goosegroggy) and "idle_walk")
        or (inst.sg.statemem.careful and "careful_walk")
        or "run"
end

local function ConfigureRunState_Client(inst)
    if inst.replica.rider ~= nil and inst.replica.rider:IsRiding() then
        inst.sg.statemem.riding = true
        inst.sg.statemem.groggy = inst:HasTag("groggy")
        
        local mount = inst.replica.rider:GetMount()
        inst.sg.statemem.ridingwoby = mount and mount:HasTag("woby")

    elseif inst.replica.inventory:IsHeavyLifting() then
        inst.sg.statemem.heavy = true
    elseif inst:HasTag("wereplayer") then
        inst.sg.statemem.iswere = true
        if inst:HasTag("weremoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.moosegroggy = true
            else
                inst.sg.statemem.moose = true
            end
        elseif inst:HasTag("weregoose") then
            if inst:HasTag("groggy") then
                inst.sg.statemem.goosegroggy = true
            else
                inst.sg.statemem.goose = true
            end
        elseif inst:HasTag("groggy") then
            inst.sg.statemem.groggy = true
        else
            inst.sg.statemem.normal = true
        end
    elseif GetSandstormLevel(inst) >= TUNING.SANDSTORM_FULL_LEVEL and not inst.components.playervision:HasGoggleVision() then
        inst.sg.statemem.sandstorm = true
    elseif inst:HasTag("groggy") then
        inst.sg.statemem.groggy = true
    elseif inst:IsCarefulWalking() then
        inst.sg.statemem.careful = true
    else
        inst.sg.statemem.normal = true
    end
end
local function SpawnMoveFx(inst)
    SpawnPrefab("mole_move_fx").Transform:SetPosition(inst.Transform:GetWorldPosition())
end
AddStategraphPostInit(
    "wilson",
    function(sg)
        local run = sg.states["run"]
        if run ~= nil then
            local old_runonenter = run.onenter
            run.onenter = function(inst, ...)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_walk", pushanim)
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_walk", pushanim)
                elseif inst:HasTag("bajieele") and not IsFlying(inst) then
                    ConfigureRunState(inst)
                    inst.components.locomotor:RunForward()
                    local anim = GetRunStateAnim(inst)
                    if anim == "run" then
                        anim = "idle_walk"
                    end
                    if not inst.AnimState:IsCurrentAnimation(anim) then
                        inst.AnimState:PlayAnimation(anim, true)
                    end
                    inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength() + .5 * FRAMES)
                else
                    old_runonenter(inst, ...)
                end
            end
        end

        local run_start = sg.states["run_start"]
        if run_start ~= nil then
            local old_run_startonenter = run_start.onenter
            run_start.onenter = function(inst, ...)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_walk_pre", pushanim)
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_walk_pre", pushanim)
                elseif inst:HasTag("bajieele") and not IsFlying(inst) then
                    ConfigureRunState(inst)
                    inst.components.locomotor:RunForward()
                    inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pre")
                    inst.sg.mem.footsteps = (inst.sg.statemem.goose or inst.sg.statemem.goosegroggy) and 4 or 0
                else
                    old_run_startonenter(inst, ...)
                end
            end
        end

        local run_stop = sg.states["run_stop"]
        if run_stop ~= nil then
            local old_run_stoponenter = run_stop.onenter
            run_stop.onenter = function(inst, ...)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_walk_pst", pushanim)
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_walk_pst", pushanim)
                elseif inst:HasTag("bajieele") and not IsFlying(inst) then
                    ConfigureRunState(inst)
                    inst.components.locomotor:Stop()
                    inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pst")
                else
                    old_run_stoponenter(inst, ...)
                end
            end
        end
        local hit = sg.states["hit"]
        local old_hitonenter = hit.onenter
        hit.onenter = function(inst, ...)
            if inst:HasTag("pig_zhuzhu") then
                inst.sg:GoToState("pig_zhuzhu_hit")
            else
                old_hitonenter(inst, ...)
            end
        end
    end
)

AddStategraphPostInit(
    "wilson_client",
    function(sg)
        local run = sg.states["run"]
        if run ~= nil then
            local old_runonenter = run.onenter
            run.onenter = function(inst, ...)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_walk", pushanim)
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_walk", pushanim)
                elseif inst:HasTag("bajieele") and not IsFlying(inst) then
                    ConfigureRunState_Client(inst)
                    inst.components.locomotor:RunForward()
                    local anim = GetRunStateAnim(inst)
                    if anim == "run" then
                        anim = "idle_walk"
                    end
                    if not inst.AnimState:IsCurrentAnimation(anim) then
                        inst.AnimState:PlayAnimation(anim, true)
                    end
                    inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength() + .5 * FRAMES)
                else
                    old_runonenter(inst, ...)
                end
            end
        end

        local run_start = sg.states["run_start"]
        if run_start ~= nil then
            local old_run_startonenter = run_start.onenter
            run_start.onenter = function(inst, ...)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_walk_pre", pushanim)
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_walk_pre", pushanim)
                elseif inst:HasTag("bajieele") and not IsFlying(inst) then
                    ConfigureRunState_Client(inst)
                    inst.components.locomotor:RunForward()
                    inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pre")
                    inst.sg.mem.footsteps = (inst.sg.statemem.goose or inst.sg.statemem.goosegroggy) and 4 or 0
                else
                    old_run_startonenter(inst, ...)
                end
            end
        end

        local run_stop = sg.states["run_stop"]
        if run_stop ~= nil then
            local old_run_stoponenter = run_stop.onenter
            run_stop.onenter = function(inst, ...)
                if inst:HasTag("myth_yutu_underground") then
                    inst.sg:GoToState("underground_walk_pst", pushanim)
                elseif inst:HasTag("pig_zhuzhu") then
                    inst.sg:GoToState("pig_zhuzhu_walk_pst", pushanim)
                elseif inst:HasTag("bajieele") and not IsFlying(inst) then
                    ConfigureRunState_Client(inst)
                    inst.components.locomotor:Stop()
                    inst.AnimState:PlayAnimation(GetRunStateAnim(inst).."_pst")
                else
                    old_run_stoponenter(inst, ...)
                end
            end
        end
    end
)


local function ForceStopHeavyLifting(inst)
    if inst.components.inventory:IsHeavyLifting() then
        inst.components.inventory:DropItem(
            inst.components.inventory:Unequip(EQUIPSLOTS.BODY),
            true,
            true
        )
    end
end
local function DoHurtSound(inst)
    if inst.hurtsoundoverride ~= nil then
        inst.SoundEmitter:PlaySound(inst.hurtsoundoverride, nil, inst.hurtsoundvolume)
    elseif not inst:HasTag("mime") then
        inst.SoundEmitter:PlaySound((inst.talker_path_override or "dontstarve/characters/")..(inst.soundsname or inst.prefab).."/hurt", nil, inst.hurtsoundvolume)
    end
end
AddStategraphState(
    "wilson",
    State {
        name = "pig_zhuzhu_hit",
        tags = { "busy", "pausepredict" },

        onenter = function(inst, frozen)
            ForceStopHeavyLifting(inst)
            inst.components.locomotor:Stop()
            inst:ClearBufferedAction()
            playzhu(inst,"hit")
            --inst.AnimState:PlayAnimation("hit")
            if frozen == "noimpactsound" then
                frozen = nil
            else
                inst.SoundEmitter:PlaySoundWithParams("myth_pigsound/sound/pig_hit",{intensity = 0.5})
            end
            DoHurtSound(inst)
            local stun_frames = math.min(math.floor(inst.AnimState:GetCurrentAnimationLength() / FRAMES + .5), frozen and 10 or 6)
            if inst.components.playercontroller ~= nil then
                inst.components.playercontroller:RemotePausePrediction(stun_frames <= 7 and stun_frames or nil)
            end
            inst.sg:SetTimeout(stun_frames * FRAMES)
        end,

        ontimeout = function(inst)
            inst.sg:GoToState("idle", true)
        end,
        events =
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "underground_walk_pre",
        tags = {"moving", "running", "canrotate", "autopredict", "under_ground"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("walkunder_pre")
            if not inst.SoundEmitter:PlayingSound("move_underground") then
                inst.SoundEmitter:PlaySound("dontstarve_DLC001/creatures/mole/move", "move_underground")
            end
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("underground_walk")
                    end
                end
            )
        }
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "pig_zhuzhu_walk_pre",
        tags = {"moving", "running", "canrotate", "autopredict", "pig_zhuzhu"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            playzhu(inst,"walk_pre")
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("pig_zhuzhu_walk")
                    end
                end
            )
        }
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "underground_walk_pre",
        tags = {"moving", "running", "canrotate"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            inst.AnimState:PlayAnimation("walkunder_pre")
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("underground_walk")
                    end
                end
            )
        }
    }
)


AddStategraphState(
    "wilson_client",
    State {
        name = "pig_zhuzhu_walk_pre",
        tags = {"moving", "running", "canrotate"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            playzhu(inst,"walk_pre")
            --inst.AnimState:PlayAnimation("pigsy_walk_pre")
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("pig_zhuzhu_walk")
                    end
                end
            )
        }
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "underground_walk",
        tags = {"moving", "running", "canrotate", "autopredict", "under_ground"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            if not inst.AnimState:IsCurrentAnimation("walkunder_loop") then
                inst.AnimState:PlayAnimation("walkunder_loop", true)
            end
            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength() + .5 * FRAMES)
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        timeline = {
            TimeEvent(0 * FRAMES, SpawnMoveFx),
            TimeEvent(5 * FRAMES, SpawnMoveFx),
            TimeEvent(10 * FRAMES, SpawnMoveFx),
            TimeEvent(15 * FRAMES, SpawnMoveFx),
            TimeEvent(20 * FRAMES, SpawnMoveFx),
            TimeEvent(25 * FRAMES, SpawnMoveFx)
        },
        ontimeout = function(inst)
            inst.sg:GoToState("underground_walk")
        end
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "pig_zhuzhu_walk",
        tags = {"moving", "running", "canrotate", "autopredict", "pig_zhuzhu"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            --if not inst.AnimState:IsCurrentAnimation("pigsy_walk") then
                --playzhu(inst,"walk",true)
                --inst.AnimState:PlayAnimation("pigsy_walk", true)
            --end
            local isonwater = inst:IsOnOcean(false)
            if isonwater then
                inst.AnimState:HideSymbol("hound_maw")
            else
                inst.AnimState:ShowSymbol("hound_maw")
            end
            local anim = isonwater and "pigsy_water_walk" or "pigsy_walk"
            if not inst.AnimState:IsCurrentAnimation(anim) then
                inst.AnimState:PlayAnimation(anim, true)
            end
            inst.sg.statemem.isonwater = isonwater
            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength() + .5 * FRAMES)
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        timeline = {
            TimeEvent(0, function(inst)
                if inst.sg.statemem.isonwater then
                    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/splash/jump_small",nil,.25)
                else
                    PlayFootstep(inst)
                end
            end),
            TimeEvent(4 * FRAMES, function(inst)
                if inst.sg.statemem.isonwater then
                    inst.SoundEmitter:PlaySound("turnoftides/common/together/water/splash/jump_small",nil,.25)
                else
                    PlayFootstep(inst)
                end
            end),
        },
        ontimeout = function(inst)
            inst.sg:GoToState("pig_zhuzhu_walk")
        end
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "underground_walk",
        tags = {"moving", "running", "canrotate"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            if not inst.AnimState:IsCurrentAnimation("walkunder_loop") then
                inst.AnimState:PlayAnimation("walkunder_loop", true)
            end
            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength() + .5 * FRAMES)
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        ontimeout = function(inst)
            inst.sg:GoToState("underground_walk")
        end
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "pig_zhuzhu_walk",
        tags = {"moving", "running", "canrotate"},
        onenter = function(inst)
            inst.components.locomotor:RunForward()
            local isonwater = inst:IsOnOcean(false)
            if isonwater then
                inst.AnimState:HideSymbol("hound_maw")
            else
                inst.AnimState:ShowSymbol("hound_maw")
            end
            local anim = isonwater and "pigsy_water_walk" or "pigsy_walk"
            if not inst.AnimState:IsCurrentAnimation(anim) then
                --playzhu(inst,"walk",true)
                inst.AnimState:PlayAnimation(anim, true)
            end
            inst.sg:SetTimeout(inst.AnimState:GetCurrentAnimationLength() + .5 * FRAMES)
        end,
        onupdate = function(inst)
            inst.components.locomotor:RunForward()
        end,
        ontimeout = function(inst)
            inst.sg:GoToState("pig_zhuzhu_walk")
        end
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "underground_walk_pst",
        tags = {"canrotate", "idle", "autopredict", "under_ground"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("walkunder_pst")
            inst.SoundEmitter:KillSound("move_underground")
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("underground_idle")
                    end
                end
            )
        }
    }
)

AddStategraphState(
    "wilson",
    State {
        name = "pig_zhuzhu_walk_pst",
        tags = {"canrotate", "idle", "autopredict", "pig_zhuzhu"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            playzhu(inst,"walk_pst")
            --inst.AnimState:PlayAnimation("pigsy_walk_pst")
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("pig_zhuzhu_idle")
                    end
                end
            )
        }
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "underground_walk_pst",
        tags = {"canrotate", "idle"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            inst.AnimState:PlayAnimation("walkunder_pst")
            inst.SoundEmitter:KillSound("move_underground")
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("underground_idle")
                    end
                end
            )
        }
    }
)

AddStategraphState(
    "wilson_client",
    State {
        name = "pig_zhuzhu_walk_pst",
        tags = {"canrotate", "idle"},
        onenter = function(inst)
            inst.components.locomotor:Stop()
            playzhu(inst,"walk_pst")
            inst.AnimState:PlayAnimation("pigsy_walk_pst")
        end,
        events = {
            EventHandler(
                "animover",
                function(inst)
                    if inst.AnimState:AnimDone() then
                        inst.sg:GoToState("pig_zhuzhu_idle")
                    end
                end
            )
        }
    }
)

---hud
local yutu_underground = require "widgets/yutu_underground"
AddClassPostConstruct(
    "screens/playerhud",
    function(self)
        local old_CreateOverlays = self.CreateOverlays
        function self:CreateOverlays(owner)
            old_CreateOverlays(self, owner)
            self.yutu_underground = self.overlayroot:AddChild(yutu_underground(owner))
        end
    end
)

---危险的替换函数
local function IsMyAnyPlayerInRangeSq(x, y, z, rangesq, isalive)
    local closestPlayer = nil
    for i, v in ipairs(AllPlayers) do
        if
            (isalive == nil or isalive ~= (v.replica.health:IsDead() or v:HasTag("playerghost"))) and
                not v:HasTag("myth_yutu_underground") and
                v.entity:IsVisible()
         then
            local distsq = v:GetDistanceSqToPoint(x, y, z)
            if distsq < rangesq then
                rangesq = distsq
                closestPlayer = v
            end
        end
    end
    return closestPlayer, closestPlayer ~= nil and rangesq or nil
end

local function IsMyAnyPlayerInRange(x, y, z, range, isalive)
    return IsMyAnyPlayerInRangeSq(x, y, z, range * range, isalive)
end

local function MyIsAnyPlayerInRangeSq(x, y, z, rangesq, isalive)
    for i, v in ipairs(AllPlayers) do
        if (isalive == nil or isalive ~= (v.replica.health:IsDead() or v:HasTag("playerghost"))) and not v:HasTag("myth_yutu_underground") and
            v.entity:IsVisible() and
            v:GetDistanceSqToPoint(x, y, z) < rangesq then
            return true
        end
    end
    return false
end

local function MyIsAnyPlayerInRange(x, y, z, range, isalive)
    return MyIsAnyPlayerInRangeSq(x, y, z, range * range, isalive)
end

local function AnyPlayer(inst, self)
    local x, y, z = inst.Transform:GetWorldPosition()
    if not self.isclose then
        local player = IsMyAnyPlayerInRange(x, y, z, self.near, self.alivemode)
        if player ~= nil then
            self.isclose = true
            if self.onnear ~= nil then
                self.onnear(inst, player)
            end
        end
    elseif not MyIsAnyPlayerInRange(x, y, z, self.far, self.alivemode) then
        self.isclose = false
        if self.onfar ~= nil then
            self.onfar(inst)
        end
    end
end

AddComponentPostInit(
    "playerprox",
    function(self)
        if self.TargetModes then
             self.TargetModes.AnyPlayer = AnyPlayer --重定义一下避免出现问题
            self.targetmode = AnyPlayer --换新的
            self:Schedule()
        end
    end
)

--针对某些特殊的sg 入土状态下不触发
local function noknockback(sg)
    local old_itemranout = sg.events["itemranout"].fn
    if old_itemranout then
        sg.events["itemranout"] =
            EventHandler(
            "itemranout",
            function(inst, data, ...)
                if inst:HasTag("myth_yutu_underground") or inst:HasTag("pig_zhuzhu") then
                    return
                end
                old_itemranout(inst, data, ...)
            end
        )
    end

    local item_in = sg.states["item_in"]
    if item_in then
        local old_onenter = item_in.onenter
        item_in.onenter = function(inst, pushanim)
            if inst:HasTag("myth_yutu_underground") then
                inst.sg:GoToState("underground_idle", pushanim)
                if inst.sg.statemem.followfx ~= nil then
                    for i, v in ipairs(inst.sg.statemem.followfx) do
                        v:Remove()
                    end
                end
                return
            elseif inst:HasTag("pig_zhuzhu") then
                inst.sg:GoToState("pig_zhuzhu_idle", pushanim)
                if inst.sg.statemem.followfx ~= nil then
                    for i, v in ipairs(inst.sg.statemem.followfx) do
                        v:Remove()
                    end
                end
                return
            end
            return old_onenter(inst, pushanim)
        end
    end

    local item_hat = sg.states["item_hat"]
    if item_hat then
        local old_onenter = item_hat.onenter
        item_hat.onenter = function(inst, pushanim)
            if inst:HasTag("myth_yutu_underground") then
                inst.sg:GoToState("underground_idle", pushanim)
                return
            elseif inst:HasTag("pig_zhuzhu") then
                inst.sg:GoToState("pig_zhuzhu_idle", pushanim)
                return
            end
            return old_onenter(inst, pushanim)
        end
    end
end
AddStategraphPostInit("wilson", noknockback)

--更害怕狗？

local hounds = {
    "hound",
    "firehound",
    "icehound",
    "moonhound",
    "clayhound",
    "mutatedhound",
    "warg",
    "skyhound",
    "skyhound_warg"
}

for i, v in ipairs(hounds) do
    AddPrefabPostInit(
        v,
        function(inst)
            if TheWorld.ismastersim then
                if not inst.components.sanityaura then
                    inst:AddComponent("sanityaura")
                end
                local old = inst.components.sanityaura.GetAura
                inst.components.sanityaura.GetAura = function(self, observer)
                    if observer and observer.prefab == "myth_yutu" then
                        local aura_val = 0
                        local distsq = observer:GetDistanceSqToInst(self.inst)
                        if distsq <= (self.max_distsq or (TUNING.SANITY_EFFECT_RANGE * TUNING.SANITY_EFFECT_RANGE)) then
                            aura_val =
                                (-TUNING.SANITYAURA_MED * 2) /
                                (self.fallofffn ~= nil and self.fallofffn(self.inst, observer, distsq) or
                                    math.max(1, distsq))
                        end
                        return aura_val
                    end
                    return old(self, observer)
                end
            end
        end
    )
end

--[[
    GLOBAL.PUP = require ("utils/patchupvaluehelper")
local function ShouldRetryReset(self)
    local t = GetTime()
    if self.resetting and (t-(self.lastgohome or 0 ) < 1 ) then
        local action = self.inst:GetBufferedAction()
        return action == nil or action.action ~= ACTIONS.GOHOME
    end
    self.resetting = true
    self.lastgohome = t
    return false
end

local db = require ("brains/dragonflybrain") 
if db and db.OnStart then 

    PUP.Set(db.OnStart,"ShouldRetryReset",ShouldRetryReset)
 end]]
