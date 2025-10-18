// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function wall_colliding(x, y) {
    static list = ds_list_create();
    ds_list_clear(list);
    
    var num = instance_place_list(x, y, par_wall, list, false);
    for (var i = 0; i < num; i++) {
        var inst = list[| i];

        var is_jumpthrough = inst.object_index == obj_jumpthrough_platform || object_is_ancestor(inst.object_index, obj_jumpthrough_platform);
        if (is_jumpthrough && bbox_bottom - 1.1 > inst.bbox_top)
            continue;
        return true;
    }
    return false;
}