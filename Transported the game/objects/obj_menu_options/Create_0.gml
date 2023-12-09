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
	position:[room_width/4,room_height/2],
	size:[256,128],
	name:"Back",
	type:"button",
	func:function(){
		room_goto(rm_menu)
		var _temp={}
		_temp.fullscreen=window_get_fullscreen()
		_temp.particleLimit=global.particleLimit
		_temp.particleLimitHardCap=global.particleHardCap
		save_file(_temp,"Settings.Transported")
	}
}
button[1]={
	position:[room_width/4,(room_height/2)+133],
	size:[256,64],
	type:"button",
	name:"Fullscreen: "+bool_to_onoff(window_get_fullscreen()),
	func:function(){
		window_set_fullscreen(!window_get_fullscreen())
		name="Fullscreen: "+bool_to_onoff(window_get_fullscreen())
	}
}
button[2]={
	position:[room_width/4,(room_height/2)+202],
	size:[256,64],
	name:"Particle Limit "+string(global.particleLimit),
	type:"slider",
	variable:["global","particleLimit",50,500],
	func:function(){
		name="Particle Limit "+string(global.particleLimit)
	}
}
button[3]={
	position:[room_width/4,(room_height/2)+271],
	size:[256,64],
	name:"Particle Limit Hard Cap "+bool_to_onoff(global.particleHardCap),
	type:"button",
	func:function(){
		global.particleHardCap=!global.particleHardCap
		name="Particle Limit Hard Cap "+bool_to_onoff(global.particleHardCap)
	},
	description:"Deletes old particles if the particle cap is exceeded even if they havent gone invisible yet. Can improve performance but may look choppy."
}