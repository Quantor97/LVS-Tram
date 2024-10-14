/*
    Copied from the LVS_Base addon
*/

LVS_TRAM = LVS_TRAM or {}
LVS_TRAM.Settings = LVS_TRAM.Settings or {}


local function FileIsEmpty( filename )
	if file.Size( filename, "LUA" ) <= 1 then -- this is suspicous
		local data = file.Read( filename, "LUA" )

		if data and string.len( data ) <= 1 then -- confirm its empty
			return true
		end
	end

	return false
end

local function LoadFilesRecursive( path )
    local files, directories = file.Find( path.."/*", "LUA" )

    for _, filename in pairs( files ) do
        if FileIsEmpty( path.."/"..filename ) then continue end

        if string.StartWith( filename, "sv_" ) then -- sv_ prefix only load serverside
            if SERVER then
                include( path.."/"..filename )
            end

            continue
        end

        if string.StartWith( filename, "cl_" ) then -- cl_ prefix only load clientside
            if SERVER then
                AddCSLuaFile( path.."/"..filename )
            else
                include( path.."/"..filename )
            end

            continue
        end

        -- everything else is shared
        if SERVER then
            AddCSLuaFile( path.."/"..filename )
        end
        include( path.."/"..filename )
    end

    for _, folder in pairs( directories ) do
        LoadFilesRecursive( path.."/"..folder )
    end
end

LoadFilesRecursive("lvs_tram")