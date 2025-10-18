/// @function place_meeting_3d
/// @arg x
/// @arg y
/// @arg z
/// @arg obj
function place_meeting_3d() {

	//Args
	var _x = argument[0];
	var _y = argument[1];
	var _z = argument[2];
	var _obj = argument[3];

	//Vars
	var _height = height;

	//XY
	var xyMeeting = instance_place(_x, _y, _obj);

	//Z
	var zMeeting = false;

	if (xyMeeting){
	 zMeeting = rectangle_in_rectangle(0, xyMeeting.Z_Axis, 1, xyMeeting.Z_Axis - xyMeeting.height,
	            0, _z, 1, _z - height);
	}

	//Return
	return xyMeeting && zMeeting;


}
