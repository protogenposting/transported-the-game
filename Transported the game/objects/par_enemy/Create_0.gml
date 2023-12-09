/// @description Insert description here
// You can write your code in this editor
healthPoints=10
maxHealthPoints=10
damage=1
function hit_player(obj){
	stats.healthPoints-=damage
	stats.immunityFrames=60
	
}