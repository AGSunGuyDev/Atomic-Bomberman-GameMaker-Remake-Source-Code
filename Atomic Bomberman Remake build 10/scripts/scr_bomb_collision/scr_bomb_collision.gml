// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bomb_collision(){
			// Check for bomb position
		if (!place_meeting(x, y, Obj_Basic_Bomb)){
		    inside_bomb = false;
		}
		if (Can_Kick = false){
				if (!inside_bomb && place_meeting(x + xspd, y, Obj_Basic_Bomb)){
				    xspd = 0;
				}
				if (!inside_bomb && place_meeting(x, y + yspd, Obj_Basic_Bomb)){
				    yspd = 0;
				}
		}
		else if (Can_Kick = true){
			var _kickedbomb = instance_place(x + xspd, y + yspd, Obj_Basic_Bomb)
				if (!inside_bomb && _kickedbomb){
					if (face == RIGHT){
						if (_kickedbomb.bomb_is_punched = false){
							Player_Kicking = true;
							image_index = 0;
							image_speed = 1;
							xspd = 0;
							yspd = 0;
							var _kick_sfx = choose(Snd_Bomb_Kick_1, Snd_Bomb_Kick_2, Snd_Bomb_Punched_1, Snd_Bomb_Punched_2);
							audio_play_sound(_kick_sfx, 8, false);
							state = Bomberman_Player.Bomberman_Kick;
						}
						if (_kickedbomb.kick_to_side = false){
							if (_kickedbomb.kick_to_vertical = true){
								_kickedbomb.kick_to_vertical = false;
								_kickedbomb.yspd = 0;
							}
							//if the bomb is NOT in punched state, trigger kick state
							if (_kickedbomb.bomb_is_punched = false){
								_kickedbomb.kick_to_side = true;
								_kickedbomb.xspd = 3.5;
								_kickedbomb.bomb_kick_trigger = true;
							}
						}
					}
					else if (face == LEFT){
						if (_kickedbomb.bomb_is_punched = false){
							Player_Kicking = true;
							image_index = 0;
							image_speed = 1;
							xspd = 0;
							yspd = 0;
							var _kick_sfx = choose(Snd_Bomb_Kick_1, Snd_Bomb_Kick_2, Snd_Bomb_Punched_1, Snd_Bomb_Punched_2);
							audio_play_sound(_kick_sfx, 8, false);
							state = Bomberman_Player.Bomberman_Kick;
						}
						if (_kickedbomb.kick_to_side = false){
							if (_kickedbomb.kick_to_vertical = true){
								_kickedbomb.kick_to_vertical = false;
								_kickedbomb.yspd = 0;
							}
							//if the bomb is NOT in punched state, trigger kick state
							if (_kickedbomb.bomb_is_punched = false){
								_kickedbomb.kick_to_side = true;
								_kickedbomb.xspd = -3.5;
								_kickedbomb.bomb_kick_trigger = true;
							}
						}
					}
					else if (face == UP){
						if (_kickedbomb.bomb_is_punched = false){
							Player_Kicking = true;
							image_index = 0;
							image_speed = 1;
							xspd = 0;
							yspd = 0;
							var _kick_sfx = choose(Snd_Bomb_Kick_1, Snd_Bomb_Kick_2, Snd_Bomb_Punched_1, Snd_Bomb_Punched_2);
							audio_play_sound(_kick_sfx, 8, false);
							state = Bomberman_Player.Bomberman_Kick;
						}
						if (_kickedbomb.kick_to_vertical = false){
							if (_kickedbomb.kick_to_side = true){
								_kickedbomb.kick_to_side = false;
								_kickedbomb.xspd = 0;
							}
							//if the bomb is NOT in punched state, trigger kick state
							if (_kickedbomb.bomb_is_punched = false){
								_kickedbomb.kick_to_vertical = true;
								_kickedbomb.yspd = -3.5;
								_kickedbomb.bomb_kick_trigger = true;
							}
						}
					}
					else if (face == DOWN){
						if (_kickedbomb.bomb_is_punched = false){
							Player_Kicking = true;
							image_index = 0;
							image_speed = 1;
							xspd = 0;
							yspd = 0;
							var _kick_sfx = choose(Snd_Bomb_Kick_1, Snd_Bomb_Kick_2, Snd_Bomb_Punched_1, Snd_Bomb_Punched_2);
							audio_play_sound(_kick_sfx, 8, false);
							state = Bomberman_Player.Bomberman_Kick;
						}
						if (_kickedbomb.kick_to_vertical = false){
							if (_kickedbomb.kick_to_side = true){
								_kickedbomb.kick_to_side = false;
								_kickedbomb.xspd = 0;
							}
							//if the bomb is NOT in punched state, trigger kick state
							if (_kickedbomb.bomb_is_punched = false){
								_kickedbomb.yspd = 3.5;
								_kickedbomb.kick_to_vertical = true;
								_kickedbomb.bomb_kick_trigger = true;
							}
						}
					}
				}
				scr_already_kicked_bomb_collision();
		}
}