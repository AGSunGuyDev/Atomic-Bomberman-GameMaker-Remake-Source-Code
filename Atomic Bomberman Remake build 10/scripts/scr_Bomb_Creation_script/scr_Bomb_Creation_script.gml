// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Bomb_Creation_script(){
	//drops a bomb
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
}