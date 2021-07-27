local assets =
{
    Asset("ANIM", "anim/ds_pig_basic.zip"),
    Asset("ANIM", "anim/ds_pig_actions.zip"),
    Asset("ANIM", "anim/ds_pig_attacks.zip"),
    Asset("ANIM", "anim/scp035host.zip"),
    --Asset("SOUND", "sound/pig.fsb"),
}

local prefabs =
{
}

local MASK_TALK_ATTACK  = {"Come here!", "Time to sing your swan song!", "It's time for your final act!"} 
local MASK_TALK_CHOP  = {"Time for menial labor.", "Well, I suppose I got nothing else to do.", "You're starting to become lazy, pal."} 
local MASK_TALK_IDLE  = {"Did I ever thank you for finding me? Thank you.", "Huh? Nothing, I just saw something out of the corner of my eye.", "That valkrye girl, eh? Right up my alley.", "That scientist with the funny hair, we could use him.", "If we're able, I'd love to have a few days on that \"Wolfgang\" guy.", "That spider kid is quite an odd case, huh?", "Whatever lurks in the dark, it likes me in particular...", "This \"Lunar\" magic seems cool, I wish I was able to feel it.", "Is that a body in the water?", "I don't remember how I got in that crypt.", "Doctor doctor, give me the news!", "Remember, licking doorknobs is illegal on other planets.", "I wonder if the gods can see us from here.", "2 to the 1 to the 1 to the 3!", "It feels good to have a body.", "Huh. This pig's mind is... extremely simple.", "Oh, how I yearn to tap into the mind of a human again.", "Did I just hear something?", "I have an urge to punch something, and I don't know why.", "This world is so... boring. Cmon pal, even you have to be bored here.", "You know what this place needs? More flair. Ya' know?", "I sort of miss the Foundation. How 'bout you?", "(Humming)", "This place is so dark and dreary. Maybe more so than the Foundation, even.", "Did I leave the oven on?", "Hey, want to hear a joke? [DATA EXPUNGED]", "Everything I once known feels so... far away...", "... When was the last time we drank something?", "\"To be, or not to be, that is the question...\" I'm bored...", "How has this body not corroded away yet? Odd.", "I think this place is doing something to me. I feel... weird.", "You look like you're having fun.", "I wonder what that 079 thing is up to.", "Hey, do you think your touch could kill, uh, 682?", "Ahem. 2521... Hey, it works!", "This place gives people more shit than the Peanut. Get it?", "Hey, do you think you could ride those \"Beefalo\" things?"}

local MAX_TARGET_SHARES = 5
local SHARE_TARGET_DIST = 30

local function ontalk(inst, script)
    inst.SoundEmitter:PlaySound("dontstarve/characters/scp035/emote")
    inst.talkcd = 60 + math.random(-10, 10)
end

