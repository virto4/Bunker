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
		array_push(cartas_davi, carta_monte)
		
		for (var i = 0; i < array_length(cartas_davi); i++) {
			variable_struct_set(cartas_davi[i], valor, 0)
		}
		for (var i = 0; i < array_length(cartas_davi); i++) { //verifica cartas do mesmo numero
			for (var j = i + 1; j < array_length(cartas_davi); j++) {
				if variable_struct_get(cartas_davi[j], numero) == variable_struct_get(cartas_davi[i], numero) and
				variable_struct_get(cartas_davi[j], naipe) != variable_struct_get(cartas_davi[i], naipe) {
					variable_struct_set(cartas_davi[i], valor, variable_struct_get(cartas_davi[i], valor) + 1)
					variable_struct_set(cartas_davi[j], valor, variable_struct_get(cartas_davi[j], valor) + 1)
				}
			}
		}
		for (var i = 0; i < array_length(cartas_davi); i++) { //verifica cartas do mesmo naipe em sequencia
			for (var j = i + 1; j < array_length(cartas_davi); j++) {
				if variable_struct_get(cartas_davi[j], naipe) == variable_struct_get(cartas_davi[i], naipe) {
					if abs(variable_struct_get(cartas_davi[j], numero) - variable_struct_get(cartas_davi[i], numero)) == 1 
							or abs(variable_struct_get(cartas_davi[j], numero) - variable_struct_get(cartas_davi[i], numero)) == 2 
							or abs(variable_struct_get(cartas_davi[j], numero) - variable_struct_get(cartas_davi[i], numero)) == 3 {
						variable_struct_set(cartas_davi[i], valor, variable_struct_get(cartas_davi[i], valor) + 1)
						variable_struct_set(cartas_davi[j], valor, variable_struct_get(cartas_davi[j], valor) + 1)
					}
				}
			}
		}
		for (var i = 0; i < array_length(cartas_davi) - 1; i++) {
			for (var j = 0; j < array_length(cartas_davi) - 1 - i; j++) {
				if variable_struct_get(cartas_davi[j], valor) > variable_struct_get(cartas_davi[j + 1], valor) {
					var aux = cartas_davi[j + 1]
					cartas_davi[j + 1] = cartas_davi[j]
					cartas_davi[j] = aux
				}
			}
		}
		
		for (var i = 0; i < array_length(cartas_davi); i++) {
			if cartas_davi[i] == carta_monte {
				if variable_struct_get(cartas_davi[i], valor) < 1 {
					array_delete(cartas_davi, i, 1)
					array_push(cartas_davi, cartas_comprar[0])
					array_delete(cartas_comprar, 0, 1)
					if !a {
						a = true
						timer = current_time / 1000 + 3
						msg = "Davi compra do monte"
					}
					if a and timer < current_time / 1000 {
						array_push(cartas_comprar, carta_monte) 
						carta_monte_passada = carta_monte
						carta_monte = cartas_davi[0]
						array_delete(cartas_davi, 0, 1)
						sua_vez = true
					}
				} else {
					var aux = carta_monte
					carta_monte = carta_monte_passada
					carta_monte_passada = aux
					if !a {
						a = true
						timer = current_time / 1000 + 3
						msg = "Davi compra da pilha de descarte"
					}
					if a and timer < current_time / 1000 {
						var index = 0
						if aux == cartas_davi[0] {
							index = 1
						}
						array_push(cartas_comprar, carta_monte_passada) 
						carta_monte_passada = carta_monte
						carta_monte = cartas_davi[index]
						array_delete(cartas_davi, index, 1)
						sua_vez = true
					}
				}
			}
		}
	}
}