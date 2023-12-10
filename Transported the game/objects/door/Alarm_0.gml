/// @description Insert description here
// You can write your code in this editor
if(player.bbox_top-32>bbox_bottom)
{
	sprite_index=spr_wall
	audio_play_sound(snd_door_slam,1000,false)
}
else
{
	alarm[0]=2
}