// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Old_Preset_Blast_Range(){
	//create center flame
			var _center_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Centre);
				_center_flame.x = x;
				_center_flame.y = y;
			//create mid top flame
			var _mid_top_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Mid_Top);
				_mid_top_flame.x = x;
				_mid_top_flame.y = y - 36;
			//create far top flame
			var _far_top_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Far_Top);
				_far_top_flame.x = x;
				_far_top_flame.y = y - 72;
			//create mid bottom flame
				var _mid_bottom_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Mid_Bottom);
				_mid_bottom_flame.x = x;
				_mid_bottom_flame.y = y + 36;
			//create far bottom flame
			var _far_bottom_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Far_Bottom);
				_far_bottom_flame.x = x;
				_far_bottom_flame.y = y + 72;
			//create mid left flame
			var _mid_left_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Mid_Left);
				_mid_left_flame.x = x - 40;
				_mid_left_flame.y = y;
			//create far left flame
			var _far_left_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Far_Left);
				_far_left_flame.x = x - 80;
				_far_left_flame.y = y;
			//create mid right flame
			var _mid_right_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Mid_Right);
				_mid_right_flame.x = x + 40;
				_mid_right_flame.y = y;
			//create far right flame
			var _far_right_flame = instance_create_layer(x, y, "Fire_Layer", ObJ_Bomb_Explosion_Far_Right);
				_far_right_flame.x = x + 80;
				_far_right_flame.y = y;
}