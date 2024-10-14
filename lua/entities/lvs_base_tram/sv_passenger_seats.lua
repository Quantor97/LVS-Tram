local Vector = Vector
local Angle = Angle
local ipairs = ipairs

function ENT:CreatePassengerSeats()
    local seatData = self.ModelData.PassengerSeats

    if not seatData then 
        return 
    end

    self.PassengerSeats = {}

    for i, data in ipairs(seatData.Seats) do
        local maxIt = data.MaxSeats or 1
        local seatDir = data.NextSeatDirection or Vector(1, 0, 0)
        local useAutoExitPos = data.UseAutoExitPos or false

        local exitPos = useAutoExitPos and data.DefaultExitAutoPosOffset or seatData.DefaultExitPos
        local seatAng = data.SeatAngle or Angle()
        local gapInterval = data.GapInterval or seatData.GapInterval or 0
        local gapSize = (data.GapSize or seatData.GapSize or 0) * seatDir
        local gapStartOffset = data.GapStartOffset or seatData.GapStartOffset or false

        local seatHeight = data.Height or seatData.DefaultHeight or 0
        local seatPos = data.SeatPos or Vector()
        local sizeOffset = data.SeatSizeOffset or Vector()
        local seatSize = data.SeatSize or Vector()
        local center = seatPos + seatSize * Vector(0.5, 0.5, 0) + Vector(0, 0, seatHeight)

        local lastSeatPos = center + sizeOffset
        local nextSeatPos = seatSize * seatDir

        for j = 1, maxIt do
            -- Calculate the exit position per seat
            local exitPosPerSeat = useAutoExitPos and (data.ExitAutoPosOffset and data.ExitAutoPosOffset[j] or exitPos) or exitPos
            exitPosPerSeat = useAutoExitPos and exitPosPerSeat + lastSeatPos or exitPosPerSeat

            -- Determine the gap between seats
            local gap = (gapInterval > 0 and j > 1 and j % gapInterval == 0) and gapSize or Vector()

            -- Add the seat (either driver or passenger)
            local pod = (i == 1 and j == 1) and self:AddDriverSeat(lastSeatPos, seatAng) 
                or self:AddPassengerSeat(lastSeatPos, seatAng)
            
            -- Update lastSeatPos for the next iteration
            lastSeatPos = lastSeatPos + ( j == 1 and gapStartOffset and gapSize or gap + nextSeatPos )

            pod.ExitPos = exitPosPerSeat

            table.insert(self.PassengerSeats, pod)
        end
    end
end