x += bird_speed;
y = anchorY + sin(timer*frequency)*amplitude;

// Disappear left
if (x < view_xview - (sprite_get_width(spr_bird) / 2)) {
    instance_destroy();
    instance_create(0, 0, obj_bird);    
}

// Disappear right
if (x > room_width + (sprite_get_width(spr_bird) / 2)) {
    instance_destroy();
    instance_create(0, 0, obj_bird);
}

timer++;
