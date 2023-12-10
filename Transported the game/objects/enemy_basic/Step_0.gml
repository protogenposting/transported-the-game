/// @description Insert description here
// You can write your code in this editor
function player_in_sight(playerDetectRange){
	return distance_to_object(player)<playerDetectRange&&!collision_line(x,y,player.x,player.y,wall,true,true)
}
var playerDetectRange=(360*player.visibility)+player.sound

if(player_in_sight(playerDetectRange))
{
	
}