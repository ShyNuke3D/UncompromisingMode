GLOBAL.require("map/terrain")
if GetModConfigData("caveless") == false then

    AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata.location ~= "forest" then
        return
    end

tasksetdata.set_pieces["ToadstoolArena"] = { 1, tasks={"Guarded Squeltch","Merms ahoy","Sane-Blocked Swamp","Squeltch","Swamp start","Tentacle-Blocked Spider Swamp",}}

end)

end
AddRoomPreInit("BGSavanna", function(room)					--This effects the outer areas of the Triple Mac and The Major Beefalo Plains
room.contents.countprefabs=
									{
										trapdoorspawner = function() return math.random(4,5) end,}
end)
AddRoomPreInit("Plain", function(room)						--This effects areas in the Major Beefalo Plains and the Grasslands next to the portal
room.contents.countprefabs=
									{
										trapdoorspawner = function() return math.random(2,4) end,} --returned number for whole area should be multiplied between 2-4 due to multiple rooms
end)
GLOBAL.require("map/rooms/forest/challengespawner")
GLOBAL.require("map/rooms/forest/extraswamp")
AddTaskPreInit("Make a pick",function(task)

task.room_choices["veteranshrine"] = 1

end)
---- KoreanWaffle's LOCK/KEY initialization code
local LOCKS = GLOBAL.LOCKS
local KEYS = GLOBAL.KEYS
local LOCKS_KEYS = GLOBAL.LOCKS_KEYS
--keys
local keycount = 0
for k, v in pairs(KEYS) do
    keycount = keycount + 1
end
KEYS["RICE"] = keycount + 1

--locks
local lockcount = 0
for k, v in pairs(LOCKS) do
    lockcount = lockcount + 1
end
LOCKS["RICE"] = lockcount + 1

--link keys to locks
LOCKS_KEYS[LOCKS.RICE] = {KEYS.RICE}

AddTaskPreInit("Squeltch",function(task)
task.room_choices["ricepatch"] = 1      --Comment to test task based rice worldgen

--table.insert(task.keys_given,KEYS.RICE)   Uncomment to test task based rice worldgen
end)
GLOBAL.require("map/tasks/newswamp")
AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata.location ~= "forest" then
        return
    end

--table.insert(tasksetdata.tasks,"RiceSqueltch")   Uncomment to test task based rice worldgen
end)
--GLOBAL.require("map/static_layouts/licepatch")
--[[local Layouts = GLOBAL.require("map/layouts").Layouts
local StaticLayout = GLOBAL.require("map/static_layout")

Layouts["licepatch"] = StaticLayout.Get("map/static_layouts/licepatch")
AddTaskSetPreInitAny(function(tasksetdata)
    if tasksetdata.location ~= "forest" then
        return
    end
tasksetdata.set_pieces["licepatch"] = {count = 1, tasks = {"Squeltch"}}
end)]]
--[[
("BarePlain", function(room)						If you want it to effect the desert area, uncomment this
room.contents.countprefabs=
									{
										trapdoor = function() return math.random(2,4) end,} --returned number for whole area should be multiplied between 2-4 due to multiple rooms
end)
--]]
--[[
	if GLOBAL.terrain.rooms.LightningBluffAntlion then
		GLOBAL.terrain.rooms.LightningBluffAntlion.contents.distributeprefabs.sandhill = 0.4
	end
	
	if GLOBAL.terrain.rooms.LightningBluffOasis then
	GLOBAL.terrain.rooms.LightningBluffOasis.contents.distributeprefabs.sandhill = 0.6
	end

	if GLOBAL.terrain.rooms.LightningBluffLightning then
		GLOBAL.terrain.rooms.LightningBluffLightning.contents.distributeprefabs.sandhill = 0.4
	end
	
	if GLOBAL.terrain.rooms.BGLightningBluff then
		GLOBAL.terrain.rooms.BGLightningBluff.contents.distributeprefabs.sandhill = 0.4
	end


	GLOBAL.terrain.filter.sandhill = {GLOBAL.GROUND.WOODFLOOR, GLOBAL.GROUND.CARPET, GLOBAL.GROUND.CHECKER, GLOBAL.GROUND.ROAD}
--]]

modimport("init/init_food/init_food_worldgen")
