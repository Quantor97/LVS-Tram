
ENT.Base = "lvs_base"

ENT.PrintName = "Automated Train"
ENT.Author = "meowsandstuff"
ENT.Information = ""
ENT.Category = "[LVS] - Black Mesa Transit System"

ENT.Spawnable			= true -- set to "true" to make it spawnable
ENT.AdminSpawnable		= false

ENT.SpawnNormalOffset = 20 -- spawn normal offset, raise to prevent spawning into the ground
--ENT.SpawnNormalOffsetSpawner = 0 -- offset for ai vehicle spawner

ENT.MDL = "models/props_vehicles/inbound_tram.mdl"
--ENT.MDL_DESTROYED = "models/props_vehicles/jeep01_burnt.mdl"
--[[
ENT.GibModels = {
	"models/gibs/manhack_gib01.mdl",
	"models/gibs/manhack_gib02.mdl",
	"models/gibs/manhack_gib03.mdl",
	"models/gibs/manhack_gib04.mdl",
	"models/props_c17/canisterchunk01a.mdl",
	"models/props_c17/canisterchunk01d.mdl",
	"models/props_c17/oildrumchunk01a.mdl",
	"models/props_c17/oildrumchunk01b.mdl",
	"models/props_c17/oildrumchunk01c.mdl",
	"models/props_c17/oildrumchunk01d.mdl",
	"models/props_c17/oildrumchunk01e.mdl",
}
]]

ENT.AITEAM = 1
--[[
TEAMS:
	0 = FRIENDLY TO EVERYONE
	1 = FRIENDLY TO TEAM 1 and 0
	2 = FRIENDLY TO TEAM 2 and 0
	3 = HOSTILE TO EVERYONE
]]

ENT.MaxHealth = 400 -- max health
--ENT.MaxHealthEngine = 100 -- max health engine
--ENT.MaxHealthFuelTank = 100 -- max health fuel tank

--ENT.DSArmorDamageReduction = 0.1 -- damage reduction multiplier. Damage is clamped to a minimum of 1 tho
--ENT.DSArmorDamageReductionType = DMG_BULLET + DMG_CLUB -- which damage type to damage reduce

--ENT.DSArmorIgnoreDamageType = DMG_SONIC -- ignore this damage type completely
--ENT.DSArmorIgnoreForce = 1000 -- add general immunity against small firearms, 1000 = 10mm armor thickness
--ENT.DSArmorBulletPenetrationAdd = 250 -- changes how far bullets can cheat through the body to hit critical hitpoints and armor


--[[
PLEASE READ:
	Ideally you only need change:

	ENT.MaxVelocity -- to change top speed
	ENT.EngineTorque -- to change acceleration speed
	ENT.EngineIdleRPM -- optional: only used for rpm gauge. This will NOT change engine sound.
	ENT.EngineMaxRPM -- optional: only used for rpm gauge. This will NOT change engine sound.

	ENT.TransGears -- in a sane range based on maxvelocity. Dont set 10 gears for a car that only does 10kmh this will sound like garbage. Ideally use a total of 3 - 6 gears

	I recommend keeping everything else at default settings.
	(leave them commented-out or remove them from this script)
]]

ENT.MaxVelocity = 1400 -- max velocity in forward direction in gmod-units/second
--ENT.MaxVelocityReverse = 700 -- max velocity in reverse

--ENT.EngineCurve = 0.65 -- value goes from 0 to 1. Get into a car and type "developer 1" into the console to see the current engine curve
--ENT.EngineCurveBoostLow = 1 -- first gear torque boost multiplier
ENT.EngineTorque = 150
ENT.EngineIdleRPM = 1000
ENT.EngineMaxRPM = 6000

--ENT.ThrottleRate = 3.5 -- modify the throttle update rate, see it as the speed with which you push the pedal

--ENT.ForceLinearMultiplier = 1 -- multiply all linear forces (such as downforce, wheel side force, ect)
--ENT.ForceAngleMultiplier = 0.5 -- multiply all angular forces such turn stability / inertia. Exception: Wheel/Engine torque. Those remain unchanged.

