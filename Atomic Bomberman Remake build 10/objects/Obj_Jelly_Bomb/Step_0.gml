//gravity
if (zspd < 10){
	zspd += GravSpeed;
}

switch(state){
	case jelly_bomb_state.jelly_bomb_idle:
		sprite_index = Spr_Grn_Jelly_Bomb;
		
		//makes the bomb "explode"
		if (Bomb_explosion_timer >= 120){
			explosion_trigger_timer = 0;
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
				bmb_bounce_interval = irandom_range(1, 3);
				bmb_bounce_amount = irandom_range(4, 8);			
				state = jelly_bomb_state.jelly_bomb_punched;
			}
			
			//if bomb is kicked by the player, trigger kick state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
				state = jelly_bomb_state.jelly_bomb_kicked;
			}
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
	break;
	
	case jelly_bomb_state.jelly_bomb_kicked:
		sprite_index = Spr_Grn_Jelly_Bomb;
		
		//collisions with basic walls
		if place_meeting(x + xspd, y, Obj_Par_Wall)
	    {
			xspd = -xspd;
			scr_Jelly_Bomb_bounce_sfx();
		}
		if place_meeting(x, y + yspd, Obj_Par_Wall)
	    {
			yspd = -yspd;
			scr_Jelly_Bomb_bounce_sfx();
		}
		
		//collisions with destructible walls
		if place_meeting(x + xspd, y, Obj_Destructible_Wall)
	    {
			xspd = -xspd;
			scr_Jelly_Bomb_bounce_sfx();
		}
		if place_meeting(x, y + yspd, Obj_Destructible_Wall)
	    {
			yspd = -yspd;
			scr_Jelly_Bomb_bounce_sfx();
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
				bmb_bounce_interval = irandom_range(1, 3);
				bmb_bounce_amount = irandom_range(4, 8);
				state = jelly_bomb_state.jelly_bomb_punched;
			}
			
			//DO NOT trigger another kick state when already in kick state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
			}
		
		//collisions with other bombs
		var _otherbombcollide = instance_place(x, y, Obj_Basic_Bomb)
			if _otherbombcollide != noone{
				if kick_to_side = true{
					xspd = -xspd;
					scr_Jelly_Bomb_bounce_sfx();
				}
				if kick_to_vertical = true{
					yspd = -yspd;
					scr_Jelly_Bomb_bounce_sfx();
				}
			}
		
		//makes the bomb "explode"
		if (Bomb_explosion_timer >= 120){
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
			state = jelly_bomb_state.jelly_bomb_idle;
		}
		
		//if chain reaction was initiated, stop the bomb and explode
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
	
	case jelly_bomb_state.jelly_bomb_punched:
		sprite_index = Spr_Grn_Jelly_Bomb;	
		
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
		
		//DO NOT trigger another kick state when already in punch state
			if (bomb_kick_trigger = true){
				bomb_kick_trigger = false;
			}
			
			//DO NOT trigger another punch state when already in punch state
			if (bomb_punch_trigger = true){
				bomb_punch_trigger = false;
			}
		
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
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			if (place_meeting(x, y, Obj_Destructible_Wall)) && bmb_bounce_amount >= 1 || (place_meeting(x,y, Obj_PU_Parent)) && bmb_bounce_amount >= 1 || place_meeting_notself(x, y, _otherbombcollide_1) && bmb_bounce_amount >= 1 || place_meeting(x, y, Obj_Par_Wall) && bmb_bounce_amount >= 1
			|| (!place_meeting(x, y, Obj_Destructible_Wall)) && bmb_bounce_amount >= 1 || (!place_meeting(x,y, Obj_PU_Parent)) && bmb_bounce_amount >= 1 || !place_meeting_notself(x, y, _otherbombcollide_1) && bmb_bounce_amount >= 1 || !place_meeting(x, y, Obj_Par_Wall) && bmb_bounce_amount >= 1
			{
				zspd = 0;
				Z_Axis = floorZ;
				frame_count = 0;
				audio_play_sound(Snd_Bomb_Drop_3, 8, false);
				bomb_did_bounce = true;
				zspd = -3;
				bmb_bounce_interval -= 1;
				bmb_bounce_amount -= 1;
				if (punch_to_side = true){
					x = x;
					target_x_bounce = 0;
					if bmb_bounce_interval >= 1{
						target_x_bounce = x + Tile_skip_count_bounce;
					}
					else if bmb_bounce_interval <= 0{ //change our direction if bounce interval becomes 0
						punch_to_side = false;
						target_x_bounce = x + Tile_skip_count_bounce;
						bmb_bounce_interval = irandom_range(1, 3);
						//choose which direction we want to go, up, down or left
							target_random_change = choose(target_x_bounce_opposite, target_y_bounce, target_y_bounce_opposite)
							if target_random_change = target_y_bounce{
								target_random_change = 0;
								punch_to_vertical = true;
								target_y_bounce = y + Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_y_bounce_opposite{
								target_random_change = 0;
								punch_to_vertical_opposite = true;
								target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce_opposite{
								target_random_change = 0;
								punch_to_side_opposite = true;
								target_x_bounce_opposite = x - Tile_skip_count_bounce;
							}
					}
				}
				if (punch_to_side_opposite = true){
					x = x;
					target_x_bounce_opposite = 0;
					if bmb_bounce_interval >= 1{
						target_x_bounce_opposite = x - Tile_skip_count_bounce;
					}
					else if bmb_bounce_interval <= 0{
						punch_to_side_opposite = false;
						target_x_bounce_opposite = x - Tile_skip_count_bounce;
						bmb_bounce_interval = irandom_range(1, 3);
						//choose which direction we want to go, up, down or right
							target_random_change = choose(target_x_bounce, target_y_bounce, target_y_bounce_opposite)
							if target_random_change = target_y_bounce{
								target_random_change = 0;
								punch_to_vertical = true;
								target_y_bounce = y + Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_y_bounce_opposite{
								target_random_change = 0;
								punch_to_vertical_opposite = true;
								target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce{
								target_random_change = 0;
								punch_to_side = true;
								target_x_bounce = x + Tile_skip_count_bounce;
							}
					}
				}
				if (punch_to_vertical = true){
					target_y_bounce = 0;
					if bmb_bounce_interval >= 1{
						target_y_bounce = y + Tile_skip_count_vert_bounce;
					}
					else if bmb_bounce_interval <= 0{
						punch_to_vertical = false;
						bmb_bounce_interval = irandom_range(1, 3);
						target_y_bounce = y + Tile_skip_count_vert_bounce;
						//choose which direction we want to go, up, left or right
							target_random_change = choose(target_x_bounce, target_x_bounce_opposite, target_y_bounce_opposite)
							if target_random_change = target_x_bounce_opposite{
								target_random_change = 0;
								punch_to_side_opposite = true;
								target_x_bounce_opposite = x - Tile_skip_count_bounce;
							}
							else if target_random_change = target_y_bounce_opposite{
								target_random_change = 0;
								punch_to_vertical_opposite = true;
								target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce{
								target_random_change = 0;
								punch_to_side = true;
								target_x_bounce = x + Tile_skip_count_bounce;
							}
					}
				}
				if (punch_to_vertical_opposite = true){
					target_y_bounce_opposite = 0;
					if bmb_bounce_interval >= 1{
						target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
					}
					else if bmb_bounce_interval <= 0{
						punch_to_vertical_opposite = false;
						bmb_bounce_interval = irandom_range(1, 3);
						//choose which direction we want to go, down, left or right
							target_random_change = choose(target_x_bounce, target_x_bounce_opposite, target_y_bounce)
							if target_random_change = target_x_bounce_opposite{
								target_random_change = 0;
								punch_to_side_opposite = true;
								target_x_bounce_opposite = x - Tile_skip_count_bounce;
							}
							else if target_random_change = target_y_bounce{
								target_random_change = 0;
								punch_to_vertical = true;
								target_y_bounce = y + Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce{
								target_random_change = 0;
								punch_to_side = true;
								target_x_bounce = x + Tile_skip_count_bounce;
							}
					}
				}
			}
			else if (place_meeting(x, y, Obj_Destructible_Wall)) && bmb_bounce_amount <= 0 || (place_meeting(x,y, Obj_PU_Parent)) && bmb_bounce_amount <= 0 || place_meeting_notself(x, y, _otherbombcollide_1) && bmb_bounce_amount <= 0 || place_meeting(x, y, Obj_Par_Wall) && bmb_bounce_amount <= 0
			{
				zspd = 0;
				Z_Axis = floorZ;
				frame_count = 0;
				audio_play_sound(Snd_Bomb_Drop_3, 8, false);
				bomb_did_bounce = true;
				zspd = -3;
				bmb_bounce_interval -= 1;
				if (punch_to_side = true){
					x = x;
					target_x_bounce = 0;
					if bmb_bounce_interval >= 1{
						target_x_bounce = x + Tile_skip_count_bounce;
					}
					else if bmb_bounce_interval <= 0{ //change our direction if bounce interval becomes 0
						punch_to_side = false;
						target_x_bounce = x + Tile_skip_count_bounce;
						bmb_bounce_interval = irandom_range(1, 3);
						//choose which direction we want to go, up, down or left
							target_random_change = choose(target_x_bounce_opposite, target_y_bounce, target_y_bounce_opposite)
							if target_random_change = target_y_bounce{
								target_random_change = 0;
								punch_to_vertical = true;
								target_y_bounce = y + Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_y_bounce_opposite{
								target_random_change = 0;
								punch_to_vertical_opposite = true;
								target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce_opposite{
								target_random_change = 0;
								punch_to_side_opposite = true;
								target_x_bounce_opposite = x - Tile_skip_count_bounce;
							}
					}
				}
				if (punch_to_side_opposite = true){
					x = x;
					target_x_bounce_opposite = 0;
					if bmb_bounce_interval >= 1{
						target_x_bounce_opposite = x - Tile_skip_count_bounce;
					}
					else if bmb_bounce_interval <= 0{
						punch_to_side_opposite = false;
						target_x_bounce_opposite = x - Tile_skip_count_bounce;
						bmb_bounce_interval = irandom_range(1, 3);
						//choose which direction we want to go, up, down or right
							target_random_change = choose(target_x_bounce, target_y_bounce, target_y_bounce_opposite)
							if target_random_change = target_y_bounce{
								target_random_change = 0;
								punch_to_vertical = true;
								target_y_bounce = y + Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_y_bounce_opposite{
								target_random_change = 0;
								punch_to_vertical_opposite = true;
								target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce{
								target_random_change = 0;
								punch_to_side = true;
								target_x_bounce = x + Tile_skip_count_bounce;
							}
					}
				}
				if (punch_to_vertical = true){
					target_y_bounce = 0;
					if bmb_bounce_interval >= 1{
						target_y_bounce = y + Tile_skip_count_vert_bounce;
					}
					else if bmb_bounce_interval <= 0{
						punch_to_vertical = false;
						bmb_bounce_interval = irandom_range(1, 3);
						target_y_bounce = y + Tile_skip_count_vert_bounce;
						//choose which direction we want to go, up, left or right
							target_random_change = choose(target_x_bounce, target_x_bounce_opposite, target_y_bounce_opposite)
							if target_random_change = target_x_bounce_opposite{
								target_random_change = 0;
								punch_to_side_opposite = true;
								target_x_bounce_opposite = x - Tile_skip_count_bounce;
							}
							else if target_random_change = target_y_bounce_opposite{
								target_random_change = 0;
								punch_to_vertical_opposite = true;
								target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce{
								target_random_change = 0;
								punch_to_side = true;
								target_x_bounce = x + Tile_skip_count_bounce;
							}
					}
				}
				if (punch_to_vertical_opposite = true){
					target_y_bounce_opposite = 0;
					if bmb_bounce_interval >= 1{
						target_y_bounce_opposite = y - Tile_skip_count_vert_bounce;
					}
					else if bmb_bounce_interval <= 0{
						punch_to_vertical_opposite = false;
						bmb_bounce_interval = irandom_range(1, 3);
						//choose which direction we want to go, down, left or right
							target_random_change = choose(target_x_bounce, target_x_bounce_opposite, target_y_bounce)
							if target_random_change = target_x_bounce_opposite{
								target_random_change = 0;
								punch_to_side_opposite = true;
								target_x_bounce_opposite = x - Tile_skip_count_bounce;
							}
							else if target_random_change = target_y_bounce{
								target_random_change = 0;
								punch_to_vertical = true;
								target_y_bounce = y + Tile_skip_count_vert_bounce;
							}
							else if target_random_change = target_x_bounce{
								target_random_change = 0;
								punch_to_side = true;
								target_x_bounce = x + Tile_skip_count_bounce;
							}
					}
				}
			}
			else if (!place_meeting(x, y, Obj_Destructible_Wall)) && bmb_bounce_amount <= 0 || (!place_meeting(x,y, Obj_PU_Parent)) && bmb_bounce_amount <= 0 || !place_meeting_notself(x, y, _otherbombcollide_1) && bmb_bounce_amount <= 0 || !place_meeting(x, y, Obj_Par_Wall) && bmb_bounce_amount <= 0{
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
				bmb_bounce_interval = irandom_range(1, 3);
				audio_play_sound(Snd_Bomb_Drop_3, 8, false);
				state = jelly_bomb_state.jelly_bomb_idle;
				Z_Axis = floorZ;
			}
		}
		
		Z_Axis += zspd;
	break;
}
