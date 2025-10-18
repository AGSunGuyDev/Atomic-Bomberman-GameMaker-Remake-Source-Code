// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Scr_Line_Bomb_Creation(){
	if (creator_instance.Can_Line_Bomb = true) && (creator_instance.inside_bomb = true) && (creator_instance.key_activate){
		var _bomb_line_create = instance_place(x, y, Obj_Basic_Bomb)
			if (creator_instance.face == LEFT){
				scr_LineBombRange_LEFT(-CELL_WIDTH, 0, 0);
			}
			else if (creator_instance.face == RIGHT){
				scr_LineBombRange_RIGHT(CELL_WIDTH, 0, 0);
			}
			else if (creator_instance.face == UP){
				scr_LineBombRange_UP(0, -CELL_HEIGHT, 0);
			}
			else if (creator_instance.face == DOWN){
				scr_LineBombRange_DOWN(0, CELL_HEIGHT, 0);
			}
	}
}