ENT.TransGears = 4 -- amount of gears in forward direction. NOTE: the engine sound system calculates the  gear ratios based on topspeed and amount of gears. This can not be changed.
--ENT.TransGearsReverse = 1 -- amount of gears in reverse direction
--ENT.TransMinGearHoldTime = 1 -- minimum time the vehicle should stay in a gear before allowing it to shift again.
--ENT.TransShiftSpeed = 0.3 -- in seconds. How fast the transmission handles a shift. The transmission mimics a manual shift by applying clutch, letting off throttle, releasing clutch and applying throttle again even tho it is automatic.
--ENT.TransWobble = 40 -- basically how much "play" is in the drivedrain. 
--ENT.TransWobbleTime = 1.5 -- in seconds. How long after a shift or after applying throttle the engine will wobble up and down in rpm
--ENT.TransWobbleFrequencyMultiplier = 1 -- changes the frequency of the wobble
--ENT.TransShiftSound = "lvs/vehicles/generic/gear_shift.wav"  change gear shift sound

--ENT.SteerSpeed = 3 -- steer speed
--ENT.SteerReturnSpeed = 10 -- steer return speed to neutral steer

--ENT.FastSteerActiveVelocity = 500 -- at which velocity the steering will clamp the steer angle
--ENT.FastSteerAngleClamp = 10 -- to which the steering angle is clamped to when speed is above ENT.FastSteerActiveVelocity
--ENT.FastSteerDeactivationDriftAngle = 7 -- allowed drift angle until ENT.FastSteerActiveVelocity is ignored and the steering becomes unclamped

--ENT.SteerAssistDeadZoneAngle = 1 -- changes how much drift the counter steer system allows before interfering. 1 = 1° of drift without interfering
--ENT.SteerAssistMaxAngle = 15 -- max steering angle the counter steer system is allowed to help the player
--ENT.SteerAssistExponent = 1.5 -- an exponent to the counter steering curve. Just leave it at 1.5
--ENT.SteerAssistMultiplier = 3 -- how "quick" the counter steer system is steering

--ENT.MouseSteerAngle = 20 -- smaller value = more direct steer   bigger value = smoother steer, just leave it at 20
--ENT.MouseSteerExponent = 2 -- just leave it at 2. Fixes wobble.

--ENT.PhysicsWeightScale = 1 -- this is the value you need to change in order to make a vehicle feel heavier. Just leave it at 1 unless you really need to change it
--ENT.PhysicsMass = 1000 -- do not mess with this unless you can balance everything yourself again.
--ENT.PhysicsInertia = Vector(1500,1500,750) -- do not mess with this unless you can balance everything yourself again.
--ENT.PhysicsDampingSpeed = 4000 -- do not mess with this unless you can balance everything yourself again.

--ENT.PhysicsDampingForward = true -- internal physics damping to reduce wobble. Just keep it enabled in forward direction.
--ENT.PhysicsDampingReverse = false -- disabling this in reverse allows for a reverse 180° turn. If you want to go fast in reverse you should set this to true in order to get good stability

--ENT.WheelPhysicsMass = 100 -- do not mess with this unless you can balance everything yourself again.
--ENT.WheelPhysicsInertia = Vector(10,8,10) -- do not mess with this unless you can balance everything yourself again.
--[[
-- physics friction lookup table. The default used one is 10, jeeptire
ENT.WheelPhysicsMaterials = {
	[0] = "friction_00", -- 0
	[1] = "friction_10", --  0.1
	[2] = "friction_25", --  0.25
	[3] = "popcan", --  0.3
	[4] = "glassbottle", --  0.4
	[5] = "glass", --  0.5
	[6] = "snow", --  0.6
	[7] = "roller", --  0.7
	[8] = "rubber", --  0.8
	[9] = "slime", --  0.9
	[10] = "jeeptire", --  1.337 -- i don't believe friction in havok can go above 1, however other settings such as bouncyness and elasticity are affected by it as it seems. We use jeeptire as default even tho it technically isn't the "best" choice, but rather the most common one
	[11] = "jalopytire", -- 1.337
	[12] = "phx_tire_normal", --  3
}
]]

--ENT.AutoReverseVelocity = 50 -- below this velocity the transmission is allowed to automatically shift into reverse when holding the brake button

--ENT.WheelBrakeLockupRPM = 20 -- below this wheel rpm it will engage the auto brake when the throttle is 0

--ENT.WheelBrakeForce = 400 -- how strong the brakes are. Just leave at 400. Allows for good braking while still allowing some turning. It has some build in ABS but it isnt perfect because even tho velocities say it isnt sliding the wheel will still visually slide in source...

--ENT.WheelSideForce = 800 -- basically a sideways cheatforce that gives you better stability in turns. You shouldn't have to edit this.
--ENT.WheelDownForce = 500 -- wheels use jeeptire as physprop. To this a downward force is applied to increase traction. You shouldn't have to edit this.

