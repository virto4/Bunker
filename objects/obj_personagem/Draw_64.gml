if alpha == 0 {
	draw_set_color(c_white)
	if room_get_name(room) == "rm_casa" {
		draw_set_font(fnt_alagard)
		draw_text(room_width / 2, 60, tempo_escrito div 1 + 1)//div é o comando para divisap inteira
	}
}
draw_sprite_ext(spr_hotbar, 0, 960, 1020, 3, 3, 0, c_white, 1)

var _slotx1=768
var _slotx2=864
var _slotx3=960
var _slotx4=1056
var _slotx5=1152

function desenhar_hotbar(slot, slot_novo, slotx) {
	var width = sprite_get_width(object_get_sprite(slot))
	var heigth = sprite_get_height(object_get_sprite(slot))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	if !slot_novo {
		draw_sprite_ext(object_get_sprite(slot), 0, slotx, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
	} else {
		draw_sprite_ext(object_get_sprite(slot), 0, slotx, 1020, 64 / maior, 64 / maior, 0, c_black, 1)
	}
}

switch (slot_selecionado) {
	case 1:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx1, 1020, 3, 3, 0, c_white, 1)	
		break
	case 2:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx2, 1020, 3, 3, 0, c_white, 1)
		break
	case 3:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx3, 1020, 3, 3, 0, c_white, 1)
		break
	case 4:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx4, 1020, 3, 3, 0, c_white, 1)
		break
	case 5:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx5, 1020, 3, 3, 0, c_white, 1)
		break
}

if slot1 != noone {
	desenhar_hotbar(slot1, slot1_novo, _slotx1)
}
if slot2 != noone {
	desenhar_hotbar(slot2, slot2_novo, _slotx2)
}
if slot3 != noone {
	desenhar_hotbar(slot3, slot3_novo, _slotx3)
}
if slot4 != noone {
	desenhar_hotbar(slot4, slot4_novo, _slotx4)
}
if slot5 != noone {
	desenhar_hotbar(slot5, slot5_novo, _slotx5)
}

if alpha > 0 {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha)
	alpha -= 0.05
} 

if mudar_bunker and room == rm_casa{
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha2)
	alpha2 += 0.1 
} else if mudar_bunker and room == rm_bunker {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha2)
	alpha2 -= 0.1 
} else if mudar_bunker and room == rm_bunker and alpha2 == 0 {
	mudar_bunker = false
	global.tem_tela_aberta = false
}

if opcoes {
	cursor_sprite = spr_cursor_padrao
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 0.4)
	draw_sprite(spr_tela_opcoes_jogo, 0, 1920 / 2, 1080 / 2)
	draw_rectangle_color(960 - 160, 540 - 5, 960 + 160, 540 + 5, c_black, c_black, c_black, c_black, false)
	draw_sprite(spr_sair_tela_inicial, 0, 960, 540 - 150)
	if mudar_volume {
		if display_mouse_get_x() * 1920 / 1366 > 960 + 160 {
			volume_x = 960 + 160
		} else if display_mouse_get_x() * 1920 / 1366 < 960 - 160 {
			volume_x = 960 - 160
		} else {
			volume_x = display_mouse_get_x() * 1920 / 1366
		}
	}
	draw_circle_color(volume_x, 540, 20, c_black, c_black, false)
	
	draw_rectangle_color(960 - 160, 700 - 5, 960 + 160, 700 + 5, c_black, c_black, c_black, c_black, false)
	if mudar_fov {
		if display_mouse_get_x() * 1920 / 1366 > 960 + 160 {
			fov_x = 960 + 160
		} else if display_mouse_get_x() * 1920 / 1366 < 960 - 160 {
			fov_x = 960 - 160
		} else {
			fov_x = display_mouse_get_x() * 1920 / 1366
		}
	}
	draw_circle_color(fov_x, 700, 20, c_black, c_black, false)
}