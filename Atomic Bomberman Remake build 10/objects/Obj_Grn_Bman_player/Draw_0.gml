//debug stuff
draw_sprite_ext(sprite_index, image_index, x, y + Z_Axis, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
var FontABMWhite = font_add_sprite(Spr_ABM_Font, ord("!“#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}"), true, 1);
draw_set_color(c_white);
draw_set_font(FontABMWhite);
draw_text(x, y - 50, "SPD: " + string(move_spd));
draw_set_color(c_white);
draw_set_font(FontABMWhite);
draw_text(x, y - 70, "Skates num: " + string(skates_collected));
draw_set_color(c_white);
draw_set_font(FontABMWhite);
draw_text(x, y - 90, "Fire range: " + string(Bomb_Fire_Range));
draw_set_color(c_white);
draw_set_font(FontABMWhite);
draw_text(x, y - 110, "Bombs Left: " + string(Bombs_left));
draw_set_color(c_white);
draw_set_font(FontABMWhite);
draw_text(x, y - 130, "line bomb allow: " + string(activate_line_bomb_ability));
draw_set_color(c_white);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);

//draws a rectangle for how far ahead is the 1 tile to the right
draw_set_color(c_red);
draw_rectangle(x + 16, y + 2, x + 52, y + 32, true);
//draws a rectangle for how far ahead is the 1 tile to the left
draw_set_color(c_red);
draw_rectangle(x - 52, y + 2, x - 16, y + 32, true);
//draws a rectangle for how far ahead is the 1 tile to the top
draw_set_color(c_red);
draw_rectangle(x - 17, y - 25, x + 17, y + 7, true);
//draws a rectangle for how far ahead is the 1 tile to the bottom
draw_set_color(c_red);
draw_rectangle(x - 17, y + 25, x + 17, y + 56, true);
