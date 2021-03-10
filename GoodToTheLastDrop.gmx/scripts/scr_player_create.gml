player_speed = 3;
player_rotation_angle = 0;
clockwise = 0;
score = 0;
global.game = "start";
global.music = true;
global.end_timeout = 1000;

if global.music {
    audio_stop_sound(snd_menu_music);
    audio_play_sound(snd_game_music, 10, true);
}



