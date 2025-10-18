//Manages width and height of the custom camera
view_width = 1280/2;
view_height = 960/2;

//Manages the scale of window size
window_scale = 2;

alarm[0] = 1;

surface_resize(application_surface, view_width*window_scale, view_height*window_scale);

//this will determine if camera stops scrolling whenever player is in
//"fighting" wave scene, it will get unlocked only if player kills all enemies
camera_screen_lock = false;
