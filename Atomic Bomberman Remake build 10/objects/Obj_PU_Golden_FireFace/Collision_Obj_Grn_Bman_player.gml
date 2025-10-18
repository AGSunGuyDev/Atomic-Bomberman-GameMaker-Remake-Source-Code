//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.Full_Fire_collected <= 0){
		Obj_Grn_Bman_player.Has_Max_Fire_Range = true;
		Obj_Grn_Bman_player.Bomb_Fire_Range += 999;
		Obj_Grn_Bman_player.Full_Fire_collected += 1;
	}
	else if (Obj_Grn_Bman_player.Full_Fire_collected >= 1){
		//do not add more gold flames
	}
}

instance_destroy();
