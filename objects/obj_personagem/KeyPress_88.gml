/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

function casa(slot) {
	if slot != noone {
			var is_consumivel = false
			for (var i = 0; i < array_length(itens_nao_consumiveis); i++) {
				if slot == itens_nao_consumiveis[i] {
					is_consumivel = true
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
				desenhar = true
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
					slot.qtde_itens++
				}
			}
			item_segurado = slot
			slot = noone
		}
}

switch slot_selecionado {
	case 1:
		casa(slot1)
		slot1 = noone
		break
	case 2:
		casa(slot2)
		slot2 = noone
		break
	case 3:
		casa(slot3)
		slot3 = noone
		break
	case 4:
		casa(slot4)
		slot4 = noone
		break
	case 5:
		casa(slot5)
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