minetest.register_node("gum:gum", {
    description = "Gum",
    tiles = {  
		"gum_gum_up.png",
		"gum_gum_down.png",
        "gum_gum.png",
        "gum_gum.png",		
        "gum_gum.png",
		"gum_gum.png"
    },
    is_ground_content = true,
    groups = {crumbly = 3},
    drop = "gum:gum_fragments"
})

minetest.register_craftitem("gum:gum_fragments", {
    description = "Gum piece",
    inventory_image = "gum_gum_fragments.png"
})

minetest.register_craft({
    output = "gum:gum 1",
    recipe = {
   {"gum:gum_fragments","gum:gum_fragments", "gum:gum_fragments"},
   {"gum:gum_fragments","gum:gum_fragments", "gum:gum_fragments"},
   {"gum:gum_fragments","gum:gum_fragments", "gum:gum_fragments"},
   }
})

local c_gum = minetest.get_content_id("gum:gum")

--Apparition de la gomme dans les mines

minetest.register_ore({
		ore_type       = "blob",
		ore            = "gum:gum",
		wherein        = "default:stone",
		clust_scarcity = 9* 9* 9,
		clust_num_ores = 4,
		clust_size     = 3,
		height_min     = -1000,
		height_max     = -100,
	})
	
	--Les outils en gomme
	
	minetest.register_tool("gum:pick_gum", {
	description = "Gum Pickaxe",
	inventory_image = "gum_tool_gum.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[2]=1.4, [2]=1.60, [3]=1}, uses=15, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
    output = "gum:pick_gum",
    recipe = {
   {"gum:gum","gum:gum", "gum:gum"},
   {"","gum:gum_fragments", ""},
   {"","gum:gum_fragments", ""},
   }
})

minetest.register_tool("gum:axe_gum", {
	description = "Gum Axe",
	inventory_image = "gum_tool_gumaxe.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.70, [2]=1.60, [3]=1.20}, uses=15, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
    output = "gum:axe_gum",
    recipe = {
   {"gum:gum","gum:gum", ""},
   {"gum:gum","gum:gum_fragments", ""},
   {"","gum:gum_fragments", ""},
   }
})

minetest.register_tool("gum:shovel_gum", {
	description = "Gum Shovel",
	inventory_image = "gum_tool_gumshovel.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
    output = "gum:shovel_gum",
    recipe = {
   {"","gum:gum", ""},
   {"","gum:gum_fragments", ""},
   {"","gum:gum_fragments", ""},
   }
})

minetest.register_tool("gum:sword_gum", {
	description = "Gum Sword",
	inventory_image = "gum_tool_gumword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.6, [2]=1.30, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=6},
	},
	sound = {breaks = "default_tool_breaks"},
})

minetest.register_craft({
    output = "gum:sword_gum",
    recipe = {
   {"","gum:gum", ""},
   {"","gum:gum", ""},
   {"","gum:gum_fragments", ""},
   }
})

--Les armures en gomme
-- physics_speed=0.1

armor:register_armor("gum:gum_boots", {
	description = "Gum Boots",
	inventory_image = "gum_inv_boots.png",
	texture = "gum_boots.png",
	preview = "gum_boots_preview.png",
	groups = {armor_feet=1, armor_use=1500, physics_speed=0.1, flammable=1},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:getpos()
		if pos then
			minetest.sound_play({
				name = "mod_name_break_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})



minetest.register_craft({
    output = "gum:gum_boots",
    recipe = {
   {"","", ""},
   {"gum:gum","gum:gum", "gum:gum"},
   {"gum:gum","", "gum:gum"},
   }
})


armor:register_armor("gum:gum_leggings", {
	description = "Gum Leggings",
	inventory_image = "inv_leggings.png",
	texture = "leggings.png",
	preview = "leggings_preview.png",
	groups = {armor_legs=1, armor_use=1500, physics_speed=0.1, flammable=1},
	armor_groups = {fleshy=10.5, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:getpos()
		if pos then
			minetest.sound_play({
				name = "mod_name_break_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

minetest.register_craft({
    output = "gum:gum_leggings",
    recipe = {
   {"gum:gum","gum:gum", "gum:gum"},
   {"gum:gum","", "gum:gum"},
   {"gum:gum","", "gum:gum"},
   }
})


armor:register_armor("gum:gum_helmet", {
	description = "Gum Helmet",
	inventory_image = "inv_helmet.png",
	texture = "helmet.png",
	preview = "helmet_preview.png",
	groups = {armor_head=1, armor_use=1500, physics_speed=0.1, flammable=1},
	armor_groups = {fleshy=10, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:getpos()
		if pos then
			minetest.sound_play({
				name = "mod_name_break_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

minetest.register_craft({
    output = "gum:gum_helmet",
    recipe = {
   {"gum:gum","gum:gum", "gum:gum"},
   {"gum:gum","", "gum:gum"},
   {"","", ""},
   }
})


armor:register_armor("gum:gum_chestplate", {
	description = "Gum Chestplate",
	inventory_image = "inv_chestplatet.png",
	texture = "chestplate.png",
	preview = "chestplate_preview.png",
	groups = {armor_torso=1, armor_use=1500, physics_speed=0.1, flammable=1},
	armor_groups = {fleshy=11, radiation=10},
	damage_groups = {cracky=3, snappy=3, choppy=3, crumbly=3, level=1},
	reciprocate_damage = true,
	on_destroy = function(player, index, stack)
		local pos = player:getpos()
		if pos then
			minetest.sound_play({
				name = "mod_name_break_sound",
				pos = pos,
				gain = 0.5,
			})
		end
	end,
})

minetest.register_craft({
    output = "gum:gum_chestplate",
    recipe = {
   {"gum:gum","", "gum:gum"},
   {"gum:gum","gum:gum", "gum:gum"},
   {"gum:gum","gum:gum", "gum:gum"},
   }
})