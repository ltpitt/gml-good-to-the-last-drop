bird_speed = 2;
anchorY = random_range(230, 370);
frequency = random_range(0.1, 0.3);
amplitude = random_range(20, 35);
timer = 0;
image_xscale = 0.411764705181122;
image_yscale = 0.35273631811142;


if irandom_range(1,2) == 1 {
    x = view_xview - sprite_get_width(spr_bird) / 2 + 1;
} else {
    bird_speed *= -1;
    x = room_width + sprite_get_width(spr_bird) / 2 - 1;
}
