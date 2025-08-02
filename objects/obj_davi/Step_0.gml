/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// No evento Step ou Draw do personagem
function acerto_de_contas(slot) {
	variable_struct_set(obj_personagem.qtde_itens1, object_get_name(slot), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(slot)) - 1)
	return noone
}

if (mouse_check_button_pressed(mb_left) and !global.tem_tela_aberta) {
    if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
		var is_alimento = false
		for (var i = 0; i < array_length(global.alimentos_consumiveis); i++) {
			if global.alimentos_consumiveis[i] == obj_personagem.item_selecionado {
				is_alimento = true
			}
		}

		if is_alimento {
			alimento = true
			global.tem_tela_aberta = true
		}
    }
}

if alimento and room == rm_bunker {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			atributos.fome += variable_struct_get(global.fome, object_get_name(obj_personagem.item_selecionado))
			if atributos.fome > 100 {
				aumento_fome = variable_struct_get(global.fome, object_get_name(obj_personagem.item_selecionado)) - (atributos.fome - 100)
				atributos.fome = 100
			} else {
				aumento_fome = variable_struct_get(global.fome, obj_personagem.item_selecionado)
			}
			if obj_personagem.slot_selecionado == 1 {
				obj_personagem.slot1 = acerto_de_contas(obj_personagem.slot1)
			} else if obj_personagem.slot_selecionado == 2 {
				obj_personagem.slot2 = acerto_de_contas(obj_personagem.slot2)
			} else if obj_personagem.slot_selecionado == 3 {
				obj_personagem.slot3 = acerto_de_contas(obj_personagem.slot3)
			} else if obj_personagem.slot_selecionado == 4 {
				obj_personagem.slot4 = acerto_de_contas(obj_personagem.slot4)
			} else {
				obj_personagem.slot5= acerto_de_contas(obj_personagem.slot5)
			}
			alimentou = true
			alimento = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			alimento = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}