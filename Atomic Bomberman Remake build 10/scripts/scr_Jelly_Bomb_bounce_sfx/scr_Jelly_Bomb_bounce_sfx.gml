// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Jelly_Bomb_bounce_sfx(){
	var jelly_pu_sfx = choose(Snd_Jelly_Bomb_SFX_1, Snd_Jelly_Bomb_SFX_2, Snd_Jelly_Bomb_SFX_3)
		
	audio_play_sound(jelly_pu_sfx, 8, false);
}