local function masktimer(inst)
    if inst.talkcd <= 30 and inst.sg:HasStateTag("chopping") then
        inst.components.talker:Say(MASK_TALK_CHOP[math.random(#MASK_TALK_CHOP)], 2.5, false)
    elseif inst.talkcd <= 0 then
        inst.components.talker:Say(MASK_TALK_IDLE[math.random(#MASK_TALK_IDLE)], 2.5, false)
    end
    inst.talkcd = inst.talkcd - 1

    if not inst.sg:HasStateTag("dead") then
        inst.components.health:DoDelta(0.25, nil, nil, true)
    end
end

local function battlecry(combatcmp, target)
    return MASK_TALK_ATTACK, math.random(#MASK_TALK_ATTACK)
end

local function ShouldAcceptItem(inst, item)
    if item.components.equippable and item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        inst.components.talker:Say("It wont fit without corroding, that's annoying.", 2.5, false)
        inst.talkcd = 60 + math.random(-10, 10)
        return false
    end
end

local function OnGetItemFromPlayer(inst, giver, item)
    if item.components.equippable ~= nil and item.components.equippable.equipslot == EQUIPSLOTS.HEAD then
        local current = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HEAD)
        if current ~= nil then
            inst.components.inventory:DropItem(current)
        end
        inst.components.inventory:Equip(item)
        inst.AnimState:Show("hat")
    end
end

local function OnAttackedByDecidRoot(inst, attacker)
    local x, y, z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, SpringCombatMod(SHARE_TARGET_DIST) * .5, { "_combat", "_health", "scpzombie" }, { "INLIMBO" }) --
    local num_helpers = 0
    for i, v in ipairs(ents) do
        if v ~= inst and not v.components.health:IsDead() then
            v:PushEvent("suggest_tree_target", { tree = attacker })
            num_helpers = num_helpers + 1
            if num_helpers >= MAX_TARGET_SHARES then
                break
            end
        end
    end
end

--local function IsScpZombie(dude)
--    return dude:HasTag("scpzombie")
--end

local function OnAttacked(inst, data)
    --print(inst, "OnAttacked")
    local attacker = data.attacker
    inst:ClearBufferedAction()

    if attacker.prefab == "deciduous_root" and attacker.owner ~= nil then 
        OnAttackedByDecidRoot(inst, attacker.owner)
    elseif attacker.prefab ~= "deciduous_root" then
        inst.components.combat:SetTarget(attacker)
        --inst.components.combat:ShareTarget(attacker, SHARE_TARGET_DIST, IsScpZombie, MAX_TARGET_SHARES)
    end
end

local function NormalKeepTargetFn(isnt, target)
    return target and target:IsValid()
end

local function NormalRetargetFn(inst)
    return FindEntity(inst, TUNING.PIG_TARGET_DIST,
        function(guy)
            if not guy.LightWatcher or guy.LightWatcher:IsInLight() then
                return guy:HasTag("monster") and guy.components.health and not guy.components.health:IsDead() and inst.components.combat:CanTarget(guy) and not 
                (inst.components.follower.leader ~= nil and guy:HasTag("abigail"))
            end
        end)
end

local function SuggestTreeTarget(inst, data)
    if data ~= nil and data.tree ~= nil and inst:GetBufferedAction() ~= ACTIONS.CHOP then
        inst.tree_target = data.tree
    end
end

--local function DropMask(inst)
--    if not inst:HasTag("droppedmask") then
--        local mask = SpawnPrefab("scp035item")
--        local x, y, z = inst.Transform:GetWorldPosition()
--        if mask ~= nil then
--            if mask.Physics ~= nil then
--                local speed = 2 + math.random()
--                local angle = math.random() * 2 * PI
--                mask.Transform:SetPosition(x, y + 1, z)
--                mask.Physics:SetVel(speed * math.cos(angle), speed * 3, speed * math.sin(angle))
--            else
--                mask.Transform:SetPosition(x, y, z)
--            end
--        end
--        inst:AddTag("droppedmask")
--    end
--end

local loot = {"scp035item"}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()

    MakeCharacterPhysics(inst, 50, .5)

    inst.DynamicShadow:SetSize(1.5, .75)
    inst.Transform:SetFourFaced()

    --inst:AddTag("pig")
    inst:AddTag("scarytoprey")
    inst:AddTag("companion")
    --inst:AddTag("scpzombie")

    inst.AnimState:SetBank("pigman")
    inst.AnimState:SetBuild("scp035host")
    inst.AnimState:PlayAnimation("idle_loop", true)
    inst.AnimState:Hide("hat")

    --Sneak these into pristine state for optimization

    inst:AddTag("trader")

    inst.talkcd = 60 + math.random(-10, 10)
    ------------------------------------------
    inst:AddComponent("talker")
    --inst.components.talker.ontalk = ontalk
    inst.components.talker.fontsize = 35
    inst.components.talker.font = TALKINGFONT
    --inst.components.talker.colour = Vector3(156/255, 58/255, 4/255)
    inst.components.talker.offset = Vector3(0,-400,0)
    inst.components.talker.ontalk = ontalk
    --inst.components.talker:Say("It's showtime!", 2.5, true)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("locomotor") -- locomotor must be constructed before the stategraph
    inst.components.locomotor.runspeed = TUNING.PIG_RUN_SPEED --5
    inst.components.locomotor.walkspeed = TUNING.PIG_WALK_SPEED --3

    inst:AddComponent("bloomer")
    ------------------------------------------
    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(800)
    ------------------------------------------
    inst:AddComponent("combat")
    inst.components.combat.hiteffectsymbol = "pig_torso"
    MakeMediumBurnableCharacter(inst, "pig_torso")
    inst.components.combat:SetDefaultDamage(33)
    inst.components.combat:SetAttackPeriod(2)
    inst.components.combat:SetKeepTargetFunction(NormalKeepTargetFn)
    inst.components.combat:SetRetargetFunction(3, NormalRetargetFn)
    inst.components.combat:SetTarget(nil)
    inst.components.combat.GetBattleCryString = battlecry
    inst.components.combat.hiteffectsymbol = "pig_torso"
    ------------------------------------------
    MakeMediumBurnableCharacter(inst, "pig_torso")
    ------------------------------------------
    inst:AddComponent("follower")
    ------------------------------------------
    inst:AddComponent("inventory")
    inst.components.inventory.maxslot = 1
    ------------------------------------------
    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot(loot)
    ------------------------------------------
    inst:AddComponent("knownlocations")
    ------------------------------------------
    inst:AddComponent("trader")
    inst.components.trader:Enable()
    inst.components.trader:SetAcceptTest(ShouldAcceptItem)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    ------------------------------------------
    MakeMediumFreezableCharacter(inst, "pig_torso")
    ------------------------------------------
    inst:AddComponent("inspectable")
    ------------------------------------------
    inst:ListenForEvent("attacked", OnAttacked)
    inst:ListenForEvent("suggest_tree_target", SuggestTreeTarget)

    --inst:ListenForEvent("death", DropMask)
    --inst:ListenForEvent("despawn", DropMask)

    local brain = require"brains/scpzombiebrain"
    inst:SetBrain(brain)
    inst:SetStateGraph("SGscpzombie")

    inst:DoPeriodicTask(0.5, function() masktimer(inst) end, 0.5)
    inst:DoPeriodicTask(0.5, function() 
        if inst.components.follower.leader == nil and not (inst.sg:HasStateTag("dead") or inst.sg:HasStateTag("hit")) and inst._killtask == nil then
            inst._killtask = inst:DoTaskInTime(math.random(), inst:Remove())
        end
    end)

    return inst
end

return Prefab("scp035host", fn, assets, prefabs)