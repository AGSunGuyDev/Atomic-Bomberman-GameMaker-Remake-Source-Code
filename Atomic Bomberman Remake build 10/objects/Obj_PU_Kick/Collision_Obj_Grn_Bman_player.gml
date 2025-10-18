//plays a sound effect when powerup is collected
scr_powerup_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.kick_boot_collected <= 0){
		Obj_Grn_Bman_player.Can_Kick = true;
		Obj_Grn_Bman_player.kick_boot_collected += 1;
	}
	else if (Obj_Grn_Bman_player.kick_boot_collected >= 1){
		//do not add more kick boots
	}
}

instance_destroy();
