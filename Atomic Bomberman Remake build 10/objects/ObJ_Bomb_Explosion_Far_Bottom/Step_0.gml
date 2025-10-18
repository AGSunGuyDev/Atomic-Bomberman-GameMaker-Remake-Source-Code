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
			connect_down = true;
		}
		
	var _far_right_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Right); 
		if (_far_right_fire != noone)
		{
			instance_destroy(_far_right_fire);
			connect_down = true;
		}

	var _midleft_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Left); 
		if (_midleft_fire != noone)
		{
			instance_destroy(_midleft_fire);
			connect_down = true;
		}
		
	var _far_left_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Left); 
		if (_far_left_fire != noone)
		{
			instance_destroy(_far_left_fire);
			connect_down = true;
		}
	
	//destroy itself if it meets with other bottom fires
	var _midbottom_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Bottom); 
		if (_midbottom_fire != noone)
		{
			instance_destroy();
		}
		
	var _farbottom_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Bottom); 
		if (_farbottom_fire != noone)
		{
			instance_destroy();
		}

switch(state){
	case explosion_state.explosion_fade_in:
		if (connect_up = false) && (connect_down = false) && (connect_left = false) && (connect_right = false){
			sprite_index = Spr_Far_Bottom_Flame_fade_in;
		}
		else if (connect_down = true){
			sprite_index = Spr_Center_Flame_fade_in;
		}
		//draw respective sprite
	break;
	
	case explosion_state.explosion_idle:
		if (connect_up = false) && (connect_down = false) && (connect_left = false) && (connect_right = false){
			sprite_index = Spr_Far_Bottom_Flame;
		}
		else if (connect_down = true){
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
			sprite_index = Spr_Far_Bottom_Flame_fade_out;
		}
		else if (connect_down = true){
			sprite_index = Spr_Center_Flame_fade_out;
		}
		//draw respective sprite, destroy the object at the animation end (see the event)
	break;
}

