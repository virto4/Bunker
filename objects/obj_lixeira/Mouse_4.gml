/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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
				for (var i = 0; i < array_length(global.casa); i++) {
					if index == asset_get_index(global.casa[i][0]) {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						instance_create_layer(ax, ay, layer_get_id("Instancias"), obj_personagem.slot1, {})
						break
					}
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
				for (var i = 0; i < array_length(global.casa); i++) {
					if index == asset_get_index(global.casa[i][0]) {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						instance_create_layer(ax, ay, layer_get_id("Instancias"), obj_personagem.slot2, {})
						break
					}
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
				for (var i = 0; i < array_length(global.casa); i++) {
					if index == asset_get_index(global.casa[i][0]) {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						instance_create_layer(ax, ay, layer_get_id("Instancias"), obj_personagem.slot3, {})
						break
					}
				}
			}
			obj_personagem.slot3= noone
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
				for (var i = 0; i < array_length(global.casa); i++) {
					if index == asset_get_index(global.casa[i][0]) {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						instance_create_layer(ax, ay, layer_get_id("Instancias"), obj_personagem.slot4, {})
						break
					}
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
				for (var i = 0; i < array_length(global.casa); i++) {
					if index == asset_get_index(global.casa[i][0]) {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						instance_create_layer(ax, ay, layer_get_id("Instancias"), obj_personagem.slot5, {})
						break
					}
				}
			}
			obj_personagem.slot5 = noone
		}
		break
}
