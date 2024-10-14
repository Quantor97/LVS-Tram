LVS_TRAM.ModelData = LVS_TRAM.ModelData or {}

LVS_TRAM.ModelData["models/props_vehicles/inbound_tram.mdl"] = {
    PassengerSeats = {
        DefaultExitPos = Vector(0, 0, 20),
        DefaultHeight = 22,

        GapInterval = 2,
        GapStartOffset = false,
        GapSize = -2.807975,

        Seats = {
            {
                MaxSeats = 10,
                NextSeatDirection = Vector(0, 1, 0),

                UseAutoExitPos = true,
                DefaultExitAutoPosOffset = Vector(-15, 0, 5),
                ExitAutoPosOffset = {
                    [1] = Vector(-35, 0, 5),
                    [10] = Vector(-50, 20, 5)
                },

                SeatPos = Vector(34.451111, 72.680794, 0),
                SeatAngle = Angle(0, 90, 0),
                SeatSize = -Vector(-17.579987, 18.419998),
                SeatSizeOffset = Vector(2, 0, 0),
            },
            {
                MaxSeats = 6,
                NextSeatDirection = Vector(0, -1, 0),

                UseAutoExitPos = true,
                DefaultExitAutoPosOffset = Vector(-25, 0, 5),
                
                SeatPos = Vector(-34.224571, 24.603601),
                SeatAngle = Angle(0, -90, 0),
                SeatSize = -Vector(-17.579987, 18.419998),
                SeatSizeOffset = Vector(-17, 0, 0),

            },
            {
                MaxSeats = 2,
                NextSeatDirection = Vector(1, 0, 0),

                UseAutoExitPos = true,
                DefaultExitAutoPosOffset = Vector(-25, 0, 5),
                
                SeatPos = Vector(-21.294741, -48.676205),
                SeatAngle = Angle(0, 0, 0),
                SeatSize = -Vector(17.579987, 18.419998),
                SeatSizeOffset = Vector(0, 0, 0),

                GapInterval = -1,
                GapStartOffset = true,
            },
            {
                MaxSeats = 2,
                NextSeatDirection = Vector(1, 0, 0),

                UseAutoExitPos = true,
                DefaultExitAutoPosOffset = Vector(-20, 0, -5),
                
                SeatPos = Vector(-21.294741, -15.363510),
                SeatAngle = Angle(0, 180, 0),
                SeatSize = -Vector(17.579987, 18.419998),
                SeatSizeOffset = Vector(0, 17, 0),

                GapInterval = -1,
                GapStartOffset = false,
            },
        }
    },
    Doors = {
        {
            Model = "models/props_vehicles/inbound_tram_door.mdl",
            RelPos = Vector(65, 100, 52),
            RelAng = Angle(0, 0, 0)
        }
    }
}