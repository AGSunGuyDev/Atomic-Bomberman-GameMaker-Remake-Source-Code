// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_idle_trigger_script_when_kicking(){
		//if the player goes the opposite way, change back to idle state
			if (face == LEFT) {
				if (key_right){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_up){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_down){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
			}
			else if (face == RIGHT) {
				if (key_left){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_up){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_down){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
			}
			else if (face == UP) {
				if (key_down){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_left){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_right){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
			}
			else if (face == DOWN) {
				if (key_up){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_left){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
				else if (key_right){
					image_index = 0;
					image_speed = move_spd / 1.8;
					state = Bomberman_Player.Bomberman_idle;
				}
			}
}