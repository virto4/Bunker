/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if point_in_rectangle(x, y, obj_personagem.x - 40, obj_personagem.y, obj_personagem.x + 40, obj_personagem.y + 62) and y < 320 {
	depth = obj_personagem.depth + 1
}
if instance_exists(obj_davi) and obj_personagem.ativada {
	if point_in_rectangle(x, y, obj_davi.x - 40, obj_davi.y, obj_davi.x + 40, obj_davi.y + 62) and y < 320 {
		depth = obj_davi.depth + 1
	}
}

if clicou and !jogou_hoje {
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair &&
		my > ty_sair - height_sair && my < ty_sair + height_sair {
			if ganhou {
				if instance_exists(obj_davi) {
					obj_davi.sao = true
					obj_davi.aumento_sanidade = 10
				}
				obj_personagem.sao = true
				obj_personagem.aumento_sanidade = 10
				jogou_hoje = true
			}
			clicou = false
			global.tem_tela_aberta = false
			primeira_peca = true
			maismais = false
			ganhou = false
			audio_stop_sound(snd_jazz)
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
	}
	if array_length(pecas_jogador) > 14 {
		array_copy(pecas_tela, 0, pecas_jogador, index, 14)
	} else {
		pecas_tela = pecas_jogador
	}
}

if vez_davi and !ganhou {
	if current_time / 1000 > tempo {
		calculo_davi = true
	}
	if calculo_davi {
		var encontrou = false
		for (var i = 0; i < array_length(pecas_adversario); i++) {
			if pecas_adversario[i][0] == prim or pecas_adversario[i][1] == prim {
				array_insert(pecas_mesa, 0, pecas_adversario[i])
				array_delete(pecas_adversario, i, 1)
				encontrou = true
				break
			} else if pecas_adversario[i][0] == ult or pecas_adversario[i][1] == ult {
				array_push(pecas_mesa, pecas_adversario[i])
				array_delete(pecas_adversario, i, 1)
				encontrou = true
				break
			}
		}
		vez_davi = false
		calculo_davi = false
		if !encontrou {
			davi_pulou = true
		}
	}
}