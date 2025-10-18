brick_wall_destroyed = false;
//z axis stuff
jumpspd = 0;
Z_Axis = 0;
floorZ = 0;
zspd = 0;
GravSpeed = 0.5;

height = 36;

enum destructible_wall_state{
	destructible_wall_idle,
	destructible_wall_destroyed,
}

state = destructible_wall_state.destructible_wall_idle