--ENT.AllowSuperCharger = true -- allow this vehicle to equip a supercharger?
--ENT.SuperChargerVolume = 1 -- change superchager sound volume
--ENT.SuperChargerSound = "lvs/vehicles/generic/supercharger_loop.wav" -- change supercharger sound file

--ENT.AllowTurbo = true -- allow this vehilce to equip a turbocharger?
--ENT.TurboVolume = 1 -- change turbocharger sound volume
--ENT.TurboSound = "lvs/vehicles/generic/turbo_loop.wav" -- change turbo sound file
--ENT.TurboBlowOff = {"lvs/vehicles/generic/turbo_blowoff1.wav","lvs/vehicles/generic/turbo_blowoff1.wav"} -- change blowoff sound. If you only have one file you can just pass it as a string instead of a table.

--ENT.DeleteOnExplode = false -- remove the vehicle when it explodes?

--ENT.lvsAllowEngineTool = true -- alow the engine tool to be used on this vehicle?
--ENT.lvsShowInSpawner = false -- show this vehicle in vehicle spawner entity?

 --[[
--ENT.RandomColor = {} -- table with colors to set on spawn
	-- accepts colors and skin+color combo:

	-- example variant1:
	ENT.RandomColor = {
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
		Color(255,255,255),
	}


	-- example variant2:
	ENT.RandomColor = {
		{
			Skin = 1,
			Color = Color(255,255,255),
			BodyGroups = {
				[1] = 3, -- set bodygroup 1 to 3
				[5] = 7, -- set bodygroup 5 to 7
			},
		},
		{
			Skin = 2,
			Color = Color(255,255,255),
		},
		{
			Skin = 3,
			Color = Color(255,255,255),
		},
		{
			Skin = 4,
			Color = Color(255,255,255),
		},
		{
			Skin = 5,
			Color = Color(255,255,255),
		},
		{
			Skin = 6,
			Color = Color(255,255,255),
			Wheels = {  -- can also color wheels in this variant
				Skin = 0,
				Color = Color(255,255,0),
			},
		},
	}
 ]]
 
ENT.HornSound = "meowsandstuff/bms-joop/horn.wav" -- add a horn sound
ENT.HornSoundInterior = "meowsandstuff/bms-joop/int-horn.wav" -- leave it commented out, that way it uses the same as ENT.HornSound
ENT.HornPos = Vector(40,0,35) -- horn sound position
 
 
--[[weapons]]
function ENT:InitWeapons()
	-- add a weapon:

	local weapon = {}
	weapon.Icon = Material("lvs/weapons/bullet.png")
	weapon.Ammo = 1000
	weapon.Delay = 0.1
	weapon.HeatRateUp = 0.2
	weapon.HeatRateDown = 0.25
	weapon.Attack = function( ent )
		-- "ent" can be either the weapon handler or the vehicle(which has a integrated weapon handler)
		-- "ent" is where ent:SetHeat, ent:GetHeat, ent:GetAmmo ect functions are called on.
		-- for seat 1 (which is the driver), ent is equal to self (the vehicle), passenger seats usually return the weapon handler and not self.
		-- if you want to be 100% sure to get the actual vehicle, just call ent:GetVehicle() it will always return the base vehicle.

		local bullet = {}
		bullet.Src 	= ent:LocalToWorld( Vector(25,0,30) )
		bullet.Dir 	= ent:GetForward()
		bullet.Spread 	= Vector( 0.015,  0.015, 0 )
		bullet.TracerName = "lvs_tracer_orange"
		bullet.Force	= 10 -- this divided by 100 = penetration in mm
		--bullet.Force1km = 5 -- bullet force at 1km
		bullet.HullSize 	= 15
		bullet.Damage	= 10
		bullet.Velocity = 30000
		bullet.SplashDamage = 100
		bullet.SplashDamageRadius = 25
		--bullet.SplashDamageEffect = "lvs_bullet_impact"
		--bullet.SplashDamageType = DMG_SONIC
		bullet.Attacker 	= ent:GetDriver()
		bullet.Callback = function(att, tr, dmginfo) end

		ent:LVSFireBullet( bullet )

		ent:TakeAmmo( 1 )
	end
	weapon.StartAttack = function( ent ) end
	weapon.FinishAttack = function( ent ) end
	weapon.OnSelect = function( ent ) end
	weapon.OnDeselect = function( ent ) end
	weapon.OnThink = function( ent, active ) end
	weapon.OnOverheat = function( ent ) ent:EmitSound("lvs/overheat.wav") end
	weapon.OnRemove = function( ent ) end
	--[[
	weapon.CalcView = function( ent, ply, pos, angles, fov, pod )

		-- build view yourself:
		local view = {}
		view.origin = pos
		view.angles = angles
		view.fov = fov
		view.drawviewer = false

		return view

		--or use inbuild camera system:
		--if pod:GetThirdPersonMode() then
		--	pos = pos + ent:GetUp() * 100 -- move camera 100 units up in third person
		--end
		--return LVS:CalcView( ent, ply, pos, angles, fov, pod )
	end
	]]
	--[[
	weapon.HudPaint = function( ent, X, Y, ply )
		-- hud paint that is only active when the weapon is selected
		-- draw stuff like crosshair here
	end
	]]
	--self:AddWeapon( weapon ) -- add weapon to driver seat. Uncomment to make it useable.

	--self:AddWeapon( weapon, 2 ) -- this would register to weapon to seat 2
	--self:AddWeapon( weapon, 3 ) -- seat 3.. ect

