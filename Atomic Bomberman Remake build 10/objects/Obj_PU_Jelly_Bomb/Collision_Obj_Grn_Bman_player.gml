//plays a sound effect when powerup is collected
scr_PU_Jelly_collect_sfx();

with (Obj_Grn_Bman_player){
	if (Obj_Grn_Bman_player.Jelly_bombs_Collected <= 0){
		Obj_Grn_Bman_player.basic_bomb_type = false;
		Obj_Grn_Bman_player.jelly_bomb_type = true;
		Obj_Grn_Bman_player.Jelly_bombs_Collected += 1;
		Obj_Grn_Bman_player.trigger_bomb_type = false;
		Obj_Grn_Bman_player.pierce_bomb_type = false;
	}
	else if (Obj_Grn_Bman_player.Jelly_bombs_Collected >= 1){
		//do not add more jellies
	}
}

instance_destroy();
