/// @description Insert description here
// You can write your code in this editor
draw_rectangle_color(0,0,360*(healthPoints/maxHealthPoints),64,c_red,c_red,c_red,c_red,false)
var ecs=0
var why=64
for(var i=0;i<array_length(cooldown);i++)
{
	if(cooldown[i]>0)
	{
		draw_rectangle(ecs,why,ecs+64,why+64*(cooldown[i]/cooldownMax[i]),false)
	}
	ecs+=96
}
why+=64