/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if y < obj_personagem.y + 86 and y > obj_personagem.y - 5 {
	depth = obj_personagem.depth + 1
} else if instance_exists(obj_davi) {
	if y < obj_davi.y + 86 and y > obj_davi.y - 5 {
		depth = obj_personagem.depth + 1
	}
}

if clicou {
	global.tem_tela_aberta = true
	
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair &&
		my > ty_sair - height_sair && my < ty_sair + height_sair {
			clicou = false
			global.tem_tela_aberta = false
			sua_vez = false
		}
	}
	if comecou {
		comecou = false
		embaralhar(cartas)
		cartas_davi = []
		cartas_roger = []
		cartas_comprar = []
		for (var i = 0; i < array_length(cartas); i++) {
			if i < 9 {
				array_push(cartas_roger, cartas[i])
			} else if i < 18 {
				array_push(cartas_davi, cartas[i])
			} else {
				array_push(cartas_comprar, cartas[i])
			}
		}
	}
	
	if !sua_vez {
		
	}
}