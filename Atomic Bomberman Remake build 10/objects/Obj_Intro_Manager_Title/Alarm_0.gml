//if 8 seconds get passed change the room to hudson intro room
  audio_play_sound(Snd_Option_Confirm, 8, false);
  audio_play_sound(Snd_Music_Main_Menu, 8, true);
  audio_stop_sound(Snd_Music_Intro);
  room_goto(RM_main_menu);

