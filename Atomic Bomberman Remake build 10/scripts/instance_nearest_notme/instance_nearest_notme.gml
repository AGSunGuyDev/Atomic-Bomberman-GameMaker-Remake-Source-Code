// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function instance_nearest_notme(_x, _y, _obj){
	var _my_x = x;
	  x = infinity;
	  var _inst = instance_nearest(_x, _y, _obj);
	  x = _my_x;
	  if (_inst == id) return noone;
	  return _inst;
}