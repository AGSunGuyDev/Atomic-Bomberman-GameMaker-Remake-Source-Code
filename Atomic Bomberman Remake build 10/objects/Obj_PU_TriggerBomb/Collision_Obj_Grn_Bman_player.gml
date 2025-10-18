//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.Trigger_bombs_collected <= 0){
		Obj_Grn_Bman_player.basic_bomb_type = false;
		Obj_Grn_Bman_player.jelly_bomb_type = false;
		Obj_Grn_Bman_player.pierce_bomb_type = false;
		Obj_Grn_Bman_player.trigger_bomb_type = true;
		Obj_Grn_Bman_player.Trigger_bombs_collected += 1;
	}
	else if (Obj_Grn_Bman_player.Trigger_bombs_collected >= 1){
		//do not add more triggers
	}
}

instance_destroy();