--[[
	-- or use presets (defined in "lvs_base\lua\lvs_framework\autorun\lvs_defaultweapons.lua"):
	self.PosLMG = Vector(25,0,30)	-- this is used internally as variable in LMG script
	self.DirLMG = 0				-- this is used internally as variable in LMG script
	self:AddWeapon( LVS:GetWeaponPreset( "LMG" ) )
]]
end

--[[ engine sounds ]]
-- valid SoundType's are:
-- LVS.SOUNDTYPE_IDLE_ONLY -- only plays in idle
-- LVS.SOUNDTYPE_NONE -- plays all the time except in idle
-- LVS.SOUNDTYPE_REV_UP -- plays when revving up
-- LVS.SOUNDTYPE_REV_DOWN -- plays when revving down
-- LVS.SOUNDTYPE_ALL -- plays all the time
ENT.EngineSounds = {
	{
		sound = "meowsandstuff/bms-joop/idle.wav",
		sound_int = "meowsandstuff/bms-joop/int-idle.wav",
		Volume = 1,
		Pitch = 100,
		PitchMul = 25,
		SoundLevel = 100,
		SoundType = LVS.SOUNDTYPE_IDLE_ONLY,
	},
	{
		sound = "meowsandstuff/bms-joop/med.wav",
		sound_int = "meowsandstuff/bms-joop/int-revup.wav",
		Volume = 2, -- adjust volume
		Pitch = 50, -- start pitch value
		PitchMul = 100, -- value that gets added to Pitch at max engine rpm
		SoundLevel = 100, -- if too quiet, adjust soundlevel.
		SoundType = LVS.SOUNDTYPE_NONE,
		UseDoppler = true, -- use doppler system?
	},

}


--[[ exhaust ]]
--[[
ENT.ExhaustPositions = {
	{
		pos = Vector(-100.04,14.72,4.84),
		ang = Angle(0,180,0),
	},
	{
		pos = Vector(-100.04,-14.72,4.84),
		ang = Angle(0,180,0),
	}
}
]]

ENT.SirenPos = Vector(40,0,35)
ENT.SirenSound = {
    [1] = {
        siren = "",
    },
}

