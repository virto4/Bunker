/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function casa(slot, slot_novo, slot_n) {
	if slot != noone {
		var is_consumivel = false
		for (var i = 0; i < array_length(itens_nao_consumiveis); i++) {
			if slot == itens_nao_consumiveis[i] {
				is_consumivel = true
				break
			}
		}
		var is_alimento = false;
		for (var i = 0; i < array_length(global.alimentos); i++) {
			if slot == global.alimentos[i] {
				is_alimento = true
				break
			}
		}
		if is_consumivel {
			if room == rm_bunker {
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == slot {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), slot, {})
						break
					}
				}
			} else {
				for (var i = 0; i < array_length(global.casa); i++) {
					if asset_get_index(global.casa[i][0]) == slot {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), slot, {})
					}
				}
			}
			if !desenhar {
				desenhar = true
				item_segurado = slot
			}
		} else {
			if !instance_exists(slot) and room == rm_bunker {
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == slot {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						instance_create_layer(ax, ay, layer_get_id("Instances"), slot, {})
						break
					}
				}
			} else if room == rm_bunker {
				if is_alimento {
					for (var i = 0; i < array_length(obj_freezer.quantidades); i++) {
						if obj_freezer.quantidades[i][0] = slot {
							obj_freezer.quantidades[i][1]++
							break
						}
					}
				} else {
					slot.qtde_itens++
				}
			}
			if !is_alimento {
				if !desenhar2 {
					desenhar2 = true
				}
				item_segurado = slot
			}
		}
		if slot1_n == slot_n {
			slot1 = noone
			slot1_novo = false
		} 
		if slot2_n == slot_n {
			slot2 = noone
			slot2_novo = false
		} 
		if slot3_n == slot_n {
			slot3 = noone
			slot3_novo = false
		} 
		if slot4_n == slot_n {
			slot4 = noone
			slot4_novo = false
		} 
		if slot5_n == slot_n {
			slot5 = noone
			slot5_novo = false
		}
	}
}

switch slot_selecionado {
	case 1:
		casa(slot1, slot1_novo, slot1_n)
		slot1 = noone
		break
	case 2:
		casa(slot2, slot2_novo, slot2_n)
		slot2 = noone
		break
	case 3:
		casa(slot3, slot3_novo, slot3_n)
		slot3 = noone
		break
	case 4:
		casa(slot4, slot4_novo, slot4_n)
		slot4 = noone
		break
	case 5:
		casa(slot5, slot5_novo, slot5_n)
		slot5 = noone
		break
}
function mudar_slot_cheio() { //muda para o slot cheio
	for (var _i = 1; _i <= 5; _i++) {
		slot_selecionado--
		if slot_selecionado < 1 {
			slot_selecionado = 5
		}
		if slot_selecionado == 1 and slot1 != noone {
			break
		} else if slot_selecionado == 2 and slot2 != noone {
			break
		} else if slot_selecionado == 3 and slot3 != noone {
			break
		} else if slot_selecionado == 4 and slot4 != noone {
			break
		} else if slot_selecionado == 5 and slot5 != noone {
			break
		}
	}
}
mudar_slot_cheio()