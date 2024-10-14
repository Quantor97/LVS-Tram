local Vector = Vector
local Angle = Angle
local IsValid = IsValid
local ents = ents
local ipairs = ipairs

function ENT:CreateDoors()
    local doorData = self.ModelData.Doors

    if not doorData then 
        return 
    end

    self.DoorEnts = {}

    for i, data in ipairs(doorData) do
        local ent = ents.Create("prop_physics")

        if not IsValid(ent) then return end

        ent:SetModel(data.Model)
        ent:SetPos(self:LocalToWorld(data.RelPos))
        ent:SetAngles(self:LocalToWorldAngles(data.RelAng))
        ent:Spawn()
        ent:Activate()
        ent:SetParent(self)

        ent:SetSolid(SOLID_VPHYSICS)
        ent:SetMoveType(MOVETYPE_NONE)
        ent:SetCollisionGroup(COLLISION_GROUP_NONE)

        -- Store the created ent back into the InboundDoors table
        self.DoorEnts[i] = ent
    end
end