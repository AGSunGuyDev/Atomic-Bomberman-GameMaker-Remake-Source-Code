
	key_activate = keyboard_check_pressed(vk_space);
	
		//makes kicked bombs stop moving
key_action = keyboard_check_pressed(ord("H"));
//activates "punch" ability
key_action_2 = keyboard_check_pressed(ord("J"));
//detonates trigger bombs
key_action_3 = keyboard_check_pressed(ord("K"));

//Get xspd and yspd
	key_left = keyboard_check(vk_left)|| keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right)|| keyboard_check(ord("D"));
	key_down = keyboard_check(vk_down)|| keyboard_check(ord("S"));
	key_up = keyboard_check(vk_up)|| keyboard_check(ord("W"));
	keys_left_right = (key_right - key_left);
	keys_up_down = (key_down - key_up);
	xspd = keys_left_right * move_spd;
	yspd = keys_up_down * move_spd;
	xspd_alt = keys_left_right * move_spd;
	yspd_alt = keys_up_down * move_spd;
	key_all_move = xspd - yspd;
	
//get collision with floor
if (Z_Axis+zspd > floorZ){
	zspd = 0;
	Z_Axis = floorZ;
}

Z_Axis+= zspd;

//gravity
if (zspd < 10){
	zspd += GravSpeed;
}

