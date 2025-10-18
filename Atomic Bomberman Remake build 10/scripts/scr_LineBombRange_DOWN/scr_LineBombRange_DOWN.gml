// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_LineBombRange_DOWN(){
	var xx   = argument[0];
	var yy   = argument[1];
	var ang  = argument[2];
	var cont = true;
		var _tile_step = instance_position(x, y, Obj_Tile);
		
		for (var ii = 1; ii <= creator_instance.Bombs_left; ii++){
			// Expand up
			if (cont && !place_meeting(x+xx*ii,y+yy*ii, Obj_Par_Wall)){
				if (!place_meeting(x+xx*ii,y+yy*ii, Obj_Destructible_Wall)) && (!place_meeting(x+xx*ii,y+yy*ii, Obj_PU_Parent)) && (!place_meeting(x+xx*ii,y+yy*ii, Obj_Basic_Bomb)){
					if (ii <= creator_instance.Bombs_left){
						var blast_mid = instance_create_layer(x + xx * ii, y + yy * ii, "Fire_Layer", Obj_Basic_Bomb)
						blast_mid.line_bomb_ammo_waste = true;
						blast_mid.Fire_Range = Fire_Range;
						blast_mid.creator_instance = creator_instance;
					}
				}
				else{
					cont = false;
				}
			}
			else
			cont = false;
		}
}