//if 8 seconds get passed change the room to title screen intro room
  randomize();
	var voice_intro = choose(Snd_Charlie_Atomic_Bomberman_1, Snd_Charlie_Atomic_Bomberman_2,
	Snd_Charlie_Atomic_Bomberman_3, Snd_Charlie_Atomic_Bomberman_3, Snd_Charlie_Atomic_Bomberman_4,
	Snd_Billy_Atomic_Bomberman_1, Snd_Billy_Atomic_Bomberman_2, Snd_Billy_Atomic_Bomberman_3,
	Snd_Billy_Atomic_Bomberman_4, Snd_Billy_Atomic_Bomberman_5, Snd_Billy_Atomic_Bomberman_6,
	Snd_Billy_Atomic_Bomberman_7)
  audio_play_sound(Snd_Option_Confirm, 8, false);
  audio_play_sound(voice_intro, 8, false);
  room_goto(RM_intro_AB_title);