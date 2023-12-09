/// @description Insert description here
// You can write your code in this editor
immunityFrames--
#region camera stuff
camera_set_view_speed(view_camera[0],0,0)
camera_set_view_size(view_camera[0],(1366*stats.cameraZoom)/2,(768*stats.cameraZoom)/2)
camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])-((camera_get_view_x(view_camera[0])-(stats.cameraTarget.x-((1366*stats.cameraZoom)/4))))/10,camera_get_view_y(view_camera[0])-((camera_get_view_y(view_camera[0])-(stats.cameraTarget.y-((768*stats.cameraZoom)/4))))/10)
if(camera_get_view_x(view_camera[0])<0)
{
	camera_set_view_pos(view_camera[0],0,camera_get_view_y(view_camera[0]))
}
if(camera_get_view_x(view_camera[0])+1366*(stats.cameraZoom/2)>room_width)
{
	camera_set_view_pos(view_camera[0],room_width-1366*(stats.cameraZoom/2),camera_get_view_y(view_camera[0]))
}
if(camera_get_view_y(view_camera[0])<0)
{
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),0)
}
if(camera_get_view_y(view_camera[0])+768*(stats.cameraZoom/2)>room_height)
{
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),room_height-768*(stats.cameraZoom/2))
}
#endregion

#region music
for(var i=0;i<array_length(music);i++)
{
	audio_sound_gain(musics[i],musicSelected==i,musicFadeTime)
}
musicSelected=0
if(door.alarm[0]<=0)
{
	musicSelected=1
}
#endregion

for(var i=0;i<array_length(cooldown);i++)
{
	cooldown[i]--
}

for(var i=0;i<array_length(acheivment);i++)
{
	var _unlocked=acheivment[i].unlocked
	acheivment[i].unlockFunction()
	if(!_unlocked&&acheivment[i].unlocked)
	{
		array_push(acheivmentCue,i)
		alarm[4]=360
		if(!audio_is_playing(snd_acheivment))
		{
			audio_play_sound(snd_acheivment,1000,false)
		}
	}
}