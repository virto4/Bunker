/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// No evento Step ou Draw do personagem

if mudou_humor {
	if atributos.humor == "COLÉRICO" {
		atributos.forca += 20  
		atributos.resistencia -= 20
		atributos.sagacidade -= 20
		atributos.fortuna -= 20
	} else if atributos.humor == "APAVORADO" {
		atributos.forca += 20
		atributos.resistencia -= 20
		atributos.sagacidade += 20
		atributos.fortuna -= 20
	} else if atributos.humor == "DEPRIMIDO" {
		atributos.forca -= 20
		atributos.resistencia += 20
		atributos.sagacidade -= 20
		atributos.fortuna -= 20 
	} else if atributos.humor == "EXTASIADO" {
		atributos.forca += 20
		atributos.resistencia += 20
		atributos.sagacidade -= 20
		atributos.fortuna += 20
	}
	atributos.forca = (atributos.forca > 100) ? 100 : atributos.forca
	atributos.resistencia = (atributos.resistencia > 100) ? 100 : atributos.resistencia 
	atributos.fortuna = (atributos.fortuna > 100) ? 100 : atributos.fortuna
	atributos.sagacidade = (atributos.sagacidade > 100) ? 100 : atributos.sagacidade

	atributos.forca = (atributos.forca < 0) ? 0 : atributos.forca
	atributos.resistencia = (atributos.resistencia < 0) ? 0 : atributos.resistencia
	atributos.fortuna = (atributos.fortuna < 0) ? 0 : atributos.fortuna
	atributos.sagacidade = (atributos.sagacidade < 0) ? 0 : atributos.sagacidade
	
	mudou_humor = false
}

depth = -y
function andar(direcao) {
	switch direcao {
		case "cima":
			y -= 30 * delta_time / 1000000
			if image_xscale == -1 {
				image_xscale = 1
			}
			break
		case "baixo":
			y += 30 * delta_time / 1000000
			if image_xscale == -1 {
				image_xscale = 1
			}
			break
		case "esquerda":
			x -= 30 * delta_time / 1000000
			image_xscale = -1
			break
		case "direita":
			x += 30 * delta_time / 1000000
			if image_xscale == -1 {
				image_xscale = 1
			}
			break
	}
}

function acerto_de_contas(slot) {
	variable_struct_set(obj_personagem.qtde_itens1, object_get_name(slot), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(slot)) - 1)
	return noone
}

