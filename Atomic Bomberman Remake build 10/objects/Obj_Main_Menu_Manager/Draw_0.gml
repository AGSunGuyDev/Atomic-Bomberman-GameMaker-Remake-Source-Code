draw_set_font(Font_FixedSys);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

for(var i = 0; i < array_length(options); i++;) {
	
	if(i = selected) {
		draw_sprite(Spr_Grn_Trigger_Bomb, image_index, x + 140, y + 24 + (38*i))
		//draw_text(x + 170,y + 20 +(38*i),options[i]);	
	} else {	
		//draw_text(x + 170,y + 20 +(38*i),options[i]);		
	};	
};

