//gravity
if (zspd < 10){
	zspd += GravSpeed;
}

switch(state){
	case trigger_bomb_state.trigger_bomb_idle:
		sprite_index = Spr_Grn_Trigger_Bomb;
		
		//variable to tell the bomb to explode only one bomb
		var _other_bombs = instance_place(x, y, Obj_Trigger_Bomb)
		
		//trigger another explosion if it collides with the flames
		var _flame_collision = instance_place(x,y, ObJ_Bomb_Explosion_Centre)
		
		if (_flame_collision){
			chain_reaction_initiate = true;
		}
		
		if (chain_reaction_initiate = true){
			if explosion_trigger_timer >= 13{
				Bomb_explosion_timer = 0;
				instance_destroy(_flame_collision)
				var _explosion_sound = choose(Snd_Bomb_Exploding_1, Snd_Bomb_Exploding_2, Snd_Bomb_Exploding_3,
				Snd_Bomb_Exploding_4, Snd_Bomb_Exploding_5);
				audio_play_sound(_explosion_sound, 8, false);
				audio_play_sound(Snd_Land_Mine_Detonate, 8, false);
					var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
					_center_flame.x = x;
					_center_flame.y = y;
					//scr_Old_Preset_Blast_Range();
					scr_BlastRange_UP(0, -CELL_HEIGHT, 0);
					scr_BlastRange_DOWN(0, CELL_HEIGHT, 0);
					scr_BlastRange_LEFT(-CELL_WIDTH, 0, 0);
					scr_BlastRange_RIGHT(CELL_WIDTH, 0, 0);
				var _other_triggers = instance_nearest(x, y, Obj_Trigger_Bomb)
								if _other_triggers != noone{
									if creator_instance.Trigger_queue_add >= 1{
										creator_instance.Trigger_queue_add -= 1;
									}
									else if creator_instance.Trigger_queue_add <= 0{
										creator_instance.Trigger_queue_add = 0;
									}
										if creator_instance.Trigger_queue_value >= 2{
											creator_instance.Trigger_queue_value -= 1;
										}
										else if creator_instance.Trigger_queue_value <= 1{
											creator_instance.Trigger_queue_value = 0;
										}
								}
						with (Obj_Trigger_Bomb){
							if chain_reaction_initiate = false{
								In_queue_value -= 1;
							}
						}
				instance_destroy();
			}
			explosion_trigger_timer++;
		}
		
		//if bomb is punched by the player, trigger punch state
			if (bomb_punch_trigger = true){
				bomb_punch_trigger = false;
				zspd = -jumpspd_fly;
				state = trigger_bomb_state.trigger_bomb_punched;
			}
			
		//if bomb is kicked by the player, trigger kick state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
				state = trigger_bomb_state.trigger_bomb_kicked;
			}
			
		//if the creator player presses this key, activate "detonation" state.
			if (creator_instance.key_action_3){
				if (detonation_activate = false){
					if In_queue_value <= 0{
							var _other_triggers = instance_nearest(x, y, Obj_Trigger_Bomb)
								if _other_triggers != noone{
									if creator_instance.Trigger_queue_add >= 1{
										creator_instance.Trigger_queue_add -= 1;
									}
									else if creator_instance.Trigger_queue_add <= 0{
										creator_instance.Trigger_queue_add = 0;
									}
										if creator_instance.Trigger_queue_value >= 2{
											creator_instance.Trigger_queue_value -= 1;
										}
										else if creator_instance.Trigger_queue_value <= 1{
											creator_instance.Trigger_queue_value = 0;
										}
								}
						audio_play_sound(Snd_Land_Mine_Arm, 8, false);
						detonation_activate = true;	
					}
					else if In_queue_value >= 1{
						In_queue_value -= 1;
					}
				}
			}
			
			if (detonation_activate = true){
				image_index = 0;
				state = trigger_bomb_state.trigger_bomb_about_to_explode;
			}
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
	break;
	
	case trigger_bomb_state.trigger_bomb_kicked:
		if (detonation_activate = false){
			sprite_index = Spr_Grn_Trigger_Bomb;
		}
		else if (detonation_activate = true){
			sprite_index = Spr_Grn_Trigger_Bomb_Before_Explode;
		}
		
		//if triggered, detonate the bomb
		if (detonation_activate = true){
			if animation_hit_frame(1){
				audio_play_sound(Snd_Land_Mine_Tick, 8, false);
			}
			
			//makes the bomb "explode"
			if (Bomb_explosion_timer >= 40){
				explosion_trigger_timer = 0;
				var _tile_step = instance_position(x, y, Obj_Tile);
					kick_to_side = false;
					kick_to_vertical = false;
					xspd = 0;
					yspd = 0;
					x = _tile_step.x;
					y = _tile_step.y;
					image_index = 0;
				var _explosion_sound = choose(Snd_Bomb_Exploding_1, Snd_Bomb_Exploding_2, Snd_Bomb_Exploding_3,
				Snd_Bomb_Exploding_4, Snd_Bomb_Exploding_5);
				audio_play_sound(_explosion_sound, 8, false);
				audio_play_sound(Snd_Land_Mine_Detonate, 8, false);
					var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
					_center_flame.x = _tile_step.x
					_center_flame.y = _tile_step.y
					_center_flame.x = x;
					_center_flame.y = y;
					_center_flame.mask_index = _tile_step.mask_index;
					//scr_Old_Preset_Blast_Range();
					scr_BlastRange_UP(0, -CELL_HEIGHT, 0);
					scr_BlastRange_DOWN(0, CELL_HEIGHT, 0);
					scr_BlastRange_LEFT(-CELL_WIDTH, 0, 0);
					scr_BlastRange_RIGHT(CELL_WIDTH, 0, 0);
				instance_destroy();
			}
			if (chain_reaction_initiate = false){
				Bomb_explosion_timer++;
			}
		}
		
		//collisions
		if place_meeting(x + xspd, y, Obj_Par_Wall)
	    {
			var _tile_step = instance_position(x, y, Obj_Tile);
			var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
			audio_play_sound(_bomb_stop_sfx, 8, false);
			x = _tile_step.x;
			y = _tile_step.y;
			xspd = 0;
			state = trigger_bomb_state.trigger_bomb_idle;
		}
		if place_meeting(x, y + yspd, Obj_Par_Wall)
	    {
			var _tile_step = instance_position(x, y, Obj_Tile);
			var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
			audio_play_sound(_bomb_stop_sfx, 8, false);
			x = _tile_step.x;
			y = _tile_step.y;
			yspd = 0;
			state = trigger_bomb_state.trigger_bomb_idle;
		}
		
		//collisions with destructible walls
		if place_meeting(x + xspd, y, Obj_Destructible_Wall)
	    {
			var _tile_step = instance_position(x, y, Obj_Tile);
			var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
			audio_play_sound(_bomb_stop_sfx, 8, false);
			x = _tile_step.x;
			y = _tile_step.y;
			xspd = 0;
			state = trigger_bomb_state.trigger_bomb_idle;
		}
		if place_meeting(x, y + yspd, Obj_Destructible_Wall)
	    {
			var _tile_step = instance_position(x, y, Obj_Tile);
			var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
			audio_play_sound(_bomb_stop_sfx, 8, false);
			x = _tile_step.x;
			y = _tile_step.y;
			yspd = 0;
			state = trigger_bomb_state.trigger_bomb_idle;
		}
		
		//collisions with other bombs
		var _otherbombcollide = instance_place(x, y, Obj_Basic_Bomb)
			if _otherbombcollide != noone{
				var _tile_step = instance_position(x, y, Obj_Tile);
				var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
				audio_play_sound(_bomb_stop_sfx, 8, false);
				xspd = 0;
				yspd = 0;
				x = _tile_step.x;
				y = _tile_step.y;
				state = trigger_bomb_state.trigger_bomb_idle;
			}
		
		//trigger another explosion if it collides with the flames
		var _flame_collision = instance_place(x,y, ObJ_Bomb_Explosion_Centre)
		
		if (_flame_collision){
			chain_reaction_initiate = true;
		}
		
		//destroy the powerup on contact
		var _powerup_destroy = instance_place(x,y, Obj_PU_Parent)
			if (_powerup_destroy){
				instance_destroy(_powerup_destroy);
			}
		
		//if the creator bomberman pressed this key, stop the movement
		if (creator_instance.key_action){
			var _tile_step = instance_position(x, y, Obj_Tile);
			var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
			audio_play_sound(_bomb_stop_sfx, 8, false);
			x = _tile_step.x;
			y = _tile_step.y;
			xspd = 0;
			yspd = 0;
			kick_to_side = false;
			kick_to_vertical = false;
			state = trigger_bomb_state.trigger_bomb_idle;
		}
		
		//if the creator player presses this key, activate "detonation" state.
			if (creator_instance.key_action_3){
				if (detonation_activate = false){
					if In_queue_value <= 0{
							var _other_triggers = instance_nearest(x, y, Obj_Trigger_Bomb)
								if _other_triggers != noone{
									if creator_instance.Trigger_queue_add >= 1{
										creator_instance.Trigger_queue_add -= 1;
									}
									else if creator_instance.Trigger_queue_add <= 0{
										creator_instance.Trigger_queue_add = 0;
									}
										if creator_instance.Trigger_queue_value >= 2{
											creator_instance.Trigger_queue_value -= 1;
										}
										else if creator_instance.Trigger_queue_value <= 1{
											creator_instance.Trigger_queue_value = 0;
										}
								}
						audio_play_sound(Snd_Land_Mine_Arm, 8, false);
						detonation_activate = true;	
					}
					else if In_queue_value >= 1{
						In_queue_value -= 1;
					}
				}
			}
		
			//if bomb is punched by the player, trigger punch state
			if (bomb_punch_trigger = true){
				var _tile_step = instance_position(x, y, Obj_Tile);
				x = _tile_step.x;
				y = _tile_step.y;
				xspd = 0;
				yspd = 0;
				bomb_punch_trigger = false;
				zspd = -jumpspd_fly;
				kick_to_side = false;
				kick_to_vertical = false;
				target_x = x + Tile_skip_count;
				target_x_opposite = x - Tile_skip_count;
				target_y = y + Tile_skip_count_vertical;
				target_y_opposite = y - Tile_skip_count_vertical;
				state = trigger_bomb_state.trigger_bomb_punched;
			}
			
			//DO NOT trigger another kick state when already in kick state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
			}
		
		if (chain_reaction_initiate = true){
			if explosion_trigger_timer >= 7{
				Bomb_explosion_timer = 0;
				var _tile_step = instance_position(x, y, Obj_Tile);
				var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
				audio_play_sound(_bomb_stop_sfx, 8, false);
					kick_to_side = false;
					kick_to_vertical = false;
					xspd = 0;
					yspd = 0;
					x = _tile_step.x;
					y = _tile_step.y;
					image_index = 0;
				instance_destroy(_flame_collision)
				var _explosion_sound = choose(Snd_Bomb_Exploding_1, Snd_Bomb_Exploding_2, Snd_Bomb_Exploding_3,
				Snd_Bomb_Exploding_4, Snd_Bomb_Exploding_5);
				audio_play_sound(_explosion_sound, 8, false);
				audio_play_sound(Snd_Land_Mine_Detonate, 8, false);
					var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
					_center_flame.x = _tile_step.x
					_center_flame.y = _tile_step.y
					_center_flame.x = x;
					_center_flame.y = y;
					_center_flame.mask_index = _tile_step.mask_index;
					//scr_Old_Preset_Blast_Range();
						scr_BlastRange_UP(0, -CELL_HEIGHT, 0);
						scr_BlastRange_DOWN(0, CELL_HEIGHT, 0);
						scr_BlastRange_LEFT(-CELL_WIDTH, 0, 0);
						scr_BlastRange_RIGHT(CELL_WIDTH, 0, 0);
						var _other_triggers = instance_nearest(x, y, Obj_Trigger_Bomb)
								if _other_triggers != noone{
									if creator_instance.Trigger_queue_add >= 1{
										creator_instance.Trigger_queue_add -= 1;
									}
									else if creator_instance.Trigger_queue_add <= 0{
										creator_instance.Trigger_queue_add = 0;
									}
										if creator_instance.Trigger_queue_value >= 2{
											creator_instance.Trigger_queue_value -= 1;
										}
										else if creator_instance.Trigger_queue_value <= 1{
											creator_instance.Trigger_queue_value = 0;
										}
								}
						with (Obj_Trigger_Bomb){
							if chain_reaction_initiate = false{
								In_queue_value -= 1;
							}
						}
				instance_destroy();
			}
			explosion_trigger_timer++;
		}
		
		if (kick_to_side = true){
			x = x + xspd;
		}
		if (kick_to_vertical = true){
			y = y + yspd;
		}
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
	break;
	
	case trigger_bomb_state.trigger_bomb_punched:
		if (detonation_activate = false){
			sprite_index = Spr_Grn_Trigger_Bomb;
		}
		else if (detonation_activate = true){
			sprite_index = Spr_Grn_Trigger_Bomb_Before_Explode;
		}
		
		//if triggered, detonate the bomb
		if (detonation_activate = true){
			if animation_hit_frame(1){
				audio_play_sound(Snd_Land_Mine_Tick, 8, false);
			}
		}
		
		bomb_is_punched = true;
			
		//tile instance definition
		var _tile_collision = instance_place(x, y, Obj_Tile)
		
		var _otherbombcollide_1 = instance_place(x, y, Obj_Basic_Bomb)
		
		//trigger another explosion if it collides with the flames
		var _flame_collision = instance_place(x,y, ObJ_Bomb_Explosion_Centre)
		
		if position_meeting(x,y, _flame_collision){
			chain_reaction_initiate = true;
		}
		
		//stop movement when landing on a tile
		
		/*if (chain_reaction_initiate = true){
			if explosion_trigger_timer >= 7{
				Bomb_explosion_timer = 0;
				var _tile_step = instance_position(x, y, Obj_Tile);
				var _bomb_stop_sfx = choose(Snd_Bomb_Stop_1, Snd_Bomb_Stop_2, Snd_Bomb_Stop_3);
				audio_play_sound(_bomb_stop_sfx, 8, false);
					kick_to_side = false;
					kick_to_vertical = false;
					xspd = 0;
					yspd = 0;
					x = _tile_step.x;
					y = _tile_step.y;
					image_index = 0;
				instance_destroy(_flame_collision)
				var _explosion_sound = choose(Snd_Bomb_Exploding_1, Snd_Bomb_Exploding_2, Snd_Bomb_Exploding_3,
				Snd_Bomb_Exploding_4, Snd_Bomb_Exploding_5);
				audio_play_sound(_explosion_sound, 8, false);
					var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
					_center_flame.x = _tile_step.x
					_center_flame.y = _tile_step.y
					_center_flame.x = x;
					_center_flame.y = y;
					_center_flame.mask_index = _tile_step.mask_index;
					//scr_Old_Preset_Blast_Range();
						scr_BlastRange_UP(0, -CELL_HEIGHT, 0);
						scr_BlastRange_DOWN(0, CELL_HEIGHT, 0);
						scr_BlastRange_LEFT(-CELL_WIDTH, 0, 0);
						scr_BlastRange_RIGHT(CELL_WIDTH, 0, 0);
				instance_destroy();
			}
			explosion_trigger_timer++;
		}
		*/
		
		//makes the bomb "move"
		if (punch_to_side = true){
			if (bomb_did_bounce = false){
				x = lerp(x, target_x, 0.15 * GravSpeed) //<--for higher arc, reduce the amount to 0.1
			}
			else if (bomb_did_bounce = true){
				x = lerp(x, target_x_bounce, 0.20 * GravSpeed)
			}
		}
		if (punch_to_side_opposite = true){
			if (bomb_did_bounce = false){
				x = lerp(x, target_x_opposite, 0.15 * GravSpeed)
			}
			else if (bomb_did_bounce = true){
				x = lerp(x, target_x_bounce_opposite, 0.20 * GravSpeed)
			}
		}
		if (punch_to_vertical = true){
			if (bomb_did_bounce = false){
				y = lerp(y, target_y, 0.15 * GravSpeed)
			}
			else if (bomb_did_bounce = true){
				y = lerp(y, target_y_bounce, 0.20 * GravSpeed)
			}
		}
		if (punch_to_vertical_opposite = true){
			if (bomb_did_bounce = false){
				y = lerp(y, target_y_opposite, 0.15 * GravSpeed)
			}
			else if (bomb_did_bounce = true){
				y = lerp(y, target_y_bounce_opposite, 0.20 * GravSpeed)
			}
		}
		
			//DO NOT trigger another kick state when already in punch state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
			}
			
			//DO NOT trigger another punch state when already in punch state
			if (bomb_punch_trigger = true){
				bomb_punch_trigger = false;
			}
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			if (place_meeting(x, y, Obj_Destructible_Wall)) || (place_meeting(x,y, Obj_PU_Parent)) || place_meeting_notself(x, y, _otherbombcollide_1){
				zspd = 0;
				Z_Axis = floorZ;
				frame_count = 0;
				audio_play_sound(Snd_Bomb_Drop_3, 8, false);
				bomb_did_bounce = true;
				zspd = -3;
				if (punch_to_side = true){
					x = x;
					target_x_bounce = 0;
					target_x_bounce = x + Tile_skip_count_bounce;
				}
				if (punch_to_side_opposite = true){
					x = x;
					target_x_bounce_opposite = 0;
					target_x_bounce_opposite = x - Tile_skip_count_bounce;
				}
				if (punch_to_vertical = true){
					target_y_bounce = 0;
					target_y_bounce = y + Tile_skip_count_vert_bounce;
				}
				if (punch_to_vertical_opposite = true){
					target_y_bounce_opposite = 0;
					target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
				}
			}
			else if (!place_meeting(x, y, Obj_Destructible_Wall)) || (!place_meeting(x,y, Obj_PU_Parent)) || !place_meeting_notself(x, y, _otherbombcollide_1){
				bomb_did_bounce = false;
				bomb_is_punched = false;
				zspd = 0;
				frame_count = 0;
				punch_to_side = false;
				punch_to_side_opposite = false;
				punch_to_vertical = false;
				punch_to_vertical_opposite = false;
				target_x = x + Tile_skip_count;
				target_x_bounce = x + Tile_skip_count_bounce;
				target_x_bounce_opposite = x - Tile_skip_count_bounce;
				target_y_bounce = y + Tile_skip_count_vert_bounce;
				target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
				target_x_opposite = x - Tile_skip_count;
				target_y = y + Tile_skip_count_vertical;
				target_y_opposite = y - Tile_skip_count_vertical;
				audio_play_sound(Snd_Bomb_Drop_3, 8, false);
				state = trigger_bomb_state.trigger_bomb_idle;
				Z_Axis = floorZ;
			}
		}
		
		Z_Axis += zspd;
	break;
	
	case trigger_bomb_state.trigger_bomb_about_to_explode:
		sprite_index = Spr_Grn_Trigger_Bomb_Before_Explode;
		
		if animation_hit_frame(1){
			audio_play_sound(Snd_Land_Mine_Tick, 8, false);
		}
		
		//makes the bomb "explode"
		if (Bomb_explosion_timer >= 40){
			explosion_trigger_timer = 0;
			var _explosion_sound = choose(Snd_Bomb_Exploding_1, Snd_Bomb_Exploding_2, Snd_Bomb_Exploding_3,
			Snd_Bomb_Exploding_4, Snd_Bomb_Exploding_5);
			audio_play_sound(_explosion_sound, 8, false);
			audio_play_sound(Snd_Land_Mine_Detonate, 8, false);
				var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
				_center_flame.x = x;
				_center_flame.y = y;
				//scr_Old_Preset_Blast_Range();
				scr_BlastRange_UP(0, -CELL_HEIGHT, 0);
				scr_BlastRange_DOWN(0, CELL_HEIGHT, 0);
				scr_BlastRange_LEFT(-CELL_WIDTH, 0, 0);
				scr_BlastRange_RIGHT(CELL_WIDTH, 0, 0);
			instance_destroy();
		}
		if (chain_reaction_initiate = false){
			Bomb_explosion_timer++;
		}
		
		//trigger another explosion if it collides with the flames
		var _flame_collision = instance_place(x,y, ObJ_Bomb_Explosion_Centre)
		
		if (_flame_collision){
			chain_reaction_initiate = true;
		}
		
		if (chain_reaction_initiate = true){
			if explosion_trigger_timer >= 13{
				Bomb_explosion_timer = 0;
				instance_destroy(_flame_collision)
				var _explosion_sound = choose(Snd_Bomb_Exploding_1, Snd_Bomb_Exploding_2, Snd_Bomb_Exploding_3,
				Snd_Bomb_Exploding_4, Snd_Bomb_Exploding_5);
				audio_play_sound(_explosion_sound, 8, false);
					var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
					_center_flame.x = x;
					_center_flame.y = y;
					//scr_Old_Preset_Blast_Range();
					scr_BlastRange_UP(0, -CELL_HEIGHT, 0);
					scr_BlastRange_DOWN(0, CELL_HEIGHT, 0);
					scr_BlastRange_LEFT(-CELL_WIDTH, 0, 0);
					scr_BlastRange_RIGHT(CELL_WIDTH, 0, 0);
				instance_destroy();
			}
			explosion_trigger_timer++;
		}
		
		//if bomb is punched by the player, trigger punch state
			if (bomb_punch_trigger = true){
				bomb_punch_trigger = false;
				zspd = -jumpspd_fly;
				state = trigger_bomb_state.trigger_bomb_punched;
			}
			
		//if bomb is kicked by the player, trigger kick state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
				state = trigger_bomb_state.trigger_bomb_kicked;
			}
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
	break;
}
