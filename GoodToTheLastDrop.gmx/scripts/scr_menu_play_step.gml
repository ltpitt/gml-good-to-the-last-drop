if (obj_menu_play.image_index==1) {
    if (keyboard_check(vk_down)) {
        obj_menu_play.image_index=0;        
    }
}

show_debug_message(string(keyboard_check(vk_down)));

