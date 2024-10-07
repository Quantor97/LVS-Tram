local points = {}
local ent = nil

concommand.Add("lvs_tram_set_ent", function(ply, cmd, args)
    ent = ply:GetEyeTrace().Entity

    if not IsValid(ent) then
        print("Invalid entity")
        return
    end

    print(string.format("Entity set: %s", ent:GetClass()))
end)

concommand.Add("lvs_tram_relative_pos", function(ply, cmd, args)
    local x = tonumber(args[1])
    local y = tonumber(args[2])
    local z = tonumber(args[3])

    if not x or not y or not z then
        print("Invalid arguments")
        return
    end

    if not ent then
        print("No entity selected")
        return
    end

    print(string.format("Relative position: %s", ent:WorldToLocal(Vector(x, y, z))))
end)

concommand.Add("lvs_tram_set_points", function(ply, cmd, args)
    if not ply:IsSuperAdmin() then 
        return 
    end

    if not ent then
        print("No entity selected")
        return
    end

    local index = args[1] or #points + 1

    if not points[index] then
        points[index] = {}
    end

    local tr = ply:GetEyeTrace()
    local pos = tr.HitPos
    local relativePos = ent:WorldToLocal(pos)

    local point = points[index]
    local mode = ""

    if point.startPos and point.endPos then
        local indexBox = tonumber(args[2])

        if indexBox == 1 then
            mode = "start"
        elseif indexBox == 2 then
            mode = "end"
        elseif indexBox == 0 then
            mode = "clear"
        end
    end

    if not point.startPos then
        hook.Add("PostDrawOpaqueRenderables", "lvs_tram_draw_points", pointsVisualizer)

        mode = "start"
    elseif not point.endPos then
        mode = "end"
    end

    if mode == "start" then
        point.startPos = pos

        print(string.format("[%s] Relative start position set: %s", index, relativePos))
    elseif mode == "end" then
        point.endPos = pos

        print(string.format("[%s] Relative end position set: %s", index, relativePos))
    else 
        hook.Remove("PostDrawOpaqueRenderables", "lvs_tram_draw_points")

        point = {}
    end
end)


concommand.Add("lvs_tram_clear_points", function(ply, cmd, args)
    if not ply:IsSuperAdmin() then 
        return 
    end

    hook.Remove("PostDrawOpaqueRenderables", "lvs_tram_draw_points")
    points = {}
end)

concommand.Add("lvs_tram_force_seat", function(ply, cmd, args)
    if not ply:IsSuperAdmin() then 
        return 
    end

    local vehicle = LocalPlayer():GetEyeTrace().Entity

    if not IsValid(vehicle) then
        print("Invalid vehicle")
        return
    end

    net.Start("lvs_tram_debug")
        net.WriteEntity(vehicle)
    net.SendToServer()
end)

local function pointsVisualizer()
    for k, v in pairs(points) do
        if not v.startPos then
            continue
        end

        render.DrawSphere(v.startPos, 1, 10, 10, Color(0, 255, 0), true)

        if not v.endPos then
            continue
        end

        render.DrawSphere(v.endPos, 1, 10, 10, Color(0, 255, 0), true)

        local difPos = v.endPos - v.startPos

        local minBox = Vector()
        local maxBox = Vector(difPos.x, difPos.y, 1)

        render.DrawBox(v.startPos, Angle(0, 0, 0), minBox, maxBox, Color(0, 255, 0), true)
    end
end