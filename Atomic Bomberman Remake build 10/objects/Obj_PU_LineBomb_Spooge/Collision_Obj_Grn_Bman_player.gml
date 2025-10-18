//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.Line_Bombs_Collected <= 0){
		Obj_Grn_Bman_player.Can_Line_Bomb = true;
		Obj_Grn_Bman_player.Line_Bombs_Collected += 1;
	}
	else if (Obj_Grn_Bman_player.Line_Bombs_Collected >= 1){
		//do not add more triggers
	}
}

instance_destroy();
