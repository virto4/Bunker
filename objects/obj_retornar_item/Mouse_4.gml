/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//somente no bunker!!!

switch obj_personagem.slot_selecionado {
	case 1:
		if obj_personagem.slot1 != noone {
			var is_consumivel = false
			for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
				if obj_personagem.slot1 == obj_personagem.itens_nao_consumiveis[i] {
					is_consumivel = true
					break
				}
			}
			if is_consumivel {
				var index = obj_personagem.slot1
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == index {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot1, {})
						break
					}
				}
			} else {
				if !instance_exists(obj_personagem.slot1) {
					var index = obj_personagem.slot1
					var posicoes = variable_struct_get_names(global.posicoes)
					for (var i = 0; i < array_length(posicoes); i++) {
						if asset_get_index(posicoes[i]) == index {
							var struct = variable_struct_get(global.posicoes, posicoes[i])
							var ax = variable_struct_get(struct, "x")
							var ay = variable_struct_get(struct, "y")
							instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot1, {})
							break
						}
					}
				} else {
					obj_personagem.slot1.qtde_itens++
				}
			}
			obj_personagem.slot1 = noone
		}
		break
	case 2:
		if obj_personagem.slot2 != noone {
			var is_consumivel = false
			for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
				if obj_personagem.slot2 == obj_personagem.itens_nao_consumiveis[i] {
					is_consumivel = true
					break
				}
			}
			if is_consumivel {
				var index = obj_personagem.slot2
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == index {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot2, {})
						break
					}
				}
			} else {
				if !instance_exists(obj_personagem.slot2) {
					var index = obj_personagem.slot2
					var posicoes = variable_struct_get_names(global.posicoes)
					for (var i = 0; i < array_length(posicoes); i++) {
						if asset_get_index(posicoes[i]) == index {
							var struct = variable_struct_get(global.posicoes, posicoes[i])
							var ax = variable_struct_get(struct, "x")
							var ay = variable_struct_get(struct, "y")
							instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot2, {})
							break
						}
					}
				} else {
					obj_personagem.slot2.qtde_itens++
				}
			}
			obj_personagem.slot2 = noone
		}
		break
	case 3:
		if obj_personagem.slot3 != noone {
			var is_consumivel = false
			for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
				if obj_personagem.slot3 == obj_personagem.itens_nao_consumiveis[i] {
					is_consumivel = true
					break
				}
			}
			if is_consumivel {
				var index = obj_personagem.slot3
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == index {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot3, {})
						break
					}
				}
			} else {
				if !instance_exists(obj_personagem.slot3) {
					var index = obj_personagem.slot3
					var posicoes = variable_struct_get_names(global.posicoes)
					for (var i = 0; i < array_length(posicoes); i++) {
						if asset_get_index(posicoes[i]) == index {
							var struct = variable_struct_get(global.posicoes, posicoes[i])
							var ax = variable_struct_get(struct, "x")
							var ay = variable_struct_get(struct, "y")
							instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot3, {})
							break
						}
					}
				} else {
					obj_personagem.slot3.qtde_itens++
				}
			}
			obj_personagem.slot3 = noone
		}
		break
	case 4:
		if obj_personagem.slot4 != noone {
			var is_consumivel = false
			for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
				if obj_personagem.slot4 == obj_personagem.itens_nao_consumiveis[i] {
					is_consumivel = true
					break
				}
			}
			if is_consumivel {
				var index = obj_personagem.slot4
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == index {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot4, {})
						break
					}
				}
			} else {
				if !instance_exists(obj_personagem.slot4) {
					var index = obj_personagem.slot4
					var posicoes = variable_struct_get_names(global.posicoes)
					for (var i = 0; i < array_length(posicoes); i++) {
						if asset_get_index(posicoes[i]) == index {
							var struct = variable_struct_get(global.posicoes, posicoes[i])
							var ax = variable_struct_get(struct, "x")
							var ay = variable_struct_get(struct, "y")
							instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot4, {})
							break
						}
					}
				} else {
					obj_personagem.slot4.qtde_itens++
				}
			}
			obj_personagem.slot4 = noone
		}
		break
	case 5:
		if obj_personagem.slot5 != noone {
			var is_consumivel = false
			for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
				if obj_personagem.slot5 == obj_personagem.itens_nao_consumiveis[i] {
					is_consumivel = true
					break
				}
			}
			if is_consumivel {
				var index = obj_personagem.slot5
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == index {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot5, {})
						break
					}
				}
			} else {
				if !instance_exists(obj_personagem.slot5) {
					var index = obj_personagem.slot5
					var posicoes = variable_struct_get_names(global.posicoes)
					for (var i = 0; i < array_length(posicoes); i++) {
						if asset_get_index(posicoes[i]) == index {
							var struct = variable_struct_get(global.posicoes, posicoes[i])
							var ax = variable_struct_get(struct, "x")
							var ay = variable_struct_get(struct, "y")
							instance_create_layer(ax, ay, layer_get_id("Instances"), obj_personagem.slot5, {})
							break
						}
					}
				} else {
					obj_personagem.slot5.qtde_itens++
				}
			}
			obj_personagem.slot5 = noone
		}
		break
}
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
mudar_slot_cheio()
desenhar = true