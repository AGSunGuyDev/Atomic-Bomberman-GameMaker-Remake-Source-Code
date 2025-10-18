//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.skates_collected <= 6){
		Obj_Grn_Bman_player.move_spd += 0.4;
		Obj_Grn_Bman_player.skates_collected += 1;
	}
	else if (Obj_Grn_Bman_player.skates_collected >= 7){
		//do not add more speed
	}
}

instance_destroy();
