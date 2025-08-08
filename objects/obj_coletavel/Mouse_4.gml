/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/*if room == rm_bunker and !pressionou and !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 100 {
	pressionou = true
	global.tem_tela_aberta = true
}*/
var nao = false
if instance_exists(obj_ferramentas) {
	if object_index == obj_ferramentas and room == rm_bunker and !obj_ferramentas.pressionou and !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 100 {
		nao = true
		obj_ferramentas.pressionou = true
		global.tem_tela_aberta = true
		global.tela_hotbar = true
	}
}

if room == rm_bunker and (object_index == obj_meredith or object_index == obj_davi or object_index == obj_radio) {
	nao = true
}

if object_index == obj_radio and obj_radio.programacao != noone{
	obj_radio.clicou = true
}

if !global.tem_tela_aberta and !nao {
	function mudar_slot_vazio() { //muda para o slot vazio
		for (var _i = 1; _i <= 5; _i++) {
			obj_personagem.slot_selecionado--
			if obj_personagem.slot_selecionado < 1 {
				obj_personagem.slot_selecionado = 5
			}
			if obj_personagem.slot_selecionado == 1 and obj_personagem.slot1 == noone {
				break
			} else if obj_personagem.slot_selecionado == 2 and obj_personagem.slot2 == noone {
				break
			} else if obj_personagem.slot_selecionado == 3 and obj_personagem.slot3 == noone {
				break
			} else if obj_personagem.slot_selecionado == 4 and obj_personagem.slot4 == noone {
				break
			} else if obj_personagem.slot_selecionado == 5 and obj_personagem.slot5 == noone {
				break
			}
		}
	}

	function coletar_destruir(slot) {
		obj_personagem.slots_disponiveis = false
		var qtde_slots = 0
		if obj_personagem.slot1 == noone {
			qtde_slots++
		}
		if obj_personagem.slot2 == noone {
			qtde_slots++
		}
		if obj_personagem.slot3 == noone {
			qtde_slots++
		}
		if obj_personagem.slot4 == noone {
			qtde_slots++
		}
		if obj_personagem.slot5 == noone {
			qtde_slots++
		}
		var nomes = struct_get_names(global.qtde_slots)
		var object = ""
		for (var i = 0; i < array_length(nomes); i++) {
			if nomes[i] == object_get_name(object_index) {
				object = nomes[i]
			}
		}
		if qtde_slots >= variable_struct_get(global.qtde_slots, object) {
			obj_personagem.slots_disponiveis = true
		} else {
			ds_list_add(global.lista_ganhos, {sprite: spr_aviso, tempo: 0, alpha: 0})
			obj_conquistas.ganhou_conquista = true
		}
		if obj_personagem.slots_disponiveis {
			if room_get_name(room) == "rm_casa" {
				for (var _j = 0; _j < array_length(obj_personagem.itens_nao_consumiveis); _j++) {
					if object_index == obj_personagem.itens_nao_consumiveis[_j] {
						instance_destroy()
					}
				}
			} else {
				object_index.qtde_itens-- //vai diminuindo a contagem de itens conforme o jogador os pega
				if object_index.qtde_itens == 0 {
					instance_destroy()
				}
			}
			var g = obj_personagem.slot_selecionado
			var h = 0
			for (var i = 0; i < 5; i++) {
				if h >= variable_struct_get(global.qtde_slots, object) {
					break
				}
				if g == 1 and obj_personagem.slot1 == noone {
					h++
					obj_personagem.slot1_n = obj_personagem.numero_n
				} else if g == 2 and obj_personagem.slot2 == noone {
					h++
					obj_personagem.slot2_n = obj_personagem.numero_n
				} else if g == 3 and obj_personagem.slot3 == noone {
					h++
					obj_personagem.slot3_n = obj_personagem.numero_n
				} else if g == 4 and obj_personagem.slot4 == noone {
					h++
					obj_personagem.slot4_n = obj_personagem.numero_n
				} else if g == 5 and obj_personagem.slot5 == noone {
					h++
					obj_personagem.slot5_n = obj_personagem.numero_n
				}
				g--
				if g < 1 {
					g = 5
				}
			}
			g = obj_personagem.slot_selecionado
			h = 1
			for (var i = 0; i < 5; i++) {				
				g--
				if g < 1 {
					g = 5
				}
				if h >= variable_struct_get(global.qtde_slots, object) {
					break
				}
				if g == 1 and obj_personagem.slot1 == noone {
					obj_personagem.slot1 = object_index
					obj_personagem.slot1_novo = true
					h++
				} else if g == 2 and obj_personagem.slot2 == noone {
					obj_personagem.slot2 = object_index
					obj_personagem.slot2_novo = true
					h++
				} else if g == 3 and obj_personagem.slot3 == noone {
					obj_personagem.slot3 = object_index
					obj_personagem.slot3_novo = true
					h++
				} else if g == 4 and obj_personagem.slot4 == noone {
					obj_personagem.slot4 = object_index
					obj_personagem.slot4_novo = true
					h++
				} else if g == 5 and obj_personagem.slot5 == noone {
					obj_personagem.slot5 = object_index
					obj_personagem.slot5_novo = true
					h++
				}
			}	
			obj_personagem.numero_n++ //a cada item que for pego, o slot que ele esta tera armazenado um numero, e assim será diferenciado quando tiver 2 itens iguais na hotbar
			return object_index
		}
		return noone
	}

	if point_distance(obj_personagem.x, obj_personagem.y, x, y) < 100 { //se o personagem estiver proximo do coletavel
		if obj_personagem.is_consumivel {
			if !obj_personagem.item_devolvido { //se o clique sobre o coletavel nao foi feito para devolvê-lo
				switch obj_personagem.slot_selecionado { //verificando se o slot_selecionado esta ocupado na hora do clique
					case 1:
						if obj_personagem.slot1 != noone {
							mudar_slot_vazio()
						}
						break
					case 2:
						if obj_personagem.slot2 != noone {
							mudar_slot_vazio()
						}
						break
					case 3:
						if obj_personagem.slot3 != noone {
							mudar_slot_vazio()
						}
						break
					case 4:
						if obj_personagem.slot4 != noone {
							mudar_slot_vazio()
						}
						break
					case 5:
						if obj_personagem.slot5 != noone {
							mudar_slot_vazio()
						}
						break
				}
				switch (obj_personagem.slot_selecionado) { //se o slot_selecionado esta vazio
					case 1: 
						if obj_personagem.slot1 == noone {
							obj_personagem.slot1 = coletar_destruir(obj_personagem.slot1)
						}
						break
					case 2: 
						if obj_personagem.slot2 == noone {
							obj_personagem.slot2 = coletar_destruir(obj_personagem.slot2)
						}
						break
					case 3: 
						if obj_personagem.slot3 == noone {
							obj_personagem.slot3 = coletar_destruir(obj_personagem.slot3)
						}
						break
					case 4: 
						if obj_personagem.slot4 == noone {
							obj_personagem.slot4 = coletar_destruir(obj_personagem.slot4)
						}
						break
					case 5: 
						if obj_personagem.slot5 == noone {
							obj_personagem.slot5 = coletar_destruir(obj_personagem.slot5)
						}
						break
				}
				mudar_slot_vazio()
			} else {
		    	obj_personagem.item_devolvido = false
			}
		} else {
			obj_personagem.is_consumivel = true
		}
	}

	if obj_personagem.obj_anterior != noone { //esse aqui é o ultimo obj que foi instaciado, aquele que estava no slot selecionado por ultimo e foi trocado agora
		//quando rolar o mouse e trocar o selecionado, o ultimo objeto deve ser destruido
		instance_destroy(obj_personagem.obj_anterior)
		obj_personagem.obj_anterior = noone
	}

}