switch(state){
	case Bomberman_Player.Bomberman_idle:
		if (BoredAnimTrigger = true){
			if sprite_index = BoredIdleAnim{
				BoredAnimTrigger = false;
				BoredAnimTimerTrigger = true;
			}
		}
	break;
	
	case Bomberman_Player.Bomberman_Kick:
		Player_Kicking = false;
		Player_Punching = false;
		BoredAnimTimerTrigger = true;
		image_index = 0;
		image_speed = move_spd / 2;
		state = Bomberman_Player.Bomberman_idle;
	break;
	
	case Bomberman_Player.Bomberman_Punch_Bomb:
		Player_Kicking = false;
		Player_Punching = false;
		BoredAnimTimerTrigger = true;
		image_index = 0;
		image_speed = move_spd / 2;
		state = Bomberman_Player.Bomberman_idle;
	break;
	
	case Bomberman_Player.Bomberman_Death:
		room_restart();
	break;
}
