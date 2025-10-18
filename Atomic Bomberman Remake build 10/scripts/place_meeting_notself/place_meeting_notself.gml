// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function place_meeting_notself(x_, y_, obj){
var original_object = id;
    with(obj) {
        if (id == original_object)
            continue;
        var new_object = id;
        with (original_object) {
            if (place_meeting(x_, y_, new_object))
                return new_object;
        }
    }
    return noone;
}