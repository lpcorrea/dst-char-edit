
local function posfn(inst)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
end

return	MakePlacer("yt_rabbithole_placer", "rabbithole", "rabbit_hole", "idle",nil,nil,nil,nil,nil,nil,posfn)
