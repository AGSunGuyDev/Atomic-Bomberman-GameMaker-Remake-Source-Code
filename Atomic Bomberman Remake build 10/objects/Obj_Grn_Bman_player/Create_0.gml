//movement related variables
xspd = 0;
yspd = 0;
move_spd = 2.3;
move_spd_horiz = 2.3;

//z axis stuff
jumpspd = 0;
Z_Axis = 0;
floorZ = 0;
zspd = 0;
GravSpeed = 0;

height = 68;

//other conditions
inside_bomb = false;

//how many bombs we have
Bombs_left = 1;

//how long is the blast range?
Bomb_Fire_Range = 2;

//abilities
Can_Kick = false;
Can_Punch = false;
Can_Grab = false;
Cant_Kick_Again = false;
Cant_Move_Again = false;
Can_Line_Bomb = false;
Can_Pass_Walls = false;
Can_Pass_Bombs = false;

//other status effects
Has_Max_Fire_Range = false;
Has_Max_Bomb_Count = false;
Has_Max_Skate_Count = false;

//how many items collected
skates_collected = 0;
bomb_ups_collected = 0;
fire_ups_collected = 0;
kick_boot_collected = 0;
punch_glove_collected = 0;
grab_glove_collected = 0;
Trigger_bombs_collected = 0;
Line_Bombs_Collected = 0;
Full_Fire_collected = 0;
Jelly_bombs_Collected = 0;
Pierce_Bombs_Collected = 0;

//animation stuff
sprite[RIGHT] = Spr_Grn_Bman_stand_right;
sprite[UP] = Spr_Grn_Bman_stand_up;
sprite[LEFT] = Spr_Grn_Bman_stand_left;
sprite[DOWN] = Spr_Grn_Bman_stand_down;

Walk_Sprite[RIGHT] = Spr_Grn_Bman_wlk_right;
Walk_Sprite[UP] = Spr_Grn_Bman_wlk_up;
Walk_Sprite[LEFT] = Spr_Grn_Bman_wlk_left;
Walk_Sprite[DOWN] = Spr_Grn_Bman_wlk_down;

Kick_Sprite[RIGHT] = Spr_Grn_Bman_kick_right;
Kick_Sprite[UP] = Spr_Grn_Bman_kick_up;
Kick_Sprite[LEFT] = Spr_Grn_Bman_kick_left;
Kick_Sprite[DOWN] = Spr_Grn_Bman_kick_down;

Punch_sprite[RIGHT] = Spr_Grn_Bman_punch_right;
Punch_sprite[UP] = Spr_Grn_Bman_punch_up;
Punch_sprite[LEFT] = Spr_Grn_Bman_punch_left;
Punch_sprite[DOWN] = Spr_Grn_Bman_punch_down;

DeathSpriteHolder = 0;
BoredIdleAnim = 0;
BoredAnimTrigger = false;
BoredAnimTimer = 0;
BoredAnimTimerTrigger = true;

face = DOWN;

//what type of bomb do we have?
basic_bomb_type = true;
trigger_bomb_type = false;
jelly_bomb_type = false;
pierce_bomb_type = false;

//what keys we use
	key_left = keyboard_check(vk_left)|| keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right)|| keyboard_check(ord("D"));
	key_down = keyboard_check(vk_down)|| keyboard_check(ord("S"));
	key_up = keyboard_check(vk_up)|| keyboard_check(ord("W"));
	keys_left_right = (key_right - key_left);
	keys_up_down = (key_down - key_up);
	
//what keys we use when we punch or kick bombs
//makes kicked bombs stop moving
key_action = keyboard_check_pressed(ord("H"));
//activates "punch" ability
key_action_2 = keyboard_check_pressed(ord("J"));
//detonates trigger bombs
key_action_3 = keyboard_check_pressed(ord("K"));

//key combo variables
key_activate = keyboard_check_pressed(vk_space);	
xspd_alt = keys_left_right * move_spd;
yspd_alt = keys_up_down * move_spd;

//what action state are we in?
Player_Kicking = false;
Player_Punching = false;

//bomb instance stuff
Trigger_bomb_instance = 0;
Triggers_to_detonate = 1;
Trigger_queue_value = 0;
Trigger_max_value = bomb_ups_collected;
Trigger_queue_add = 0;
activate_line_bomb_ability = 0;
dont_activate_line_bomb_again = false;


enum Bomberman_Player{
	Bomberman_idle,
	Bomberman_walk,
	Bomberman_Death,
	Bomberman_Kick,
	Bomberman_Grab,
	Bomberman_Grab_Idle,
	Bomberman_Grab_Walk,
	Bomberman_Throw_Bomb,
	Bomberman_Punch_Bomb,
}

state = Bomberman_Player.Bomberman_idle;
