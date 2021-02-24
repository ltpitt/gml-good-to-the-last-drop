    // PS Vita gamepad
    // gp_face1 = CROSS
    // gp_face2 = SQUARE
    // gp_face3 = CIRCLE
    // gp_face4 = TRIANGLE

    //  gp_shoulderl = L
    //  gp_shoulderr = R
    //  gp_shoulderlb = UNUSED
    //  gp_shoulderrb = UNUSED

    //  gp_select = SELECT
    //  gp_start = START

    //  gp_stickl = UNUSED
    //  gp_stickr = UNUSED

    //  gp_padu = DPAD UP
    //  gp_padd = DPAD DOWN
    //  gp_padl = DPAD LEFT
    //  gp_padr = DPAD RIGHT

    //  gp_axislh = LEFT ANOLOUGE HORIZONTAL AXIES
    //  gp_axislv = LEFT ANOLOUGE VERTICAL AXIES

    //  gp_axisrh = RIGHT ANOLOUGE HORIZONTAL AXIES
    //  gp_axisrv = RIGHT ANOLOUGE VERTICAL AXIES

    
    var gp_num = gamepad_get_device_count();
    for (var i = 0; i < gp_num; i++;) {
        if (gamepad_is_connected(i)) {
            global.gp = true;
            break;
        } else {
            global.gp = false;
        }
    }

    if (global.gp) {
        // Movement using gamepad digital / analog
        gamepad_set_axis_deadzone(0, 0.5);
        var h_axis_l = gamepad_axis_value(0, gp_axislh)
        var h_axis_r = gamepad_axis_value(0, gp_axisrh)
        if (gamepad_button_check_pressed(0, gp_padl)) or (h_axis_l < 0) or (h_axis_r < 0) {
            keyboard_key_press(vk_left)
        } else if (gamepad_button_check_pressed(0, gp_padr)) or (h_axis_l > 0) or (h_axis_r > 0) {
            keyboard_key_press(vk_right)
        } else if (h_axis_l == 0) and (h_axis_l == 0) and !(gamepad_button_check(0, gp_padl)) and !(gamepad_button_check(0, gp_padr)) {
            keyboard_key_release(vk_left);
            keyboard_key_release(vk_right);
        }
    }

if (obj_menu_play.image_index==1) {
    if (keyboard_check_pressed(vk_down)) {
        obj_menu_play.image_index=0;  
        obj_menu_options.image_index=1;      
    }
    if (keyboard_check_pressed(vk_enter) or gamepad_button_check_pressed(0, gp_face1)) {
        room_goto(1);
    }
} else if (obj_menu_options.image_index==1) {
    if (keyboard_check_pressed(vk_up)) {
        obj_menu_options.image_index=0;  
        obj_menu_play.image_index=1;      
    } else if (keyboard_check_pressed(vk_down)) {
        obj_menu_options.image_index=0;  
        obj_menu_credits.image_index=1;      
    }
} else if (obj_menu_credits.image_index==1) {
    if (keyboard_check_pressed(vk_up)) {
        obj_menu_credits.image_index=0;  
        obj_menu_options.image_index=1;      
    } else if (keyboard_check_pressed(vk_down)) {
        obj_menu_credits.image_index=0;  
        obj_menu_exit.image_index=1;      
    }
} else if (obj_menu_exit.image_index==1) {
    if (keyboard_check_pressed(vk_up)) {
        obj_menu_exit.image_index=0;  
        obj_menu_credits.image_index=1;      
    }
    if (keyboard_check_pressed(vk_enter)) {
        game_end();
    }
}

