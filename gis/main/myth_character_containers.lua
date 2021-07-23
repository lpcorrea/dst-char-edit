local containers = require "containers"
local params = containers.params
params.yangjian_buzzard =
{
    widget =
    {
        slotpos = {Vector3(80 - 80 * 2 + 80, 0, 0)},
        animbank = "ui_chest_3x3",
        animbuild = "ui_yangjian_buzzard_1x1",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

function params.yangjian_buzzard.itemtestfn(container, item, slot)
    return  not item:HasTag("irreplaceable")
end

--新的格子
local specilitem = {
    --特殊的物品 没有新鲜度的
    deerclops_eyeball = true,
    mandrake = true,
    spidergland = true,
    lightninggoathorn = true,
    minotaurhorn = true
}

local noitem = {
    --特殊的物品 有新鲜度的 但是不可以放进去的
    peach = true,
    bigpeach = true,
    peach_cooked = true,
    peach_cooked = true,
    lotus_flower = true,
    lotus_flower_cooked = true
}

params.medicine_pestle_myth = {
    widget = {
        slotpos = {
            Vector3(0, 32 + 4, 0),
            Vector3(0, -(32 + 4), 0)
        },
        animbank = "ui_cookpot_1x2",
        animbuild = "ui_cookpot_1x2",
        pos = Vector3(200, 0, 0),
        side_align_tip = 100
    },
    acceptsstacks = false,
    type = "cooker"
}

function params.medicine_pestle_myth.itemtestfn(container, item, slot)
    if specilitem[item.prefab] then
        return true
    end
    if item:HasTag("fresh") then
        if not noitem[item.prefab] then
            return true
        end
    end
    return false
end

for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end