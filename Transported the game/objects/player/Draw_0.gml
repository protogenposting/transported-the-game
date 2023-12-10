/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index,image_index,x,y,drawDirection,1,0,c_white,playerIsDrawn)
if(holdAttackPower>0)
{
	draw_rectangle(x-64*drawDirection,bbox_bottom-holdAttackPower*32,x-96*drawDirection,bbox_bottom,false)
}
playerIsDrawn=!playerIsDrawn
if(stats.immunityFrames<=0)
{
	playerIsDrawn=true
}
if(swingTime>0)
{
	draw_sprite_ext(obj_menu.character[obj_menu.characterSelected].weaponSprite,image_index,x,y,drawDirection,1,90*-drawDirection+((swingTime/maxSwingTime)*90*drawDirection),c_white,1)
	var moveDirection=point_direction(x,y,mouse_x,mouse_y)
	var col=collision_circle(x+lengthdir_x(32,moveDirection),y+lengthdir_y(32,moveDirection),32,par_enemy,true,true)
	if(col&&!hitEnemy)
	{
		col.healthPoints-=swingDamage
		var _inst=instance_create_depth(col.x,col.y,col.depth-1,damage_indicator)
		_inst.text=string(swingDamage)
		hitEnemy=true
	}
}