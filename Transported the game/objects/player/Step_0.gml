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
leftAttackKey=mouse_check_button(mb_left)
rightAttackKey=mouse_check_button(mb_right)
rightAttackKeyPressed=mouse_check_button_pressed(mb_right)
if(mouse_wheel_down()||mouse_wheel_up())
{
	usingAltAttack=!usingAltAttack
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

if(leftAttackKey&&stats.cooldown[0]<=0)
{
	obj_menu.character[obj_menu.characterSelected].leftClick(id)
}
if(rightAttackKey&&stats.cooldown[1]<=0)
{
	obj_menu.character[obj_menu.characterSelected].rightClick(id)
}
if(danielFireTimer<=0&&danielFireTimerPrev>0)
{
	obj_menu.daniel_right_click_release(id)
}

image_speed=horizontalSpeed!=0
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