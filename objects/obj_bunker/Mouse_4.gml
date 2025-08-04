/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !global.tem_tela_aberta {
	if distance_to_object(obj_personagem) < 100 {
		function mudar_slot_cheio() { //muda para o slot cheio
			for (var _i = 1; _i <= 5; _i++) {
				obj_personagem.slot_selecionado--
				if obj_personagem.slot_selecionado < 1 {
					obj_personagem.slot_selecionado = 5
				}
				if obj_personagem.slot_selecionado == 1 and obj_personagem.slot1 != noone {
					break
				} else if obj_personagem.slot_selecionado == 2 and obj_personagem.slot2 != noone {
					break
				} else if obj_personagem.slot_selecionado == 3 and obj_personagem.slot3 != noone {
					break
				} else if obj_personagem.slot_selecionado == 4 and obj_personagem.slot4 != noone {
					break
				} else if obj_personagem.slot_selecionado == 5 and obj_personagem.slot5 != noone {
					break
				}
			}
		}

		function tirar_slot(slot, slot_n) {
			if obj_personagem.slot1_n == slot_n {
				obj_personagem.slot1 = noone
				obj_personagem.slot1_novo = false
			} 
			if obj_personagem.slot2_n == slot_n {
				obj_personagem.slot2 = noone
				obj_personagem.slot2_novo = false
			} 
			if obj_personagem.slot3_n == slot_n {
				obj_personagem.slot3 = noone
				obj_personagem.slot3_novo = false
			} 
			if obj_personagem.slot4_n == slot_n {
				obj_personagem.slot4 = noone
				obj_personagem.slot4_novo = false
			} 
			if obj_personagem.slot5_n == slot_n {
				obj_personagem.slot5 = noone
				obj_personagem.slot5_novo = false
			}
		}

		if obj_personagem.slot_selecionado == 1 and obj_personagem.slot1 != noone {
			ds_list_add(global.itens_pegos, obj_personagem.slot1)
			tirar_slot(obj_personagem.slot1, obj_personagem.slot1_n)
			mudar_slot_cheio()
		} else if obj_personagem.slot_selecionado == 2 and obj_personagem.slot2 != noone {
			ds_list_add(global.itens_pegos, obj_personagem.slot2)
			tirar_slot(obj_personagem.slot2, obj_personagem.slot2_n)
			mudar_slot_cheio()
		} else if obj_personagem.slot_selecionado == 3 and obj_personagem.slot3 != noone {
			ds_list_add(global.itens_pegos, obj_personagem.slot3)
			tirar_slot(obj_personagem.slot3, obj_personagem.slot3_n)
			mudar_slot_cheio()
		} else if obj_personagem.slot_selecionado == 4 and obj_personagem.slot4 != noone {
			ds_list_add(global.itens_pegos, obj_personagem.slot4)
			tirar_slot(obj_personagem.slot4, obj_personagem.slot4_n)
			mudar_slot_cheio()
		} else if obj_personagem.slot_selecionado == 5 and obj_personagem.slot5 != noone {
			ds_list_add(global.itens_pegos, obj_personagem.slot5)
			tirar_slot(obj_personagem.slot5, obj_personagem.slot5_n)
			mudar_slot_cheio()
		}
	}

	if obj_personagem.obj_anterior != noone { //esse aqui é o ultimo obj que foi instaciado, aquele que estava no slot selecionado por ultimo e foi trocado agora
		//quando rolar o mouse e trocar o selecionado, o ultimo objeto deve ser destruido
		instance_destroy(obj_personagem.obj_anterior)
		obj_personagem.obj_anterior = noone
	}
}