util.AddNetworkString("lvs_tram_force_seats")

net.Receive("lvs_tram_force_seats", function(len, ply)
    if not ply:IsSuperAdmin() then
        return
    end

    local ent = net.ReadEntity()

    if not IsValid(ent) then
        return
    end

    for _, ply in ipairs(player.GetAll()) do
        if IsValid(ply) and ply:Alive() and ply:IsBot() then
            ent:Use(ply, ply, USE_ON, 0)
        end
    end
end)