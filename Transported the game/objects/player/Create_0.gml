/// @description Insert description here
// You can write your code in this editor
horizontalSpeed=0
verticalSpeed=0
movementSpeed=obj_menu.character[obj_menu.characterSelected].movementSpeed
drawDirection=1
holdAttackPower=0
danielFireTimer=0
usingAltAttack=false
swingTime=0
maxSwingTime=0
swingDamage=4
hitEnemy=false
playerIsDrawn=false

ACCELLTIME=movementSpeed/12
DEACCELLTIME=movementSpeed/5

function moveToward(from,to,by){
	
	if (abs(from-to) < by) {
		return to
	}
	
	if (from < to) {
		return from + by
	}
	
	return from - by
	
}