if (keyboard_check(vk_escape)){
	audio_play_sound(Snd_Option_Confirm, 8, false);
	audio_play_sound(Snd_Music_Main_Menu, 8, true);
	audio_stop_sound(Snd_Music_Classic_Green_Acres);
	room_goto(RM_main_menu)
}

//restarts the room
if (keyboard_check_pressed(vk_backspace)){
	audio_play_sound(Snd_Option_Confirm, 8, false);
	room_restart();
}
