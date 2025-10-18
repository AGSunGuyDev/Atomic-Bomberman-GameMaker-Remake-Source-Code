var _tile_step = instance_position(x, y, Obj_Tile);

var _wall_collision = instance_place(x, y, Obj_Destructible_Wall)
	if _wall_collision{
		x = _tile_step.x;
		y = _tile_step.y;
		_wall_collision.brick_wall_destroyed = true;
		instance_destroy();
	}
	
	//makes the flame connect with others
	var _midright_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Right); 
		if (_midright_fire != noone)
		{
			instance_destroy(_midright_fire);
			connect_up = true;
		}
		
	var _far_right_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Right); 
		if (_far_right_fire != noone)
		{
			instance_destroy(_far_right_fire);
			connect_up = true;
		}

	var _midleft_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Left); 
		if (_midleft_fire != noone)
		{
			instance_destroy(_midleft_fire);
			connect_up = true;
		}
		
	var _far_left_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Left); 
		if (_far_left_fire != noone)
		{
			instance_destroy(_far_left_fire);
			connect_up = true;
		}
	
	//destroy any top fire instances
		//destroy any top fire instances
	var _midtop_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Top); 
		if (_midtop_fire != noone)
		{
			instance_destroy();
		}
		
	var _fartop_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Top); 
		if (_fartop_fire != noone)
		{
			instance_destroy();
		}

switch(state){
	case explosion_state.explosion_fade_in:
		if (connect_up = false) && (connect_down = false) && (connect_left = false) && (connect_right = false){
			sprite_index = Spr_Far_Top_Flame_fade_in;
		}
		else if (connect_up = true){
			sprite_index = Spr_Center_Flame_fade_in;
		}
		//draw respective sprite
	break;
	
	case explosion_state.explosion_idle:
		if (connect_up = false) && (connect_down = false) && (connect_left = false) && (connect_right = false){
			sprite_index = Spr_Far_Top_Flame;
		}
		else if (connect_up = true){
			sprite_index = Spr_Center_Flame;
		}
			if (explosion_timer >= 15){
				explosion_timer = 0;
				fatal_flame = false;
				image_index = 0;
				state = explosion_state.explosion_fade_out
			}
			explosion_timer++;
	break;
	
	case explosion_state.explosion_fade_out:
		fatal_flame = false;
			if (connect_up = false) && (connect_down = false) && (connect_left = false) && (connect_right = false){
				sprite_index = Spr_Far_Top_Flame_fade_out;
			}
			else if (connect_up = true){
				sprite_index = Spr_Center_Flame_fade_out;
			}
		//draw respective sprite, destroy the object at the animation end (see the event)
	break;
}
