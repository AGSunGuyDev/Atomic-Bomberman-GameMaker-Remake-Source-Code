	var FontABMWhite = font_add_sprite(Spr_ABM_Font, ord("!“#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}"), true, 1);
	surface_resize(application_surface,640,480);
	//set the gui size to be same as the viewport
	display_set_gui_size(640, 480);
	draw_set_font(FontABMWhite);
