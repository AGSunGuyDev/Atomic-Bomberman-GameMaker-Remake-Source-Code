// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_PU_Jelly_collect_sfx(){
	if (irandom(10) > 4){
		var collected_pu_sfx = choose(Snd_PowerUp_Collect_1, Snd_PowerUp_Collect_2,
		Snd_PowerUp_Collect_3, Snd_PowerUp_Collect_4, Snd_PowerUp_Collect_5, Snd_PowerUp_Collect_6,
		Snd_PowerUp_Collect_7, Snd_PowerUp_Collect_8, Snd_PowerUp_Collect_9, Snd_PowerUp_Collect_10,
		Snd_PowerUp_Collect_11, Snd_PowerUp_Collect_12, Snd_PowerUp_Collect_13, Snd_PowerUp_Collect_14,
		Snd_PowerUp_Collect_15, Snd_PowerUp_Collect_16, Snd_PowerUp_Collect_17, Snd_PowerUp_Collect_18,
		Snd_PowerUp_Collect_19, Snd_PowerUp_Collect_20, Snd_PowerUp_Collect_21, Snd_PowerUp_Collect_22,
		Snd_PowerUp_Collect_23, Snd_PowerUp_Collect_24, Snd_PowerUp_Collect_25, Snd_PowerUp_Collect_26,
		Snd_PowerUp_Collect_27, Snd_PowerUp_Collect_28
		)
		
		audio_play_sound(collected_pu_sfx, 8, false);
	}
	else {
		var jelly_pu_sfx = choose(Snd_Jelly_Bomb_SFX_1, Snd_Jelly_Bomb_SFX_2, Snd_Jelly_Bomb_SFX_3)
		
		audio_play_sound(jelly_pu_sfx, 8, false);
	}
	
}