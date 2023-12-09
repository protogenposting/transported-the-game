/// @description Insert description here
// You can write your code in this editor
cooldown=[0,0,0,0]

healthPoints=3
maxHealthPoints=3
immunityFrames=0

acheivment=obj_menu.acheivment

cameraTarget=player
cameraZoom=2

musicSelected=0
music=[snd_empty,snd_music_default]
musics=[]
musicFadeTime=6000
var i=0
repeat(array_length(music))
{
	array_push(musics,audio_play_sound(music[i],1000,true))
	audio_sound_gain(musics[i],0,0)
	i++
}

camera_set_view_pos(view_camera[0],(stats.cameraTarget.x-((1366*stats.cameraZoom)/4)),(stats.cameraTarget.y-((768*stats.cameraZoom)/4)))

function shake_camera(shakeIntensity){
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+irandom_range(-shakeIntensity,shakeIntensity),camera_get_view_y(view_camera[0])+irandom_range(-shakeIntensity,shakeIntensity))
}
