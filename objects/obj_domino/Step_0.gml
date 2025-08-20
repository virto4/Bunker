/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
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
}