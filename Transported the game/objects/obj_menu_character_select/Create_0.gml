/// @description Insert description here
// You can write your code in this editor
audio_master_gain(0.3)
randomize()

logoSize=.3
nextBeat=0
bpm=120
beat=0
buttonSelected=0


button[0]={
	position:[room_width/4,room_height/4],
	size:[256,128],
	name:"Back",
	type:"button",
	func: function(){
		room_goto(rm_menu)
		var _temp={}
		_temp.fullscreen=window_get_fullscreen()
		_temp.particleLimit=global.particleLimit
		_temp.particleLimitHardCap=global.particleHardCap
		save_file(_temp,"Settings.Transported")
	}
}

var _x=room_width/4
var _y=room_height/4 + 128
for(var i=0;i<array_length(obj_menu.character);i++)
{
	array_push(button, {
		position:[room_width/4,_y],
		size:[256,64],
		name:obj_menu.character[i].name,
		type:"button",
		description:obj_menu.character[i].description,
		characterID:i,
		func: function(){
			obj_menu.characterSelected=characterID
			room_goto(Room1)
			audio_stop_all()
		}
	})
	_y+=69
}