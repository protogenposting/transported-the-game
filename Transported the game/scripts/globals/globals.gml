// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.maxSprites=0
var i=0
repeat(1000)
{
	if(sprite_exists(i))
	{
		global.maxSprites++
	}
	else
	{
		break;
	}
	i++
}

global.jumpbutton="Space or Z"
if(gamepad_is_connected(0))
{
	
	global.jumpbutton="A"
}
global.dashbutton="Shift or X"
if(gamepad_is_connected(0))
{
	
	global.dashbutton="X"
}
global.spinbutton="C or Enter"
if(gamepad_is_connected(0))
{
	
	global.spinbutton="Right Shoulder"
}

global.particleSystems=[]
global.particleLimit=300
global.particleHardCap=false