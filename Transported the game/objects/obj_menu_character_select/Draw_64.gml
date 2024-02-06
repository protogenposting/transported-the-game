/// @description Insert description here
// You can write your code in this editor

draw_sprite(obj_menu.character[obj_menu.characterSelected].sprite,image_index,1024,256)
draw_sprite(obj_menu.character[obj_menu.characterSelected].weaponSprite,image_index,1024,256)
buttonSelected+=gamepad_button_check_pressed(0,gp_padd)-gamepad_button_check_pressed(0,gp_padu)
if(buttonSelected<0)
{
	buttonSelected=0
}
if(buttonSelected>array_length(button)-1)
{
	buttonSelected=array_length(button)-1
}
//draw_sprite_ext(spr_logo,0,room_width/4,126,logoSize,logoSize,0,c_white,1)
draw_set_halign(fa_center)
for(var i=0;i<array_length(button);i++)
{
	var posx=button[i].position[0]
	var posy=button[i].position[1]
	var sizex=button[i].size[0]
	var sizey=button[i].size[1]
	var size=0
	var selected=point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),posx-sizex/2,posy-sizey/2,posx+sizex/2,posy+sizey/2)||gamepad_is_connected(0)&&buttonSelected==i
	if(button[i].type=="button")
	{
		if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),posx-sizex/2,posy-sizey/2,posx+sizex/2,posy+sizey/2)||gamepad_is_connected(0)&&buttonSelected==i)
		{
			size=5
			if(mouse_check_button_pressed(mb_left)||gamepad_button_check_pressed(0,gp_face1))
			{
				button[i].func()
			}
		}
	}
	if(button[i].type=="slider")
	{
		var variableCopy = 0
		if(button[i].variable[0]=="global")
		{
			variableCopy = variable_global_get(button[i].variable[1])
		}
		draw_rectangle(posx-sizex/2,posy-sizey/2,posx-sizex/2+(variableCopy/button[i].variable[3])*sizex,posy+sizey/2,false)
		if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),posx-sizex/2,posy-sizey/2,posx+sizex/2,posy+sizey/2)||gamepad_is_connected(0)&&buttonSelected==i)
		{
			size=5
			if(mouse_check_button(mb_left))
			{
				variable_global_set(button[i].variable[1],((device_mouse_x_to_gui(0)-(posx-sizex/2))/sizex) *button[i].variable[3])
			}
			if(gamepad_button_check(0,gp_padl))
			{
				if(variable_global_get(button[i].variable[1])>0)
				{
					variable_global_set(button[i].variable[1],variable_global_get(button[i].variable[1])-1)
				}
			}
			if(gamepad_button_check(0,gp_padr))
			{
				if(variable_global_get(button[i].variable[1])<button[i].variable[3])
				{
					variable_global_set(button[i].variable[1],variable_global_get(button[i].variable[1])+1)
				}
			}
			button[i].func()
		}
		if(variable_global_get(button[i].variable[1])>button[i].variable[3])
		{
			variable_global_set(button[i].variable[1],button[i].variable[3])
		}
		if(variable_global_get(button[i].variable[1])<button[i].variable[2])
		{
			variable_global_set(button[i].variable[1],button[i].variable[2])
		}
		draw_text_color(posx,posy-5,button[i].name,c_black,c_black,c_black,c_black,1)
	}
	sizex+=size
	sizey+=size
	draw_rectangle(posx-sizex/2,posy-sizey/2,posx+sizex/2,posy+sizey/2,true)
	draw_text(posx,posy-5,button[i].name)
	if(selected)
	{
		if(variable_struct_exists(button[i],"description"))
		{
			draw_text_ext(room_width-512,room_height-256,button[i].description,16,512)
		}
	}
}
