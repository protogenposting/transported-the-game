/// @description Insert description here
// You can write your code in this editor
if(stats.immunityFrames<=0)
{
	var _inst=instance_create_depth(x,y,depth,damage_indicator)
	_inst.text=string(other.damage)
	other.hit_player(id)
}