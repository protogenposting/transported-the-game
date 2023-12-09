// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_character(name,sprite,weaponSprite,healthPoints,movementSpeed,description,leftClick,rightClick,altLeftClick,space){
	var character={}
	character.name=name
	character.sprite=sprite
	character.healthPoints=healthPoints
	character.weaponSprite=weaponSprite
	character.movementSpeed=movementSpeed
	character.description=description
	character.leftClick=leftClick
	character.rightClick=rightClick
	character.altLeftClick=altLeftClick
	character.space=space
	return character
}