switch(state){
	case Bomberman_Player.Bomberman_idle:
		image_speed = move_spd / 2;
			if yspd == 0
			    {
			    if xspd > 0 {face = RIGHT};
			    if xspd < 0 {face = LEFT};
			    }
			if xspd > 0 && face == LEFT {face = RIGHT};
			if xspd < 0 && face == RIGHT {face = LEFT};
			if xspd == 0
			    {
			    if yspd > 0 {face = DOWN};
			    if yspd < 0 {face = UP};
				}
			if yspd > 0 && face == UP {face = DOWN};
			if yspd < 0 && face == DOWN {face = UP};
		//which sprite we are using?
		if BoredAnimTrigger = false{
			sprite_index = sprite[face];
		}
		else if BoredAnimTrigger = true{
			sprite_index = BoredIdleAnim;
		}
		
		if (BoredAnimTimerTrigger = true){
			if (BoredAnimTimer >= 300){
				BoredAnimTrigger = true;
				BoredAnimTimer = 0;
				BoredAnimTimerTrigger = false;
				BoredIdleAnim = choose(Spr_Grn_Bman_Bored_1, Spr_Grn_Bman_Bored_2,
				Spr_Grn_Bman_Bored_3, Spr_Grn_Bman_Bored_4);
			}
			BoredAnimTimer++;
		}
		
		//collisions
		if place_meeting(x + xspd, y, Obj_Par_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Par_Wall)
	    {
			yspd = 0;
		}
		
		//collisions with destructible walls
		if place_meeting(x + xspd, y, Obj_Destructible_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Destructible_Wall)
	    {
			yspd = 0;
		}
		
		//bomb drop creation script
		if (key_activate) {
	    //only put a bomb if player is not inside another bomb or meeting it
			if (Bombs_left >= 1){
							if (Can_Line_Bomb = true){
								activate_line_bomb_ability += 1;
							}
				if (basic_bomb_type = true){
				    if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Basic_Bomb);
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (pierce_bomb_type = true){
				    if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Basic_Bomb);
							_bomb_create.pierce_form = true;
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (jelly_bomb_type = true){
					if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Jelly_Bomb);
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (trigger_bomb_type = true){
					if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Trigger_Bomb);
							if instance_exists(_bomb_create){
								Trigger_queue_value += 1;
								if Trigger_queue_value >= 2{
									Trigger_queue_add += 1;
									_bomb_create.In_queue_value += Trigger_queue_add;
								}
							}
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
							Trigger_bomb_instance = _bomb_create;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
			}
		}
		
		//bomb collision script
		scr_bomb_collision_idle_state();
		
		//triggers death state
		if (keyboard_check(ord("P"))){
			var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
			Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
			audio_play_sound(_deathaudio, 8, false);
			DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
			Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
			BoredAnimTimer = 0;
			BoredAnimTimerTrigger = false;
			BoredAnimTrigger = false;
			BoredIdleAnim = 0;
			image_speed = 1;
			image_index = 0;
			state = Bomberman_Player.Bomberman_Death;
		}
		
		//if the player's punching ability is enabled and if
		//the player presses action 2 button, activate punch bomb ability
		scr_bomb_punch_collision_idle_state();
		
		//if bomberman collides with the explosion flame at the "fatal flame" phase, trigger death state.
			//if bomberman does NOT collide with the explosion flame at the "fatal flame" phase, do nothing.
			var _flame_death = instance_place(x, y, ObJ_Bomb_Explosion_Centre)
				if instance_exists(_flame_death){
					if (_flame_death.fatal_flame = true){
						var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
						Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
						audio_play_sound(_deathaudio, 8, false);
						DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
						Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
						BoredAnimTimer = 0;
						BoredAnimTimerTrigger = false;
						BoredAnimTrigger = false;
						BoredIdleAnim = 0;
						image_speed = 1;
						image_index = 0;
						state = Bomberman_Player.Bomberman_Death;
					}
					else if (_flame_death.fatal_flame = false){
						//do nothing
					}
			}
		
		//trigger walk state if any of the buttons were pressed
			if (Player_Kicking = false) && (Player_Punching = false){
				if (keys_left_right != 0) || (keys_up_down != 0){
						BoredAnimTimer = 0;
						BoredAnimTimerTrigger = false;
						BoredAnimTrigger = false;
						BoredIdleAnim = 0;
						image_index = 0;
						state = Bomberman_Player.Bomberman_walk;
				}
			}
			else if (Player_Kicking = true) && (Player_Punching = false){
				if (keys_left_right != 0) || (keys_up_down != 0){
					BoredAnimTimer = 0;
					BoredAnimTimerTrigger = false;
					BoredAnimTrigger = false;
					BoredIdleAnim = 0;
					image_index = 0;
					state = Bomberman_Player.Bomberman_Kick;
				}
			}			
			if (Player_Punching = false) && (Player_Kicking = false){
				if (keys_left_right != 0) || (keys_up_down != 0){
						BoredAnimTimer = 0;
						BoredAnimTimerTrigger = false;
						BoredAnimTrigger = false;
						BoredIdleAnim = 0;
						image_index = 0;
						state = Bomberman_Player.Bomberman_walk;
				}
			}
			else if (Player_Punching = true) && (Player_Kicking = false){
				if (keys_left_right != 0) || (keys_up_down != 0){
						BoredAnimTimer = 0;
						BoredAnimTimerTrigger = false;
						BoredAnimTrigger = false;
						BoredIdleAnim = 0;
						image_index = 0;
						state = Bomberman_Player.Bomberman_Punch_Bomb;
				}
			}
			
			x += xspd;
			y += yspd;
	break;
	
	case Bomberman_Player.Bomberman_walk:
		image_speed = move_spd / 2;
			if yspd == 0
			    {
			    if xspd > 0 {face = RIGHT};
			    if xspd < 0 {face = LEFT};
			    }
			if xspd > 0 && face == LEFT {face = RIGHT};
			if xspd < 0 && face == RIGHT {face = LEFT};
			if xspd == 0
			    {
			    if yspd > 0 {face = DOWN};
			    if yspd < 0 {face = UP};
				}
			if yspd > 0 && face == UP {face = DOWN};
			if yspd < 0 && face == DOWN {face = UP};
		sprite_index = Walk_Sprite[face];
		
		//collisions
		if place_meeting(x + xspd, y, Obj_Par_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Par_Wall)
	    {
			yspd = 0;
		}
		
		//collisions with destructible walls
		if place_meeting(x + xspd, y, Obj_Destructible_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Destructible_Wall)
	    {
			yspd = 0;
		}
		
		//bomb drop creation script
				if (key_activate) {
	    //only put a bomb if player is not inside another bomb or meeting it
			if (Bombs_left >= 1){
				if (basic_bomb_type = true){
				    if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Basic_Bomb);
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (pierce_bomb_type = true){
				    if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Basic_Bomb);
							_bomb_create.pierce_form = true;
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (jelly_bomb_type = true){
					if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Jelly_Bomb);
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (trigger_bomb_type = true){
					if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Trigger_Bomb);
							if instance_exists(_bomb_create){
								Trigger_queue_value += 1;
								if Trigger_queue_value >= 2{
									Trigger_queue_add += 1;
									_bomb_create.In_queue_value += Trigger_queue_add;
								}
							}
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
							Trigger_bomb_instance = _bomb_create;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
			}
		}
		
		//bomb collision script
		scr_bomb_collision();
		
		//if the player's punching ability is enabled and if
		//the player presses action 2 button, activate punch bomb ability
		scr_bomb_punch_collision();
		
		//triggers death state
		if (keyboard_check(ord("P"))){
			var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
			Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
			audio_play_sound(_deathaudio, 8, false);
			DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
			Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
			image_speed = 1;
			image_index = 0;
			state = Bomberman_Player.Bomberman_Death;
		}
		
		//if bomberman collides with the explosion flame at the "fatal flame" phase, trigger death state.
			var _flame_death = instance_place(x, y, ObJ_Bomb_Explosion_Centre)
				if instance_exists(_flame_death){
					if (_flame_death.fatal_flame = true){
						var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
						Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
						audio_play_sound(_deathaudio, 8, false);
						DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
						Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
						image_speed = 1;
						image_index = 0;
						state = Bomberman_Player.Bomberman_Death;
					}
					else if (_flame_death.fatal_flame = false){
						//do nothing
					}
			}
		
		//trigger idle state if any of the movement buttons are no longer pressed
			if (Player_Kicking = false) && (Player_Punching = false){
				if (keys_left_right = 0) && (keys_up_down = 0){
					BoredAnimTimerTrigger = true;
					image_index = 0;
					state = Bomberman_Player.Bomberman_idle;
				}
			}
			else if (Player_Kicking = true) && (Player_Punching = false){
				if (keys_left_right = 0) && (keys_up_down = 0){
					BoredAnimTimerTrigger = true;
					image_index = 0;
					state = Bomberman_Player.Bomberman_Kick;
				}
			}		
			if (Player_Punching = false) && (Player_Kicking = false){
				if (keys_left_right = 0) && (keys_up_down = 0){
					BoredAnimTimerTrigger = true;
					image_index = 0;
					state = Bomberman_Player.Bomberman_idle;
				}
			}
			else if (Player_Punching = true) && (Player_Kicking = false){
				if (keys_left_right = 0) && (keys_up_down = 0){
					BoredAnimTimerTrigger = true;
					image_index = 0;
					state = Bomberman_Player.Bomberman_Punch_Bomb;
				}
			}
				
			x += xspd;
			y += yspd;
	break;
	
	case Bomberman_Player.Bomberman_Kick:
			if yspd == 0
			    {
			    if xspd > 0 {face = RIGHT};
			    if xspd < 0 {face = LEFT};
			    }
			if xspd > 0 && face == LEFT {face = RIGHT};
			if xspd < 0 && face == RIGHT {face = LEFT};
			if xspd == 0
			    {
			    if yspd > 0 {face = DOWN};
			    if yspd < 0 {face = UP};
				}
			if yspd > 0 && face == UP {face = DOWN};
			if yspd < 0 && face == DOWN {face = UP};
		sprite_index = Kick_Sprite[face];
		
		//collisions
		if place_meeting(x + xspd, y, Obj_Par_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Par_Wall)
	    {
			yspd = 0;
		}
		
		//collisions with destructible walls
		if place_meeting(x + xspd, y, Obj_Destructible_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Destructible_Wall)
	    {
			yspd = 0;
		}
		
		//bomb drop creation script
		scr_Bomb_Creation_script();
		
		// Check for bomb position
		if (!place_meeting(x + xspd, y + yspd, Obj_Basic_Bomb)){
		    inside_bomb = false;
		}
			if (!inside_bomb && place_meeting(x + xspd, y, Obj_Basic_Bomb)){
			    xspd = 0;
			}
			if (!inside_bomb && place_meeting(x, y + yspd, Obj_Basic_Bomb)){
			    yspd = 0;
			}
		
		//triggers death state
		if (keyboard_check(ord("P"))){
			var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
			Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
			audio_play_sound(_deathaudio, 8, false);
			DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
			Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
			Player_Kicking = false;
			Player_Punching = false;
			image_speed = 1;
			image_index = 0;
			state = Bomberman_Player.Bomberman_Death;
		}
		
		//if bomberman collides with the explosion flame at the "fatal flame" phase, trigger death state.
			var _flame_death = instance_place(x, y, ObJ_Bomb_Explosion_Centre)
				if instance_exists(_flame_death){
					if (_flame_death.fatal_flame = true){
						var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
						Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
						audio_play_sound(_deathaudio, 8, false);
						DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
						Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
						Player_Kicking = false;
						Player_Punching = false;
						image_speed = 1;
						image_index = 0;
						state = Bomberman_Player.Bomberman_Death;
					}
					else if (_flame_death.fatal_flame = false){
						//do nothing
					}
			}
			
			//if the player goes the opposite way, change back to idle state
			if image_index >= 4{
				if (face == LEFT) {
					if (key_right){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
				else if (face == RIGHT) {
					if (key_left){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
				else if (face == UP) {
					if (key_down){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
				else if (face == DOWN) {
					if (key_up){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
			}

		//Move Player
		x += xspd;
		y += yspd;
	break;
	
	case Bomberman_Player.Bomberman_Punch_Bomb:
			if yspd == 0
			    {
			    if xspd > 0 {face = RIGHT};
			    if xspd < 0 {face = LEFT};
			    }
			if xspd > 0 && face == LEFT {face = RIGHT};
			if xspd < 0 && face == RIGHT {face = LEFT};
			if xspd == 0
			    {
			    if yspd > 0 {face = DOWN};
			    if yspd < 0 {face = UP};
				}
			if yspd > 0 && face == UP {face = DOWN};
			if yspd < 0 && face == DOWN {face = UP};
		sprite_index = Punch_sprite[face];
		
		//collisions
		if place_meeting(x + xspd, y, Obj_Par_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Par_Wall)
	    {
			yspd = 0;
		}
		
		//collisions with destructible walls
		if place_meeting(x + xspd, y, Obj_Destructible_Wall)
	    {
			xspd = 0;
		}
		if place_meeting(x, y + yspd, Obj_Destructible_Wall)
	    {
			yspd = 0;
		}
		
		//bomb drop creation script
				if (key_activate) {
	    //only put a bomb if player is not inside another bomb or meeting it
			if (Bombs_left >= 1){
				if (basic_bomb_type = true){
				    if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Basic_Bomb);
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (pierce_bomb_type = true){
				    if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Basic_Bomb);
							_bomb_create.pierce_form = true;
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (jelly_bomb_type = true){
					if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Jelly_Bomb);
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
				else if (trigger_bomb_type = true){
					if (!position_meeting(x, y + 21, Obj_Basic_Bomb)) {
					        var _tile_step = instance_position(x, y + 21, Obj_Tile);
							Bombs_left -= 1;
					        var _bomb_create = instance_create_layer(_tile_step.x, _tile_step.y, "Tile_Layer", Obj_Trigger_Bomb);
							if instance_exists(_bomb_create){
								Trigger_queue_value += 1;
								if Trigger_queue_value >= 2{
									Trigger_queue_add += 1;
									_bomb_create.In_queue_value += Trigger_queue_add;
								}
							}
							_bomb_create.creator_instance = id;
							_bomb_create.Fire_Range = Bomb_Fire_Range;
							Trigger_bomb_instance = _bomb_create;
					        var _bomb_drop_sound = choose(Snd_Bomb_Drop_1, Snd_Bomb_Drop_2, Snd_Bomb_Drop_3);
					        audio_play_sound(_bomb_drop_sound, 8, false);
							inside_bomb = true;
					}
				}
			}
		}
		
		// Check for bomb position
		if (!place_meeting(x + xspd, y + yspd, Obj_Basic_Bomb)){
		    inside_bomb = false;
		}
			if (!inside_bomb && place_meeting(x + xspd, y, Obj_Basic_Bomb)){
			    xspd = 0;
			}
			if (!inside_bomb && place_meeting(x, y + yspd, Obj_Basic_Bomb)){
			    yspd = 0;
			}
		
		//triggers death state
		if (keyboard_check(ord("P"))){
			var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
			Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
			audio_play_sound(_deathaudio, 8, false);
			DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
			Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
			Player_Punching = false;
			Player_Kicking = false;
			image_speed = 1;
			image_index = 0;
			state = Bomberman_Player.Bomberman_Death;
		}
		
		//if bomberman collides with the explosion flame at the "fatal flame" phase, trigger death state.
			var _flame_death = instance_place(x, y, ObJ_Bomb_Explosion_Centre)
				if instance_exists(_flame_death){
					if (_flame_death.fatal_flame = true){
						var _deathaudio = choose(Snd_Bomberman_Die_1, Snd_Bomberman_Die_2, Snd_Bomberman_Die_3, Snd_Bomberman_Die_4, Snd_Bomberman_Die_5, Snd_Bomberman_Die_6,
						Snd_Bomberman_Die_7, Snd_Bomberman_Die_8, Snd_Bomberman_Die_9);
						audio_play_sound(_deathaudio, 8, false);
						DeathSpriteHolder = choose(Spr_Grn_Bman_Die_1, Spr_Grn_Bman_Die_2, Spr_Grn_Bman_Die_3, Spr_Grn_Bman_Die_4,
						Spr_Grn_Bman_Die_5, Spr_Grn_Bman_Die_6);
						Player_Punching = false;
						Player_Kicking = false;
						image_speed = 1;
						image_index = 0;
						state = Bomberman_Player.Bomberman_Death;
					}
					else if (_flame_death.fatal_flame = false){
						//do nothing
					}
			}
			
			//if the player goes the opposite way from 7th frame, change back to idle state
			if image_index >= 5{
				if floor(face == LEFT) {
					if (key_right){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
				else if floor(face == RIGHT) {
					if (key_left){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
				else if floor(face == UP) {
					if (key_down){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
				else if floor(face == DOWN) {
					if (key_up){
						Player_Kicking = false;
						Player_Punching = false;
						BoredAnimTimerTrigger = true;
						image_index = 0;
						image_speed = move_spd / 2;
						state = Bomberman_Player.Bomberman_idle;
					}
				}
			}

		//Move Player
		x += xspd;
		y += yspd;
	break;
	
	case Bomberman_Player.Bomberman_Death:
		sprite_index = DeathSpriteHolder;
	break;
}

