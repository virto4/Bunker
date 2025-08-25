/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function maior() {
	var encontrou = false
	for (var k = 6; k >= 0 and !encontrou; k--) {
		for (var l = 6; l >= 0 and !encontrou; l--) {
			for (var i = 0; i < array_length(pecas_jogador) and !encontrou; i++) {
				for (var j = 0; j < array_length(pecas_adversario) and !encontrou; j++) {
					if array_equals(pecas_jogador[i], [k, l]) {
						encontrou = true
						array_push(pecas_mesa, [k, l])
						array_delete(pecas_jogador, i, 1)
						break
					} else if array_equals(pecas_adversario[j], [k, l]) {
						encontrou = true
						array_push(pecas_mesa, [k, l])
						array_delete(pecas_adversario, j, 1)
						break
					}
				}
			}
		}
	}
}

depth = -y
if y < obj_personagem.y + 86 and y > obj_personagem.y - 5 {
	depth = obj_personagem.depth + 1
} else if instance_exists(obj_davi) {
	if y < obj_davi.y + 86 and y > obj_davi.y - 5 {
		depth = obj_personagem.depth + 1
	}
}
if clicou {
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair &&
		my > ty_sair - height_sair && my < ty_sair + height_sair {
			clicou = false
			global.tem_tela_aberta = false
		}
	}
	if comecou {
		pecas_tela = []
		pecas_jogador = []
		pecas_adversario = []
		monte = []
		pecas_mesa = []
		comecou = false
		pecas = embaralhar(pecas)
		var tamanho = array_length(pecas)
		for (var i = 0; i < tamanho; i++) {
			if i < 7 {
				array_push(pecas_jogador, pecas[i])
			} else if i < 14 {
				array_push(pecas_adversario, pecas[i])
			} else {
				array_push(monte, pecas[i])
			}
		}
		maior()
	}
	if array_length(pecas_jogador) > 14 {
		array_copy(pecas_tela, 0, pecas_jogador, index, 14)
	} else {
		pecas_tela = pecas_jogador
	}
}

if vez_davi {
	if current_time / 1000 > tempo {
		calculo_davi = true
	}
	if calculo_davi {
		vez_davi = false
		calculo_davi = false
		for (var i = 0; i < array_length(pecas_adversario); i++) {
			if pecas_adversario[i][0] == prim or pecas_adversario[i][1] == prim {
				array_insert(pecas_mesa, 0, pecas_adversario[i])
				array_delete(pecas_adversario, i, 1)
				break
			} else if pecas_adversario[i][0] == ult or pecas_adversario[i][1] == ult {
				array_push(pecas_mesa, pecas_adversario[i])
				array_delete(pecas_adversario, i, 1)
				break
			}
		}
	}
}