if !global.tem_tela_aberta and room == rm_bunker {
	if obj_diario.dia != dia_bunker {
		comecou_dia = true
		dia_bunker = obj_diario.dia
		terminou = 0
		}
	switch obj_diario.dia % 5 {
		case 0:
			if comecou_dia {
				comecou_dia = false
				x = 1121
				y = 354
			}
			if terminou == 0 {
				if frames == 0 {
					frames = 1
					tempo = current_time / 1000 + 30
				}
				if current_time / 1000 >= tempo {
					terminou = 1
					frames = 0
				}
			} else if terminou == 1 {
				andar("esquerda")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x <= ipsilon - 871 {
					frames = 0
					terminou = 2
				}
			} else if terminou == 2 {
				if frames == 0 {
					frames = 1
					tempo = current_time / 1000 + 30
				}
				if current_time / 1000 >= tempo {
					terminou = 3
					frames = 0
				}
			} else if terminou == 3 {
				andar("direita")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x >= ipsilon + 871 {
					frames = 0
					terminou = 0
				}
			}
			break
		case 1:
			if comecou_dia {
				comecou_dia = false
				x = 250
				y = 270
			}
			if terminou == 0 {
				if frames == 0 {
					frames = 1
					tempo = current_time / 1000 + 20
				}
				if current_time / 1000 >= tempo {
					terminou = 1
					frames = 0
				}
			} else if terminou == 1 {
				andar("baixo")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y >= 50 + ipsilon {
					frames = 0
					terminou = 2
				}
			} else if terminou == 2 {
				if frames == 0 {
					frames = 1
					tempo = current_time / 1000 + 20
				}
				if current_time / 1000 >= tempo {
					terminou = 3
					frames = 0
				}
			} else if terminou == 3 {
				andar("direita")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x >= ipsilon + 90 {
					frames = 0
					terminou = 4
				}
			} else if terminou == 4 {
				if frames == 0 {
					frames = 1
					tempo = current_time / 1000 + 20
				}
				if current_time / 1000 >= tempo {
					terminou = 5
					frames = 0
				}
			} else if terminou == 5 {
				andar("baixo")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y >= 140 + ipsilon {
					frames = 0
					terminou = 6
				}
			} else if terminou == 6 {
				andar("direita")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x >= ipsilon + 100 {
					frames = 0
					terminou = 7
				}
			} else if terminou == 7 {
				andar("baixo")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y >= 110 + ipsilon {
					frames = 0
					terminou = 8
				}
			} else if terminou == 8 {
				andar("direita")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x >= ipsilon + 270 {
					frames = 0
					terminou = 9
				}
			} else if terminou == 9 {
				andar("cima")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y <= ipsilon - 100 {
					frames = 0
					terminou = 4
				}
			} else if terminou == 10 {
				//fica parado o resto
			}
			break
		case 2:
			//só dorme
			break
		case 3:
			if comecou_dia {
				comecou_dia = false
				x = 1021 + 179
				y = 350
				terminou = 0
			}
			if terminou == 0 {
				andar("direita")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x >= ipsilon + 179 {
					frames = 0
					terminou = 1
				}
			} else if terminou == 1 {
				andar("baixo")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y >= 179 + ipsilon {
					frames = 0
					terminou = 2
				}
			} else if terminou == 2 {
				andar("esquerda")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x <= -179 + ipsilon {
					frames = 0
					terminou = 3
				}
			} else if terminou == 3 {
				andar("cima")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y <= -179 + ipsilon {
					frames = 0
					terminou = 0
				}
			}
			break
		case 4:
			if comecou_dia {
				comecou_dia = false
				x = 1021 + 179
				y = 350
				terminou = 0
			}
			if terminou == 0 {
				andar("baixo")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y >= 150 + ipsilon {
					frames = 0
					terminou = 1
				}
			} else if terminou == 1 {
				andar("esquerda")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x <= -425 + ipsilon {
					frames = 0
					terminou = 2
				}
			} else if terminou == 2 {
				if frames == 0 {
					frames = 1
					tempo = current_time / 1000 + 20
				}
				if current_time / 1000 >= tempo {
					terminou = 3
					frames = 0
				}
			} else if terminou == 3 {
				andar("baixo")
				if frames == 0 {
					ipsilon = y
					frames = 1
				}
				if y >= 100 + ipsilon {
					frames = 0
					terminou = 4
				}
			} else if terminou == 4 {
				andar("esquerda")
				if frames == 0 {
					ipsilon = x
					frames = 1
				}
				if x <= -445 + ipsilon {
					frames = 0
					terminou = 5
				}
			} else if terminou == 5 {
				//fica parado ou dorme
			}
	}
}

if mouse_check_button_pressed(mb_left) and !global.tem_tela_aberta and room == rm_casa and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 100 {
	if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
		switch obj_personagem.slot_selecionado {
			case 1:
				obj_personagem.slot1 = global.coletar_destruir(object_index, obj_personagem.item_selecionado)
				break
			case 2:
				obj_personagem.slot2 = global.coletar_destruir(object_index, obj_personagem.item_selecionado)
				break
			case 3:
				obj_personagem.slot3 = global.coletar_destruir(object_index, obj_personagem.item_selecionado)
				break
			case 4:
				obj_personagem.slot4 = global.coletar_destruir(object_index, obj_personagem.item_selecionado)
				break
			case 5:
				obj_personagem.slot5 = global.coletar_destruir(object_index, obj_personagem.item_selecionado)
				break
		}
	}
}

if (mouse_check_button_pressed(mb_left) and !global.tem_tela_aberta and room == rm_bunker) {
    if (point_in_rectangle(mouse_x, mouse_y, x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2)) {
		var is_alimento = false
		for (var i = 0; i < array_length(global.alimentos_consumiveis); i++) {
			if global.alimentos_consumiveis[i] == obj_personagem.item_selecionado {
				is_alimento = true
			}
		}

		var is_remedio = false
		for (var i = 0; i < array_length(global.remedios); i++) {
			if global.remedios[i] == obj_personagem.item_selecionado {
				is_remedio = true
			}
		}
		
		if is_alimento {
			alimento = true
			global.tem_tela_aberta = true
		}
		if is_remedio {
			remedio = true
			global.tem_tela_aberta = true
		}
    }
}

if remedio and room == rm_bunker {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
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
			tomou_remedio = true
			remedio = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			remedio = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
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
			remedio = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}