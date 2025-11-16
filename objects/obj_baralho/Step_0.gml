/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if point_in_rectangle(x, y, obj_personagem.x - 40, obj_personagem.y, obj_personagem.x + 40, obj_personagem.y + 90) and y < 320 {
	depth = obj_personagem.depth + 1
}
if instance_exists(obj_davi) and obj_personagem.ativada {
	if point_in_rectangle(x, y, obj_davi.x - 40, obj_davi.y, obj_davi.x + 40, obj_davi.y + 90) and y < 320 {
		depth = obj_davi.depth + 1
	}
}

if clicou and !jogou_hoje {
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
			if venceu {
				if instance_exists(obj_davi) {
					obj_davi.sao = true
					obj_davi.aumento_sanidade = 10
				}
				obj_personagem.sao = true
				obj_personagem.aumento_sanidade = 10
				jogou_hoje = true
			}
			clicou = false
			global.tem_tela_aberta = false
			sua_vez = true
			timer = 0
			a = false
			b = false
			c = false
			d = false
			timer2 = 0
			davi_monte = false
			davi_descarte = false
			carta_descarte = 0
			carta_aux = 0
			vermelho = []
			grupos_roger = []
			grupos_davi = []
			venceu = false
			carta_monte = 0
			carta_monte_passada = 0
			comprar = false
			descartar = false
			audio_stop_sound(snd_jazz)
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
	
	if !sua_vez and !venceu {
		if !c {
			array_push(cartas_davi, carta_monte)
			c = true
		}
		
		for (var i = 0; i < array_length(cartas_davi); i++) {
			cartas_davi[i][2] = 0
		}
		for (var i = 0; i < array_length(cartas_davi); i++) { //verifica cartas do mesmo numero
			for (var j = i + 1; j < array_length(cartas_davi); j++) {
				if cartas_davi[j][0] == cartas_davi[i][0] and cartas_davi[j][1] != cartas_davi[i][1] {
					cartas_davi[i][2] += 1
					cartas_davi[j][2] += 1
				}
				for (var k = j + 1; k < array_length(cartas_davi) and (davi_descarte or davi_monte); k++) {
					if cartas_davi[j][0] == cartas_davi[i][0] and cartas_davi[j][0] == cartas_davi[k][0]
						and cartas_davi[j][1] != cartas_davi[i][1] and cartas_davi[j][1] != cartas_davi[k][1] and cartas_davi[k][1] != cartas_davi[i][1]  {
							array_push(grupos_davi, [cartas_davi[j], cartas_davi[i], cartas_davi[k]])
							eliminar([i, j, k])
					}
				}
			}
		}
		var n = 0
		for (var i = 0; i < array_length(cartas_davi); i++) { //verifica cartas do mesmo naipe em sequencia
			for (var j = i + 1; j < array_length(cartas_davi); j++) {
				if string(cartas_davi[j][1]) == string(cartas_davi[i][1]) {
					if abs(cartas_davi[j][0] - cartas_davi[i][0]) == 1 or abs(cartas_davi[j][0] - cartas_davi[i][0]) == 2 {
						cartas_davi[i][2] += 1
						cartas_davi[j][2] += 1
					}
				}
				for (var k = j + 1; k < array_length(cartas_davi) and (davi_descarte or davi_monte); k++) {
					if string(cartas_davi[j][1]) == string(cartas_davi[i][1]) and string(cartas_davi[j][1]) == string(cartas_davi[k][1]) and string(cartas_davi[k][1]) == string(cartas_davi[i][1]) {
						var trinca = ordenar([cartas_davi[j], cartas_davi[i], cartas_davi[k]])
						if trinca[0][0] == 1 and trinca[1][0] == 12 and trinca[2][0] == 13 {
							array_push(grupos_davi, [trinca[1], trinca[2], trinca[0]])
							eliminar([i, j, k])
						}
						if trinca[1][0] - trinca[0][0] == 1 and trinca[2][0] - trinca[1][0] == 1 {
							array_push(grupos_davi, trinca)
							eliminar([i, j, k])
						}
					}
				}
			}
		}
		for (var i = 0; i < array_length(cartas_davi) - 1; i++) { // ordena as carta em ordem crescente de valor
			for (var j = 0; j < array_length(cartas_davi) - 1 - i; j++) {
				if cartas_davi[j][2] > cartas_davi[j + 1][2] {
					var aux = cartas_davi[j + 1]
					cartas_davi[j + 1] = cartas_davi[j]
					cartas_davi[j] = aux
				}
			}
		}
		
		if !d {
			d = true
			timer2 = current_time / 1000 + 2
		}
		
		for (var i = 0; i < array_length(cartas_davi) and d and timer2 < current_time / 1000; i++) {
			if cartas_davi[i] == carta_monte {
				if cartas_davi[i][2] < 1 {
					davi_monte = true
					carta_descarte = i
				} else {
					davi_descarte = true
				}
			}
		}
		if davi_descarte {
			if !b {
				carta_aux = carta_monte
				carta_monte = carta_monte_passada
				carta_monte_passada = carta_aux
				b = true
			}
			if !a {
				a = true
				timer = current_time / 1000 + 3
				msg = "Davi compra da pilha de descarte"
			}
			if a and timer < current_time / 1000 {
				var index = 0
				if carta_aux == cartas_davi[0] {
					index = 1
				}
				array_push(cartas_comprar, carta_monte_passada) 
				carta_monte_passada = carta_monte
				carta_monte = cartas_davi[index]
				array_delete(cartas_davi, index, 1)
				sua_vez = true
				a = false
				b = false
				c = false
				d = false
				davi_descarte = false
			}
		} else if davi_monte {
			if !b {
				array_delete(cartas_davi, carta_descarte, 1)
				array_push(cartas_davi, cartas_comprar[0])
				array_delete(cartas_comprar, 0, 1)
				b = true
			}
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
				a = false
				b = false
				c = false
				d = false
				davi_monte = false
			}
		}
	}
}