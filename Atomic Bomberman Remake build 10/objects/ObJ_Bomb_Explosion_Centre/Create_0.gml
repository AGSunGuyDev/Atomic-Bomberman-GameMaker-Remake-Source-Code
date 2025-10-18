explosion_timer = 0;
fatal_flame = false;
end_flame_sprite = false;

connect_up = false;
connect_down = false;
connect_left = false;
connect_right = false;

//z axis stuff
jumpspd = 5;
Z_Axis = 0;
floorZ = 0;
zspd = 0;
GravSpeed = 0.5;

height = 36;

enum explosion_state{
	explosion_fade_in,
	explosion_idle,
	explosion_fade_out,
}

state = explosion_state.explosion_fade_in;
