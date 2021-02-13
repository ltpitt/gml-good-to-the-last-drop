if !(global.game == "over") {

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
        show_debug_message("h_axis_l = " + string(h_axis_l))
    }
        
    // Player movement
    var x_dir = keyboard_check(vk_right) - keyboard_check(vk_left);
    if (x >= sprite_get_width(spr_player) / 2) && (x + sprite_get_width(spr_player) / 2 <= room_width) {
        x += x_dir * player_speed;
    }

    if (x <= 117) {
        x = 120;
    }
    if (x >= 1162) {
        x = 1160;
    }

    // Player animation
    if keyboard_check(vk_left) || keyboard_check(vk_right) {
        if (clockwise == 0) {
            player_rotation_angle += 0.3;
            if (player_rotation_angle > 5) {
                clockwise = 1;
            }
        } else {
            player_rotation_angle -= 0.3;
            if (player_rotation_angle < -5) {
                clockwise = 0;
            }
        }
        image_angle += sin(degtorad(player_rotation_angle - image_angle)) * 10;
    } else {
        player_rotation_angle = 0;
        image_angle += sin(degtorad(player_rotation_angle - image_angle)) * 10;
    }

    // Drop collision
    if place_meeting(x, y, obj_drop) {
        var drop = instance_place(x, y, obj_drop);
        with(drop) {
            audio_play_sound(snd_drinking, 10, false);
            instance_destroy();
            score += 1
            if (score == 10) {
                instance_destroy(spr_cloud);
                global.game = "over";
            }
        }
    }

    // Draw score
    draw_text(10, 10, score);

    //show_debug_message("player_rotation_angle = " + string(player_rotation_angle));
    //show_debug_message("clockwise = " + string(clockwise));
    //show_debug_message("x = " + string(x))
    //show_debug_message("game = " + string(global.game))


} else {
    original_x = x
    original_y = y
    x = room_width / 2;
    y = room_height / 2;
    original_xscale = image_xscale;
    original_yscale = image_xscale;
    image_xscale += 0.001;
    image_yscale += 0.001;
}

