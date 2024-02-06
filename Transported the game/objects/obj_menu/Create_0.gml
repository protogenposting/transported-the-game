/// @description Insert description here
// You can write your code in this editor
audio_master_gain(0.3)
randomize()

logoSize=.3
aud=audio_play_sound(snd_music_menu,1000,true)
nextBeat=0
bpm=120
beat=0
buttonSelected=0
function set_acheivments(completed){
	for(var o=0;o<array_length(acheivment);o++)
	{
		for(var i=0;i<array_length(completed);i++)
		{
			if(acheivment[o].name==completed[i][0])
			{
				acheivment[o].unlocked=completed[i][1]
			}
		}
	}
}
acheivment[0]={
	name:"placeholder",
	description:"har har",
	unlocked: false,
	sprite: spr_acheivment0,
	unlockFunction: function(){
		
	}
}
acheivment[1]={
	name:"placeholder",
	description:"har har",
	unlocked: false,
	sprite: spr_acheivment0,
	unlockFunction: function(){
		
	}
}

showingAcheivments=false

acheivmentSelected=0
var _acheivments=load_file("Acheivments.Transported")
if(_acheivments!=false)
{
	set_acheivments(_acheivments.acheivments)
}
button[0]={
	position:[room_width/4,room_height/2],
	size:[256,128],
	name:"Start",
	func:function(){
		room_goto(rm_menu_character_select)
		/*with(instance_create_depth(0,0,0,stats))
		{
			acheivment=obj_menu.acheivment
			load_game_progress("save_file1.ReZ")
		}*/
	}
}
button[1]={
	position:[room_width/4,(room_height/2)+202],
	size:[256,64],
	name:"Acheivments",
	func:function(){
		obj_menu.showingAcheivments=!obj_menu.showingAcheivments
	}
}
button[2]={
	position:[room_width/4,(room_height/2)+271],
	size:[256,64],
	name:"Options",
	func:function(){
		room_goto(rm_menu_options)
	}
}
button[3]={
	position:[room_width/4,(room_height/2)+271+69],
	size:[256,64],
	name:"Quit Game",
	func:function(){
		game_end()
	}
}

function daniel_left_click_attack(object){
	stats.cooldown[0]=15
	stats.immunityFrames=14
	var moveDirection=point_direction(object.x,object.y,mouse_x,mouse_y)
	object.horizontalSpeed+=lengthdir_x(7,moveDirection)
	object.verticalSpeed+=lengthdir_y(7,moveDirection)
	object.swingTime=5
	object.maxSwingTime=5
	object.swingDamage=1
	object.hitEnemy=false
	while(abs(object.horizontalSpeed)>object.speedCap)
	{
		object.horizontalSpeed-=sign(object.horizontalSpeed)
	}
	while(abs(object.verticalSpeed)>object.speedCap)
	{
		object.verticalSpeed-=sign(object.verticalSpeed)
	}
	
}
function daniel_alt_left_click_attack(object){
	stats.cooldown[3]=30
	var moveDirection=point_direction(object.x,object.y,mouse_x,mouse_y)
	object.horizontalSpeed+=lengthdir_x(-7,moveDirection)
	object.verticalSpeed+=lengthdir_y(-7,moveDirection)
	object.swingTime=7
	object.maxSwingTime=7
	object.swingDamage=2
	object.hitEnemy=false
	
}
function daniel_right_click_attack(object){
	if(object.rightAttackKeyPressed)
	{
		object.holdAttackPower=0
	}
	object.holdAttackPower+=0.03
	if(object.holdAttackPower>3)
	{
		stats.healthPoints-=0.01
	}
	object.danielFireTimer=2
}
function daniel_right_click_release(object){
	var _inst=instance_create_depth(object.x,object.y,object.depth+1,par_projectile)
	_inst.direction=point_direction(object.x,object.y,mouse_x,mouse_y)
	_inst.speed=15
	_inst.damage*=object.holdAttackPower
	stats.cooldown[1]=15
}
function daniel_space_attack(object){
	var moveDirection=point_direction(object.x,object.y,mouse_x,mouse_y)
	object.horizontalSpeed+=lengthdir_x(15,moveDirection)
	object.verticalSpeed+=lengthdir_y(15,moveDirection)
	stats.cooldown[2]=30
	stats.immunityFrames=25
	while(abs(object.horizontalSpeed)>object.speedCap)
	{
		object.horizontalSpeed-=sign(object.horizontalSpeed)
	}
	while(abs(object.verticalSpeed)>object.speedCap)
	{
		object.verticalSpeed-=sign(object.verticalSpeed)
	}
}

characterSelected=0

character[0]=create_character("Daniel",spr_daniel,spr_daniel_schythe,3,6,"hes daniel WHAT THE FUCK TO YOU EXPECT",
daniel_left_click_attack,daniel_right_click_attack,daniel_alt_left_click_attack,daniel_space_attack)

character[1]=create_character("Willow",spr_willow,spr_daniel_schythe,3,6,"Willowo whats this owo?!?!?!",
daniel_left_click_attack,daniel_right_click_attack,daniel_alt_left_click_attack,daniel_space_attack)

if(file_exists("Settings.Transported"))
{
	var _temp = load_file("Settings.Transported")
	window_set_fullscreen(_temp.fullscreen)
	global.particleLimit=_temp.particleLimit
	global.particleHardCap=_temp.particleLimitHardCap
}