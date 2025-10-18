//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.bomb_ups_collected <= 11){
		Obj_Grn_Bman_player.Bombs_left += 1;
		Obj_Grn_Bman_player.bomb_ups_collected += 1;
	}
	else if (Obj_Grn_Bman_player.bomb_ups_collected >= 12){
		//do not add more bombs to the stock
	}
}

instance_destroy();
