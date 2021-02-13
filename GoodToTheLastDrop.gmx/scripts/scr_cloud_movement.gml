x += cloud_speed;

// Bounce left
if (x < sprite_get_width(spr_cloud) / 2) {
    cloud_speed *= -1;
}
// Bounce right
if (x + sprite_get_width(spr_cloud) / 2 >= room_width) {
    cloud_speed *= -1;
}

// Breathe
image_xscale = 1 + cos(timer*frequency)*amplitude;
image_yscale = 1 + cos(timer*frequency)*amplitude;
timer = timer + 0.5;
if (image_xscale == 1.20) {
    timer = 300;
    if (!first_drop) {
        instance_create(x,y,obj_drop) direction=0;
        audio_play_sound(snd_drop, 10, false);
    }
    first_drop = false;
}


//show_debug_message("image_xscale = " + string(image_xscale));
//show_debug_message("image_yscale = " + string(image_yscale));
//show_debug_message("frequency = " + string(frequency));
//show_debug_message("amplitude = " + string(amplitude));
//show_debug_message("timer = " + string(timer));
//show_debug_message("condition = " + string(image_xscale == 1.0));

// show_debug_message("cloud_speed = " + string(cloud_speed));
// show_debug_message("x = " + string(x));
// show_debug_message("x < 0 " + string(x < 0));
// audio_play_sound(snd_bounce, 10, false);

// Rotazione con mouse (attiva anche in init)
//dir = point_direction(x, y, mouse_x, mouse_y);
//image_angle += sin(degtorad(dir - image_angle)) * rspeed;
