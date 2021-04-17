x += cloud_speed;

// Bounce left
if (x < sprite_get_width(spr_cloud) / 2) {
    cloud_speed *= -1;
}
// Bounce right
if (x + sprite_get_width(spr_cloud) / 2 >= room_width) {
    cloud_speed *= -1;
}

show_debug_message(string(global.cloud_direction_change_cooldown));
global.cloud_direction_change_cooldown -= 1;
if (global.cloud_direction_change_cooldown < 0) {
    if (random_range(1, 3) > 2) {
        cloud_speed *= -1;
    }
    global.cloud_direction_change_cooldown = 500;
}
