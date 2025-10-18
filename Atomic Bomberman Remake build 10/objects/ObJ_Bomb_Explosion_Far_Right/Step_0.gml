var _tile_step = instance_position(x, y, Obj_Tile);

var _wall_collision = instance_place(x, y, Obj_Destructible_Wall)
	if _wall_collision{
		x = _tile_step.x;
		y = _tile_step.y;
		_wall_collision.brick_wall_destroyed = true;
		instance_destroy();
	}
	
	//destroy any left side fire instances
	var _midleft_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Left); 
		if (_midleft_fire != noone)
		{
			instance_destroy(_midleft_fire);
		}
		
	var _far_left_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Left); 
		if (_far_left_fire != noone)
		{
			instance_destroy(_far_left_fire);
		}
		
	//destroy any right side fire instances
	var _midright_fire = instance_place(x, y, ObJ_Bomb_Explosion_Mid_Right); 
		if (_midright_fire != noone)
		{
			instance_destroy();
		}
		
	var _far_right_fire = instance_place(x, y, ObJ_Bomb_Explosion_Far_Right); 
		if (_far_right_fire != noone)
		{
			instance_destroy();
		}

switch(state){
	case explosion_state.explosion_fade_in:
		sprite_index = Spr_Far_Right_Flame_fade_in;
		//draw respective sprite
	break;
	
	case explosion_state.explosion_idle:
		sprite_index = Spr_Far_Right_Flame;
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
		sprite_index = Spr_Far_Right_Flame_fade_out;
		//draw respective sprite, destroy the object at the animation end (see the event)
	break;
}
