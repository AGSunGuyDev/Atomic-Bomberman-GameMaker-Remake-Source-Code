switch(state){
	case explosion_state.explosion_fade_in:
		fatal_flame = true;
		image_index = 0;
		state = explosion_state.explosion_idle;
	break;
	
	case explosion_state.explosion_fade_out:
		instance_destroy();
	break;
}
