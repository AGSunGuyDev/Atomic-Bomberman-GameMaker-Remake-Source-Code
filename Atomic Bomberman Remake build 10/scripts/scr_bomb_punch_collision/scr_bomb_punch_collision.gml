// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bomb_punch_collision(){
	//if the player's punching ability is enabled and if
		//the player presses action 2 button, activate punch bomb ability
		var _bombtoleft = collision_rectangle(x - 52, y + 2, x - 16, y + 32, Obj_Basic_Bomb, false, false)
		var _bombtoright = collision_rectangle(x + 16, y + 2, x + 52, y + 32, Obj_Basic_Bomb, false, false)
		var _bombtotop = collision_rectangle(x - 17, y - 25, x + 17, y + 7, Obj_Basic_Bomb, false, false)
		var _bombtodown = collision_rectangle(x - 17, y + 25, x + 17, y + 56, Obj_Basic_Bomb, false, false)
		
			if (Can_Punch = true){
				if (key_action_2){
					if (!inside_bomb && _bombtoleft) || (!inside_bomb && _bombtoright) || (!inside_bomb && _bombtotop) || (!inside_bomb && _bombtodown){
						Player_Punching = true;
						image_speed = 1;
						image_index = 0;
						if (face == LEFT){						 
								if instance_exists(_bombtoleft){
			                        if _bombtoleft.bomb_is_punched = false{
			                            //makes the bomb land on the last tile
										scr_bomb_punch_sfx();
										_bombtoleft.bomb_punch_trigger = true;
										_bombtoleft.punch_to_side_opposite = true;
										state = Bomberman_Player.Bomberman_Punch_Bomb;
			                        }
									else if _bombtoleft.bomb_is_punched = true{
										//do nothing
									}
								}
						}
						else if (face == RIGHT){
								if instance_exists(_bombtoright){
			                        if _bombtoright.bomb_is_punched = false{
			                            //makes the bomb land on the last tile
										scr_bomb_punch_sfx();
										_bombtoright.bomb_punch_trigger = true;
										_bombtoright.punch_to_side = true;
										state = Bomberman_Player.Bomberman_Punch_Bomb;
			                        }
									else if _bombtoright.bomb_is_punched = true{
										//do nothing
									}
								}
		                }
						else if (face == UP){
								if instance_exists(_bombtotop){
			                        if _bombtotop.bomb_is_punched = false{
			                            //makes the bomb land on the last tile
										scr_bomb_punch_sfx();
										_bombtotop.bomb_punch_trigger = true;
										_bombtotop.punch_to_vertical_opposite = true;
										state = Bomberman_Player.Bomberman_Punch_Bomb;
			                        }
									else if _bombtotop.bomb_is_punched = true{
										//do nothing
									}
								}
						}
						else if (face == DOWN){
								if instance_exists(_bombtodown){
			                        if _bombtodown.bomb_is_punched = false{
			                            //makes the bomb land on the last tile
										scr_bomb_punch_sfx();
										_bombtodown.bomb_punch_trigger = true;
										_bombtodown.punch_to_vertical = true;
										state = Bomberman_Player.Bomberman_Punch_Bomb;
			                        }
									else if _bombtodown.bomb_is_punched = true{
										//do nothing
									}
								}
						}
				}
				state = Bomberman_Player.Bomberman_Punch_Bomb;
			}
		}
}