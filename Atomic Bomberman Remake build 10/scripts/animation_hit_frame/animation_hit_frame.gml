// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function animation_hit_frame() {
    /// @func animation_hit_frame()
    /// @param {Real} frame[s]
    /// @returns {Bool} Whether the animation has hit one of the given frames (true) or not (false).
    
    var _speed = (image_speed / (game_get_speed(gamespeed_fps) / sprite_get_speed(sprite_index)));
    
    for (var _i = 0; _i < argument_count; _i++) {
        var _next_frame = argument[_i] + 1;
        if ((image_index >= (_next_frame - _speed)) && (image_index < _next_frame)) {
            return true;
        }
    }
    return false;
}