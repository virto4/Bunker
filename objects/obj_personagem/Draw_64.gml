
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

function escrever(_x, _y, _texto, _cores) { //cores é um vetro de struct assim: {pos: 0, cor: c_green}. passar na ordem por posicao
	var x_atual = _x
	for (var i = 0; i < array_length(_cores); i++) {
		var inicio = _cores[i].pos
		var fim = (i < array_length(_cores) - 1) ? _cores[i + 1].pos : string_length(_texto) + 1 //se essa não for a ultima interação, o final é o inicio da proxima cor. se for, o final é o fim do proprio texto
		draw_set_color(_cores[i].cor)
		draw_set_font(fnt_dialogos)
		draw_text(x_atual, _y, string_copy(_texto, inicio, fim - inicio))
		x_atual += string_width(string_copy(_texto, inicio, fim - inicio))
	}
}

if alimento or remedio {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, alimento_scale, alimento_scale, 0, c_white, 1)
	if alimento_scale < 5 {
		alimento_scale += 0.5
	} else if alimento_scale >= 5 {
		var nome = variable_struct_get(global.nomes, object_get_name(obj_personagem.item_selecionado))
		var largura = string_length(nome)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(220, 800, "Você deseja dar a Roger " + nome + " ?")
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		if mouse_sim {
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		}
		draw_text(300, 940, "Sim")
		if mouse_nao {
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		}
		draw_text(1620, 940, "Não")
	}
}