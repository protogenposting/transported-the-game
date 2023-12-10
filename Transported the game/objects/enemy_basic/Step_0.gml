
function player_in_sight(playerDetectRange){
	return distance_to_object(player)<playerDetectRange&&!collision_line(x,y,player.x,player.y,wall,true,true)
}

var playerDetectRange=(360*player.visibility/100)+player.sound

if(player_in_sight(playerDetectRange))
{
	isChasingPlayer=true
}
chaseTime--
speed=0
if(isChasingPlayer)
{
	chaseTime=60
}
if(chaseTime>0&&isChasingPlayer)
{
	speed=3
	direction=point_direction(x,y,player.x,player.y)
	if(!player_in_sight(playerDetectRange))
	{
		isChasingPlayer=false
	}
}
else if(chaseTime<=0)
{
	speed=1
	direction=point_direction(x,y,targetPos[0],targetPos[1])
	if(distance_to_point(targetPos[0],targetPos[1])<=speed)
	{
		targetPos[0]=x+irandom_range(-128,128)
		targetPos[1]=y+irandom_range(-128,128)
		while(collision_line(x,y,targetPos[0],targetPos[1],wall,true,true))
		{
			targetPos[0]=x+irandom_range(-64,64)
			targetPos[1]=y+irandom_range(-64,64)
		}
	}
}
image_speed=speed!=0

horizontalSpeed=hspeed
hspeed=0
verticalSpeed=vspeed
vspeed=0

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