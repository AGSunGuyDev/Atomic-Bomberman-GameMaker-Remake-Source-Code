key_down  = sign(gamepad_button_check_pressed(0, gp_padd) + keyboard_check_pressed(vk_down) + keyboard_check_pressed(ord("S")));
key_up    = sign(gamepad_button_check_pressed(0, gp_padu) + keyboard_check_pressed(vk_up)   + keyboard_check_pressed(ord("W")));
key_confirm = sign(gamepad_button_check_pressed(0, gp_face1) + gamepad_button_check_pressed(0, gp_face2) + gamepad_button_check_pressed(0, gp_face3) + gamepad_button_check_pressed(0, gp_face4) + keyboard_check_pressed(vk_space) + keyboard_check_pressed(ord("Z")) + keyboard_check_pressed(ord("E")) + keyboard_check_pressed(vk_enter));

if(key_down) {
	
	if(selected < array_length(options)-1) {
		selected += 1;
	} else if(selected = array_length(options)-1) {
		selected = 0;
	};
	audio_play_sound(Snd_option_scroll_down, 8, false);
};

if(key_up) {
	
	if(selected > 0) {
		selected -= 1;
	} else {
		selected = array_length(options)-1;	
	};
	audio_play_sound(Snd_option_scroll_up, 8, false);
};

if(key_confirm) {
	
	switch(options[selected]) {
		case "START GAME":
			audio_play_sound(Snd_Option_Confirm, 8, false);
			audio_play_sound(Snd_Music_Classic_Green_Acres, 8, true);
			room_goto(RM_classic_green_acres);
			//audio_play_sound(PlaceholderDigitalDatabaseMusic, 8, true);
			audio_stop_sound(Snd_Music_Main_Menu);
		break;
		
		case "START NETWORK GAME":
			audio_play_sound(Snd_option_locked, 8, false);
		break;
		
		case "JOIN NETWORK GAME":
			audio_play_sound(Snd_option_locked, 8, false);
		break;
		
		case "OPTIONS":
			audio_play_sound(Snd_option_locked, 8, false);
		break;
		
		case "ABOUT BOMBERMAN":
			audio_play_sound(Snd_option_locked, 8, false);
		break;
		
		case "ONLINE MANUAL":
			audio_play_sound(Snd_option_locked, 8, false);
		break;
		
		case "EXIT BOMBERMAN":
			game_end();
			audio_play_sound(Snd_Option_Confirm, 8, false);
		break;
	};
	
};
