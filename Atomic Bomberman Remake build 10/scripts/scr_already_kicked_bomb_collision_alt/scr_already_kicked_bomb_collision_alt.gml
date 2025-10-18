// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_already_kicked_bomb_collision_alt(){
	var _kickedbomb = instance_place(x,y, Obj_Basic_Bomb)
		if (instance_exists(_kickedbomb)){
			if (!inside_bomb && face == RIGHT && _kickedbomb.kick_to_side = true){
				xspd_alt = 0;
				yspd_alt = 0;
			}
			else if (!inside_bomb && face == LEFT && _kickedbomb.kick_to_side = true){
				xspd_alt = 0;
				yspd_alt = 0;
			}
			else if (!inside_bomb && face == UP && _kickedbomb.kick_to_vertical = true){
				xspd_alt = 0;
				yspd_alt = 0;
			}
			else if (!inside_bomb && face == DOWN && _kickedbomb.kick_to_vertical = true){
				xspd_alt = 0;
				yspd_alt = 0;
			}
		}
}