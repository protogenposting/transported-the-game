/// @description Insert description here
// You can write your code in this editor

var danielFireTimerPrev=danielFireTimer

danielFireTimer--
swingTime--

drawDirection=sign(mouse_x-x)

leftKey=keyboard_check(ord("A"))
rightKey=keyboard_check(ord("D"))
upKey=keyboard_check(ord("W"))
downKey=keyboard_check(ord("S"))
spaceKey=keyboard_check(vk_space)
leftAttackKey=mouse_check_button(mb_left)
rightAttackKey=mouse_check_button(mb_right)
rightAttackKeyPressed=mouse_check_button_pressed(mb_right)

if(mouse_wheel_down()||mouse_wheel_up())
{
	usingAltAttack=!usingAltAttack
	if(usingAltAttack)
	{
		var _inst=instance_create_depth(x,y,depth,damage_indicator)
		_inst.text="alternate attack"
		_inst.heal=true
	}
	else
	{
		var _inst=instance_create_depth(x,y,depth,damage_indicator)
		_inst.text="normal attack"
		_inst.heal=true
	}
}

var horizontalDir=rightKey-leftKey
var verticalDir=downKey-upKey

if(horizontalDir!=0)
{
	horizontalSpeed=moveToward(horizontalSpeed,movementSpeed*horizontalDir,ACCELLTIME)
}
else
{
	horizontalSpeed=moveToward(horizontalSpeed,0,DEACCELLTIME)
}
if(verticalDir!=0)
{
	verticalSpeed=moveToward(verticalSpeed,movementSpeed*verticalDir,ACCELLTIME)
}
else
{
	verticalSpeed=moveToward(verticalSpeed,0,DEACCELLTIME)
}
/*if(abs(horizontalSpeed)>movementSpeed)
{
	horizontalSpeed=moveToward(horizontalSpeed,movementSpeed*horizontalDir,CAPDEACCELLTIME)
}
if(abs(verticalSpeed)>movementSpeed)
{
	verticalSpeed=moveToward(verticalSpeed,movementSpeed*verticalDir,CAPDEACCELLTIME)
}*/

if(usingAltAttack)
{
	if(leftAttackKey&&stats.cooldown[3]<=0)
	{
		obj_menu.character[obj_menu.characterSelected].altLeftClick(id)
	}
}
else
{
	if(leftAttackKey&&stats.cooldown[0]<=0)
	{
		obj_menu.character[obj_menu.characterSelected].leftClick(id)
	}
}
if(rightAttackKey&&stats.cooldown[1]<=0)
{
	obj_menu.character[obj_menu.characterSelected].rightClick(id)
}
if(danielFireTimer<=0&&danielFireTimerPrev>0)
{
	obj_menu.daniel_right_click_release(id)
}
if(spaceKey&&stats.cooldown[2]<=0)
{
	obj_menu.character[obj_menu.characterSelected].space(id)
}

visibility=100
sound=100


image_speed=horizontalSpeed!=0||verticalSpeed!=0
image_index*=horizontalSpeed!=0||verticalSpeed!=0

var col=instance_place(x+horizontalSpeed,y,wall)
if col
{
	while(!place_meeting(x+sign(horizontalSpeed),y,wall))
	{
		x += sign(horizontalSpeed)
	}
	horizontalSpeed=0
}
x+=horizontalSpeed

//vcol
col=instance_place(x,y+verticalSpeed,wall)
if(col)
{
	while(!place_meeting(x,y+sign(verticalSpeed),wall))
	{
		y += sign(verticalSpeed)
	}
	verticalSpeed=0
}
y+=verticalSpeed