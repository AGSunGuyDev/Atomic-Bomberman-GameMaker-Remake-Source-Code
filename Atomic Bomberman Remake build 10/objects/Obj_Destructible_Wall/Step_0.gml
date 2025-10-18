//gravity
if (zspd < 10){
	zspd += GravSpeed;
}

switch(state){
	case destructible_wall_state.destructible_wall_idle:
		sprite_index = Spr_Classic_Green_Acres_Brick;
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
		
		//if destroyed, make the wall switch to "destroyed" state
		if (brick_wall_destroyed = true){
			image_index = 0;
			state = destructible_wall_state.destructible_wall_destroyed;
		}
	break;
	
	case destructible_wall_state.destructible_wall_destroyed:
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
		sprite_index = Spr_Green_Acres_Brick_Xplode;
	break;
}
