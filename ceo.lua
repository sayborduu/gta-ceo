local CEO = menu.add_submenu("🔶 CEO-Menu")
local strip_club_afarm = CEO:add_submenu("Strip club Auto-Farm")
local enableStripAutoFarm = false

local function IsNPC(ped)
	if ped == nil or ped:get_pedtype() < 4 then
		return false
	end
	return true
end

local position1
local position2
local position3

function stripAF () 
    while enableStripAutoFarm do
        if enableStripAutoFarm then
            if localplayer == nil then
                return
            end
            
            localplayer:set_position(position1)
            sleep(1)
            
            localplayer:set_position(position2)
            sleep(1)
            menu.kill_all_npcs()
            
            sleep(1)
    
            for ped in replayinterface.get_pickups() do
                local pedPosition = ped:get_position()
                localplayer:set_position(pedPosition)
                sleep(1)
            end
            
            localplayer:set_position(position3)
            sleep(2)
        end
    end
end

strip_club_afarm:add_action("SayBored :)", function() end)
strip_club_afarm:add_action(" ", function() end)

strip_club_afarm:add_action("Set 1st position to beach.", function() end)
strip_club_afarm:add_action("Set 2nd position to Strip Club DOOR.", function() end)
strip_club_afarm:add_action("Set 3rd position to Strip Club Inside.", function() end)
strip_club_afarm:add_action(" ", function() end)

strip_club_afarm:add_action("🟧 Set 1st Pos", function() position1 = localplayer:get_position() end)
strip_club_afarm:add_action("🟧 Set 2nd Pos", function() position2 = localplayer:get_position() end)
strip_club_afarm:add_action("🟧 Set 3rd Pos", function() position3 = localplayer:get_position() end)
strip_club_afarm:add_action(" ", function() end)

strip_club_afarm:add_action("🟢 TP 1st Pos", function() localplayer:set_position(position1) end)
strip_club_afarm:add_action("🟢 TP 2nd Pos", function() localplayer:set_position(position2) end)
strip_club_afarm:add_action("🟢 TP 3rd Pos", function() localplayer:set_position(position3) end)
strip_club_afarm:add_action(" ", function() end)

strip_club_afarm:add_toggle("Enable", function() return enableStripAutoFarm end, function(v) enableStripAutoFarm = v stripAF() end)

CEO:add_action("💸 Get Pickups (Money / weapons)", function () 
    localplayer:set_freeze_momentum(true)
    for ped in replayinterface.get_pickups() do
        local pedPosition = ped:get_position()
        localplayer:set_position(pedPosition)
        sleep(0.2)
        localplayer:set_freeze_momentum(false)
        menu.send_key_press(17)
        menu.send_key_press(17)
        sleep(0.4)
        localplayer:set_freeze_momentum(true)
        sleep(1.5)
    end
    localplayer:set_freeze_momentum(false)
end)

CEO:add_action("🤓 Kill NPCs", function () 
    menu.kill_all_npcs()
end)