--[[ lights ]]
ENT.Lights = {
	{
		Siren = true,
		Trigger = "1100",
		Sprites = {
			{ pos = Vector(0, -12.3, 38.5), colorR = 0, colorG = 0, colorA = 255, width = 80, height = 80 },
			{ pos = Vector(0, -12.3, 38.5), colorR = 255, colorG = 255, colorA = 255, width = 20, height = 20 },
			{ pos = Vector(0, -22.5, 38.5), colorR = 0, colorG = 0, colorA = 255, width = 80, height = 80 },
			{ pos = Vector(0, -22.5, 38.5), colorR = 255, colorG = 255, colorA = 255, width = 20, height = 20 },
		},tr
	},
	{
		Siren = true,
		Trigger = "0011",
		Sprites = {
			{ pos = Vector(0, 12.3, 38.5), colorG = 93, colorB = 0, colorA = 255, width = 100, height = 100 },
			{ pos = Vector(0, 12.3, 38.5), colorR = 255, colorG = 255, colorA = 255, width = 20, height = 20 },
			{ pos = Vector(0, 22.5, 38.5), colorG = 93, colorB = 0, colorA = 255, width = 100, height = 100 },
			{ pos = Vector(0, 22.5, 38.5), colorR = 255, colorG = 255, colorA = 255, width = 20, height = 20 },
		},
	},
	{
		Trigger = "main",
		SubMaterialID = 16,
		Sprites = {
			{ pos = Vector(93,-29,-5), colorB = 200, colorA = 150, },
			{ pos = Vector(93,-29,-5), colorB = 200, colorA = 150, },

			{ pos = Vector(93,29,-5), colorB = 200, colorA = 150, },
			{ pos = Vector(93,29,-5), colorB = 200, colorA = 150, },

			{ pos = Vector(77.94,22.15,24.26), colorB = 200, colorA = 150, bodygroup = { name = "Headlights", active = { 2 } }, },
			{ pos = Vector(77.94,-22.15,24.26), colorB = 200, colorA = 150, bodygroup = { name = "Headlights", active = { 2 } }, },

			{
				pos = Vector(-89,36,-3),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
			{
				pos = Vector(-89,-36,-3),
				colorG = 0,
				colorB = 0,
				colorA = 150,
			},
		},
		ProjectedTextures = {
			{
				pos = Vector(93,-29,-5),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
			{
				pos = Vector(93,29,-5),
				ang = Angle(0,0,0),
				colorB = 200,
				colorA = 150,
				shadows = true,
			},
		},
	}, --[[ Each table in ENT.Lights MUST have this! Everything below is optional.
						valid triggers are:
						"active"
						"main"
						"main+fog"
						"main+high"
						"main+brake"
						"main+brake+turnright"
						"main+brake+turnleft"
						"high"
						"brake"
						"reverse"
						"turnright"
						"turnleft"
						"fog"


		--SubMaterialID = 1, -- link this trigger to submaterial ID 1 for use with the blend-submaterial system
		--SubMaterialBrightness = 1, -- multiplier for the submaterial's $blendfactor


		Sprites = { -- add sprites
			{ pos = Vector(79.02,19.17,25.57) }, -- minimum requires a pos, everything else is optional and will use default values when not set.

			
			{ -- full list of variables:
				pos = Vector(0,0,0),
				mat = "sprites/light_ignorez",
				width = 50,
				height = 50,
				colorR = 255,
				colorG = 255,
				colorB = 255,
				colorA = 255,
				bodygroup = { name = "WhatEver", active = { 0,1,4 } }, }, -- this sprite is active when "WhatEver" bodygroup is set to 0, 1 or 4
			},


			-- settings recommendations:
			-- (you may need to adjust width and height for each vehicle)

			{ pos = Vector(0,0,0), colorB = 200, colorA = 150 }, -- recommended settings for headlight
			{ pos = Vector(0,0,0), colorG = 0, colorB = 0, colorA = 150 }, -- recommended settings for tail light/brake light
			{ pos = Vector(0,0,0), colorG = 100, colorB = 0, colorA = 50 }, -- recommended settings for turn signals
			{ pos = Vector(0,0,0), colorB = 200, colorA = 150 }, -- recommended settings for fog lights
			{ pos = Vector(0,0,0), colorA = 150 }, -- recommended settings for reverse lights
		},


		ProjectedTextures = {-- add projected textures
			{ pos = Vector(0,0,0), ang = Angle(0,0,0) }, -- minimum requires a pos and ang, everything else is optional and will use default values when not set.

			{ -- full list of variables ( i recommend only replacing what you really need to replace so you dont mess up the highbeam/lowbeam system) :
				pos = Vector(0,0,0),
				ang = Angle(0,0,0),
				mat = "effects/lvs/car_projectedtexture",
				farz = 1000,
				nearz = 75,
				fov = 40,
				colorR = 255,
				colorG = 255,
				colorB = 255,
				colorA = 255,
				brightness = 5,
				shadows = true,
			},

			{ pos = Vector(0,0,0), ang = Angle(0,0,0), colorB = 200, colorA = 150, shadows = true }, -- (recommended settings)
		},



		DynamicLights = { -- dynamic lights
			{ pos = Vector(0,0,0), ang = Angle(0,0,0) }, -- minimum requires a pos, everything else is optional and will use default values when not set.

			-- full list of variables:
			{
				pos = Vector(0,0,0),
				colorR = 255,
				colorG = 255,
				colorB = 255,
				brightness = 0.1,
				decay= 1000,
				size = 128,
				lifetime = 0.1,
			},

			-- settings recommendations:

			-- DONT USE DYNAMIC LIGHTS THEY ARE UGLY
		},

	},]]
}
-- see: https://raw.githubusercontent.com/SpaxscE/lvs_cars/main/zzz_ENT_lights_info.lua
-- or https://discord.com/channels/1036581288653627412/1140195565368508427/1140195750207291403