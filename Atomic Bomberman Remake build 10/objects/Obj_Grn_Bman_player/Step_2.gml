//sets limit of powerups a bomberman can accumulate
skates_collected = clamp(skates_collected, 0, 7);
fire_ups_collected = clamp(fire_ups_collected, 0, 9);
bomb_ups_collected = clamp(bomb_ups_collected, 0, 12);
kick_boot_collected = clamp(kick_boot_collected, 0, 1);
Trigger_bombs_collected = clamp(Trigger_bombs_collected, 0, 1);
punch_glove_collected = clamp(punch_glove_collected, 0, 1);
Full_Fire_collected = clamp(Full_Fire_collected, 0, 1);
Jelly_bombs_Collected = clamp(Jelly_bombs_Collected, 0, 1);
Pierce_Bombs_Collected = clamp(Pierce_Bombs_Collected, 0, 1);
Line_Bombs_Collected = clamp(Line_Bombs_Collected, 0, 1);

//prevents trigger queue value to add more
//Trigger_queue_value = clamp(Trigger_queue_value, 0, 2);

if Trigger_queue_add >= bomb_ups_collected{
	Trigger_queue_add = bomb_ups_collected;
}

if Trigger_queue_value >= 2{
	Trigger_queue_value = 2;
}

if activate_line_bomb_ability >= 2{
	activate_line_bomb_ability = 2
}

if activate_line_bomb_ability <= -1{
	activate_line_bomb_ability = 0;
}

//prevent trigger queue add to go below 0
if Trigger_queue_add <= -1{
	Trigger_queue_add = 0;
}
