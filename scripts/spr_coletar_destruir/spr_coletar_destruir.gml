// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

	function coletar_destruir(slot, personagem) {
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
			if nomes[i] == object_get_name(slot) {
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
					if slot == obj_personagem.itens_nao_consumiveis[_j] {
						instance_destroy()
					}
				}
			} else if !obj_freezer.clicou {
				slot.qtde_itens-- //vai diminuindo a contagem de itens conforme o jogador os pega
				if slot.qtde_itens == 0 {
					instance_destroy()
				}
			} else {
				for (var i = 0; i < array_length(obj_freezer.quantidades); i++) {
					if obj_freezer.quantidades[i][0] == slot {
						obj_freezer.quantidades[i][1]--
					}
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
					obj_personagem.slot1 = slot
					obj_personagem.slot1_novo = true
					h++
				} else if g == 2 and obj_personagem.slot2 == noone {
					obj_personagem.slot2 = slot
					obj_personagem.slot2_novo = true
					h++
				} else if g == 3 and obj_personagem.slot3 == noone {
					obj_personagem.slot3 = slot
					obj_personagem.slot3_novo = true
					h++
				} else if g == 4 and obj_personagem.slot4 == noone {
					obj_personagem.slot4 = slot
					obj_personagem.slot4_novo = true
					h++
				} else if g == 5 and obj_personagem.slot5 == noone {
					obj_personagem.slot5 = slot
					obj_personagem.slot5_novo = true
					h++
				}
			}	
			obj_personagem.numero_n++ //a cada item que for pego, o slot que ele esta tera armazenado um numero, e assim será diferenciado quando tiver 2 itens iguais na hotbar
			return slot
		}
		return noone
	}
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