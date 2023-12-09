//Button Code

if(room==rm_menu)
{
	if(!showingAcheivments)
	{
		buttonSelected+=gamepad_button_check_pressed(0,gp_padd)-gamepad_button_check_pressed(0,gp_padu)
		if(buttonSelected<0)
		{
			buttonSelected=0
		}
		if(buttonSelected>array_length(button)-1)
		{
			buttonSelected=array_length(button)-1
		}
	}
	else
	{
		acheivmentSelected+=gamepad_button_check_pressed(0,gp_padd)-gamepad_button_check_pressed(0,gp_padu)
		if(acheivmentSelected<0)
		{
			acheivmentSelected=0
		}
		if(acheivmentSelected>array_length(acheivment)-2)
		{
			acheivmentSelected=array_length(acheivment)-2
		}
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
		if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),posx-sizex/2,posy-sizey/2,posx+sizex/2,posy+sizey/2)||gamepad_is_connected(0)&&buttonSelected==i)
		{
			size=5
			if(mouse_check_button_pressed(mb_left)||gamepad_button_check_pressed(0,gp_face1))
			{
				button[i].func()
			}
		}
		sizex+=size
		sizey+=size
		draw_rectangle(posx-sizex/2,posy-sizey/2,posx+sizex/2,posy+sizey/2,true)
		draw_text(posx,posy-5,button[i].name)
	}

	if(showingAcheivments)
	{
		var ecs=512
		var why=256
		for(var i=acheivmentSelected;i<array_length(acheivment);i++)
		{
			var color=c_white
			if(!acheivment[i].unlocked)
			{
				color=c_red
			}
			draw_rectangle(ecs,why,room_width,why+128,true)
			draw_sprite_ext(acheivment[i].sprite,0,ecs,why,1,1,0,color,1)
			draw_set_halign(fa_left)
			draw_text_ext(ecs+64,why,acheivment[i].name,16,room_width-ecs)
			draw_text_ext(ecs,why+64,acheivment[i].description,16,room_width-ecs)
			draw_set_halign(fa_center)
			why+=128
		}
	}
}