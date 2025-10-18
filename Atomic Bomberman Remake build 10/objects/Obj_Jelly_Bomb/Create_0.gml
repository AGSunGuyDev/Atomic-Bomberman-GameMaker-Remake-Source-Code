Fire_Range = 0;
Bomb_explosion_timer = 0;
chain_reaction_initiate = false;
creator_instance = 0;
xspd = 0;
yspd = 0;

//z axis stuff
jumpspd = 8; //<--older value: 14
Z_Axis = 0;
floorZ = 0;
zspd = 0;
GravSpeed = 0.4; //<--older value: 0.5

height = 36;

//movement while flying
xspd_flying = 4;

//defines movement when the bomb is kicked
kick_to_side = false;
kick_to_vertical = false;

//defines movement when the bomb is punched
punch_to_side = false;
punch_to_side_opposite = false;
punch_to_vertical = false;
punch_to_vertical_opposite = false;

//defines on how many tiles it should skip when punched or thrown
Tile_skip_count = 3.324 * sprite_width //<--older value: 3.45 * sprite_width, new value: 3.325
Tile_skip_count_vertical = 3.331 * sprite_height //<-- 3 tile value: 3.331
Tile_skip_count_bounce = 1.360 * sprite_width //<-- 1 tile value
Tile_skip_count_vert_bounce = 1.356 * sprite_height;
//miscallenous variables
Move_time = 24;
Move_time_Z = 14;
Move_Speed_X = Tile_skip_count/Move_time;
Move_Speed_Z = Tile_skip_count/Move_time_Z;
zspd_fly = zspd * Move_Speed_Z;
jumpspd_fly = 8 * Move_Speed_Z/2 * GravSpeed/2;
frame_count = 0;
bomb_did_bounce = false;

//did the bomb land on a tile?
Bomb_tile_land = false;

move_spd = 2;

explosion_trigger_timer = 0;

dir = 0;

timer = 0;

//3 tile distance horizontal travel
target_x = x + Tile_skip_count;
target_x_opposite = x - Tile_skip_count;

//1 tile distance horizontal travel
target_x_bounce = x + Tile_skip_count_bounce; //<-- older value: x + Tile_skip_count_bounce;
target_x_bounce_opposite = x - Tile_skip_count_bounce; //<-- older value: x - Tile_skip_count_bounce;
target_x_id = 0;

//3 tile distance vertical travel
target_y = y + Tile_skip_count_vertical;
target_y_opposite = y - Tile_skip_count_vertical;

//1 tile distance vertical travel
target_y_bounce = y + Tile_skip_count_vert_bounce; //<- older value: y + Tile_skip_count_vert_bounce;
target_y_bounce_opposite = y - Tile_skip_count_vert_bounce; //<- old value: y - Tile_skip_count_vert_bounce;
target_y_id = 0;

//z axis targetting
target_z = Z_Axis + Tile_skip_count;
target_z_bounce = 0;
target_z_id = 0;

//when the bounce lane change interval zero, we use this variable to tell which
//direction we will randomly target
target_random_change = 0;

//distance difference variables
x_difference = target_x_bounce - x;
y_difference = target_y_bounce - y;
z_difference = target_z_bounce + Z_Axis;

arc_time = 50;
grv = 0.36;

hsp_fly = x_difference/arc_time;
ysp_fly = y_difference/arc_time;

vsp_fly = z_difference/arc_time + arc_time * GravSpeed/2;

//shared for children state related stuff
bomb_kick_trigger = false;
bomb_punch_trigger = false;
bomb_is_punched = false;

//at which intervals would the jelly bomb change its lane when punched or thrown?
bmb_bounce_interval = irandom_range(1, 3);
//how many times the jelly bomb will bounce before coming to rest when punched or thrown?
bmb_bounce_amount = irandom_range(4, 8);

///@func approach_smooth(start, end, shift,[snap_distance]);
function approach_lerp(_start, _end, _shift, _snap){
  //We are close enough
  if(abs(_start-_end) < _snap) 
    return _end;    

  return lerp(_start,_end,_shift);
}

enum jelly_bomb_state{
	jelly_bomb_idle,
	jelly_bomb_kicked,
	jelly_bomb_grabbed,
	jelly_bomb_thrown,
	jelly_bomb_punched,
	jelly_bomb_bouncing,
}

state = jelly_bomb_state.jelly_bomb_idle;
