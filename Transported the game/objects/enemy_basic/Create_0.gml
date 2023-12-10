/// @description Insert description here
// You can write your code in this editor
healthPoints=10
maxHealthPoints=10
damage=1
function hit_player(obj){
	stats.healthPoints-=damage
	stats.immunityFrames=60
}

isChasingPlayer=false
horizontalSpeed=0
verticalSpeed=0
drawDirection=1
chaseTime=0

targetPos=[x,y]