// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bomb_punch_sfx(){
	var bomb_punch_sfx = choose(Snd_Bomb_Punched_1, Snd_Bomb_Punched_2
	)

	audio_play_sound(bomb_punch_sfx, 8, false);
}