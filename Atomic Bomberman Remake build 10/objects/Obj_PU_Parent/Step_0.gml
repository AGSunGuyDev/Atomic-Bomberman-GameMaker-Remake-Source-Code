//gravity
if (zspd < 10){
	zspd += GravSpeed;
}
		
		//get collision with floor
		if (Z_Axis+zspd > floorZ){
			zspd = 0;
			Z_Axis = floorZ;
		}

		Z_Axis+= zspd;
