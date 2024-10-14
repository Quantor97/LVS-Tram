-- Toolgun Code (GMod Lua)
TOOL.Category = "LVS"
TOOL.Name = "#tool.tramroutetool.name"

cleanup.Register("tram_route_points")

if CLIENT then
	TOOL.Information = {
		{ name = "info", stage = 1 },
		{ name = "left" },
		{ name = "right" },
		{ name = "right_use", icon2 = "gui/e.png" },
		{ name = "reload" },
		{ name = "reload_use", icon2 = "gui/e.png" },
	}

    language.Add( "tool.tramroutetool.name", "Tram Route Tool")
    language.Add( "tool.tramroutetool.desc", "Create a tram route for LVS Trams")

	language.Add( "tool.tramroutetool.0", "See information in the context menu" )
	-- language.Add( "tool.tramroutetool.left", "Select an object" )
	-- language.Add( "tool.tramroutetool.right", "Select next mode" )
	-- language.Add( "tool.tramroutetool.right_use", "Select previous mode" )
	-- language.Add( "tool.tramroutetool.reload", "Select yourself" )
	-- language.Add( "tool.tramroutetool.reload_use", "Select your view model" )
end

local function panelTramList(panel)
    local tramList = vgui.Create("DListView", panel)
    tramList:SetMultiSelect(false)
    tramList:AddColumn("LVS Trams")
    tramList:SetSize(200, 200)
    tramList:Dock(TOP)

    local trams = {}

    -- TODO: Get entities that inherit from lvs_base_tram
    for _, tram in pairs(ents.FindByClass("lvs_base_tram")) do
            local name = tostring(tram)
            table.insert(trams, tram)

            tramList:AddLine(name)
    end
end

-- local conVarsDefault = TOOL:BuildConVarList()

function TOOL.BuildCPanel(panel)
    panelTramList(panel)
end

if SERVER then
    util.AddNetworkString("tvs_tram_route_points")

    local routePoints = {}

    function TOOL:AddPoint(pos)
        table.insert(routePoints, pos)
        self:UpdateClients()
    end

    function TOOL:RemoveLastPoint()
        table.remove(routePoints)
        self:UpdateClients()
    end

    function TOOL:UpdateClients()
        net.Start("tvs_tram_route_points")
        net.WriteTable(routePoints)
        net.Broadcast()
    end

    function TOOL:LeftClick(trace)
        if trace.Hit then
            self:AddPoint(trace.HitPos)
            return true
        end
        return false
    end

    function TOOL:RightClick(trace)
        self:RemoveLastPoint()
        return true
    end
end