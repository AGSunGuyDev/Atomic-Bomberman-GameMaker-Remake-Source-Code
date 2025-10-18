// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_BlastRange_LEFT(){
	var xx   = argument[0];
	var yy   = argument[1];
	var ang  = argument[2];
	var cont = true;
	
	var _tile_step = instance_position(x, y, Obj_Tile);

	for (var ii = 1; ii <= Fire_Range; ii++){
		var _destructible_wall = instance_place(x - xx * ii, y, Obj_Destructible_Wall);
	    // Expand up
	    if (cont && !place_meeting(x+xx*ii,y+yy*ii, Obj_Par_Wall)){
	         if (!place_meeting(x+xx*ii,y+yy*ii, Obj_Destructible_Wall)) && (!place_meeting(x+xx*ii,y+yy*ii, Obj_PU_Parent)) && (!place_meeting(x+xx*ii,y+yy*ii, Obj_Basic_Bomb)){
	            if (ii >= Fire_Range){
	                var blast_end = instance_create_layer(x + xx * ii, y + yy * ii, "Fire_Layer", ObJ_Bomb_Explosion_Far_Left)
				}
	            else if (ii <= Fire_Range){
	                 var blast_mid = instance_create_layer(x + xx * ii, y + yy * ii, "Fire_Layer", ObJ_Bomb_Explosion_Mid_Left)
				}
	        }
	        else{
				var _blast_brick = instance_create_layer(x + xx * ii, y + yy * ii, "Fire_Layer", ObJ_Bomb_Explosion_Far_Left);
	            cont = false;
	        }
	    }
	    else
	        cont = false;
	}
}