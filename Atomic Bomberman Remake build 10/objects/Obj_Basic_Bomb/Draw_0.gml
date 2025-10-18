draw_sprite_ext(sprite_index, image_index, x, y + Z_Axis, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
draw_set_color(c_white);
var FontABMWhite = font_add_sprite(Spr_ABM_Font, ord("!“#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}"), true, 1);
draw_set_font(FontABMWhite);
draw_text(x, y - 70, "Fire range: " + string(Fire_Range));
draw_text(x, y - 80, "state: " + string(state));
draw_text(x, y - 95, "punch to side: " + string(punch_to_side));

//draws a rectangle for how far ahead is the 1 tile to the right
draw_set_color(c_red);
draw_rectangle(x + 23, y - 16, x + 56, y + 16, true);
//draw_rectangle(x + 104, y - 14, x + 136, y + 14, true); <-- how far ahead is the 3rd tile
//draws a rectangle for how far ahead is the 1 tile to the left
draw_set_color(c_red);
draw_rectangle(x - 56, y - 16, x - 23, y + 16, true);
//draws a rectangle for how far ahead is the 1 tile to the top
draw_set_color(c_red);
draw_rectangle(x - 16, y - 50, x + 16, y - 22, true);
//draws a rectangle for how far ahead is the 1 tile to the bottom
draw_set_color(c_red);
draw_rectangle(x - 16, y + 50, x + 16, y + 22, true);


//draws its own hitbox rectangle
draw_set_color(c_blue);
draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);