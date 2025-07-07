/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if alpha == 0 {
	draw_set_color(c_white)
	if room_get_name(room) == "rm_casa" {
		draw_set_font(fnt_principal)
		draw_text(room_width / 2, 60, tempo_escrito div 1 + 1)//div é o comando para divisap inteira
	}
}
draw_sprite_ext(spr_hotbar, 0, 960, 1020, 3, 3, 0, c_white, 1)

var _slotx1=768
var _slotx2=864
var _slotx3=960
var _slotx4=1056
var _slotx5=1152

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
	var width = sprite_get_width(object_get_sprite(slot1))
	var heigth = sprite_get_height(object_get_sprite(slot1))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	draw_sprite_ext(object_get_sprite(slot1), 0, _slotx1, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
}
if slot2 != noone {
	var width = sprite_get_width(object_get_sprite(slot2))
	var heigth = sprite_get_height(object_get_sprite(slot2))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	draw_sprite_ext(object_get_sprite(slot2), 0, _slotx2, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
}
if slot3 != noone {
	var width = sprite_get_width(object_get_sprite(slot3))
	var heigth = sprite_get_height(object_get_sprite(slot3))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	draw_sprite_ext(object_get_sprite(slot3), 0, _slotx3, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
}
if slot4 != noone {
	var width = sprite_get_width(object_get_sprite(slot4))
	var heigth = sprite_get_height(object_get_sprite(slot4))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	draw_sprite_ext(object_get_sprite(slot4), 0, _slotx4, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
}
if slot5 != noone {
	var width = sprite_get_width(object_get_sprite(slot5))
	var heigth = sprite_get_height(object_get_sprite(slot5))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	draw_sprite_ext(object_get_sprite(slot5), 0, _slotx5, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
}

if alpha > 0 {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha)
	alpha -= 0.05
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