
	local require = GLOBAL.require
	
--	[ 	Import Prefabs, Assets, Widgets	]	-
	modimport("init/init_assets")
	modimport("init/init_prefabs")
	modimport("init/init_widgets")
	modimport("init/minimap_icons")
	
--	[ 	Import Names and Descriptions	]	--
	modimport("init/init_names")
	modimport("init/init_descriptions/generic")
	modimport("init/init_descriptions/willow")
	modimport("init/init_descriptions/wolfgang")
	modimport("init/init_descriptions/wendy")
	modimport("init/init_descriptions/wx78")
	modimport("init/init_descriptions/wickerbottom")
	modimport("init/init_descriptions/woodie")
	modimport("init/init_descriptions/wes")
	modimport("init/init_descriptions/waxwell")
	modimport("init/init_descriptions/wathgrithr")
	modimport("init/init_descriptions/webber")
	modimport("init/init_descriptions/winona")
	modimport("init/init_descriptions/wortox")
	modimport("init/init_descriptions/wormwood")
	modimport("init/init_descriptions/warly")
	
--	[ 		Number Tuning and PostInits		]	--

	modimport("init/init_tuning")
	modimport("init/init_prefabpostinit")
	
--	[ 	Console Commands for tests !	]	--
	
	require("uncompromisingcommands")
	
--	[ 				Gamemodes			]	--
	
	local GAMEMODE_UNCOMPROMISING = 0;
	local GAMEMODE_POST_FUELWEAVER = 1;
	local GAMEMODE_CUSTOM_SETTINGS = 2;

	if GLOBAL.GetGameModeProperty("hardcore") then
		modimport("init/init_gamemodes/init_hardcore")
	end

	if GetModConfigData("gamemode") == GAMEMODE_POST_FUELWEAVER then
		print("mode_fuelweaver")
		modimport("init/init_gamemodes/init_post_fuelweaver")
	end
	
--	[ 				Features			]	--
	
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("enable_knockback")) then
		modimport("init/init_knockback")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_monsters")) then
		modimport("init/init_treebuffs")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("rare_food")) then
		modimport("init/init_food_changes")
		modimport("init/init_crockpot")
		--modimport("init/init_rare_foods")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_recipes")) then
		modimport("init/init_recipes")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_monsters")) then
		modimport("init/init_harder_monsters")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_bosses")) then
		--modimport("init/init_harder_bosses")
	end

	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("harder_shadows")) then
		--modimport("init/init_harder_shadows")
	end

	--TODO: Add settings for each individual character after we add many changes
	if GetModConfigData("gamemode") == GAMEMODE_UNCOMPROMISING or
	(GetModConfigData("gamemode") == GAMEMODE_CUSTOM_SETTINGS and GetModConfigData("character_changes")) then
		modimport("init/init_character_changes/generic")
		modimport("init/init_character_changes/willow")
		modimport("init/init_character_changes/wolfgang")
		modimport("init/init_character_changes/wendy")
		modimport("init/init_character_changes/wx78")
		modimport("init/init_character_changes/wickerbottom")
		modimport("init/init_character_changes/woodie")
		modimport("init/init_character_changes/wes")
		modimport("init/init_character_changes/waxwell")
		modimport("init/init_character_changes/wathgrithr")
		modimport("init/init_character_changes/webber")
		modimport("init/init_character_changes/winona")
		modimport("init/init_character_changes/wortox")
		modimport("init/init_character_changes/wormwood")
		modimport("init/init_character_changes/warly")
	end
