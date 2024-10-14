AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include("shared.lua")
include("sv_passenger_seats.lua")
include("sv_doors.lua")

function ENT:OnSpawn( PObj )
	local mdl = self:GetModel()

	self.ModelData = LVS_TRAM.ModelData[mdl] or {}

	self:CreatePassengerSeats()
	self:CreateDoors()
end