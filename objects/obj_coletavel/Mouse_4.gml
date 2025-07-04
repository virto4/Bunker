/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !obj_personagem.opcoes {
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

	function coletar_destruir() {
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
	}

	if point_distance(obj_personagem.x, obj_personagem.y, x, y) < 100 { //se o personagem estiver proximo do coletavel
		if room_get_name(room) == "rm_bunker" { //para saber se o item clicado é consumivel ou nao
			for (var _j = 0; _j < array_length(obj_personagem.itens_nao_consumiveis); _j++) {
				if object_index == obj_personagem.itens_nao_consumiveis[_j] {
					obj_personagem.is_consumivel = false
					break
				}
			}
		}
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
						 	obj_personagem.slot1 = object_index
							coletar_destruir()
						}
						break
					case 2: 
						if obj_personagem.slot2 == noone {
						 	obj_personagem.slot2 = object_index
							coletar_destruir()
						}
						break
					case 3: 
						if obj_personagem.slot3 == noone {
						 	obj_personagem.slot3 = object_index
							coletar_destruir()
						}
						break
					case 4: 
						if obj_personagem.slot4 == noone {
						 	obj_personagem.slot4 = object_index
							coletar_destruir()
						}
						break
					case 5: 
						if obj_personagem.slot5 == noone {
						 	obj_personagem.slot5 = object_index
							coletar_destruir()
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