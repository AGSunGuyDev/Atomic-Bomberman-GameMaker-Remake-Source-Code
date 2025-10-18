//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.fire_ups_collected <= 8){
		Obj_Grn_Bman_player.Bomb_Fire_Range += 1;
		Obj_Grn_Bman_player.fire_ups_collected += 1;
	}
	else if (Obj_Grn_Bman_player.fire_ups_collected >= 9){
		//do not add more flames
	}
}

instance_destroy();
