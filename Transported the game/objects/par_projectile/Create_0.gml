/// @description Insert description here
// You can write your code in this editor
damage=1

function hit_enemy(obj){
	obj.healthPoints-=damage
	instance_destroy()
}