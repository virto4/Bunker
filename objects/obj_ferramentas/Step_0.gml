/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function coletar(objeto) {
	global.mudar_slot_vazio()
	switch (obj_personagem.slot_selecionado) { //se o slot_selecionado esta vazio
		case 1: 
			if obj_personagem.slot1 == noone {
				obj_personagem.slot1 = global.coletar_destruir(objeto, obj_personagem.slot1)
				}
			break
		case 2: 
			if obj_personagem.slot2 == noone {
				obj_personagem.slot2 = global.coletar_destruir(objeto, obj_personagem.slot2)
			}
			break
		case 3: 
			if obj_personagem.slot3 == noone {
				obj_personagem.slot3 = global.coletar_destruir(objeto, obj_personagem.slot3)
			}
			break
		case 4: 
			if obj_personagem.slot4 == noone {
				obj_personagem.slot4 = global.coletar_destruir(objeto, obj_personagem.slot4)
			}
			break
		case 5: 
			if obj_personagem.slot5 == noone {
				obj_personagem.slot5 = global.coletar_destruir(objeto, obj_personagem.slot5)
			}
			break
	}
}

var width_sair = sprite_get_width(spr_voltar) / 2
var height_sair = sprite_get_height(spr_voltar) / 2 
var tx_sair = 1800
var ty_sair = 50

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if pressionou {
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair &&
		my > ty_sair - height_sair && my < ty_sair + height_sair {
			pressionou = false
			global.tem_tela_aberta = false
		}
		if mx < posicoes[0][0] + 64 and mx > posicoes[0][0] - 64 and my < posicoes[0][1] + 64 and my > posicoes[0][1] - 64 and !martelo {
			martelo = true
			martelo_cor = c_black
			coletar(obj_martelo)
		} 
		if mx < posicoes[1][0] + 64 and mx > posicoes[1][0] - 64 and my < posicoes[1][1] + 64 and my > posicoes[1][1] - 64 and !argamassa {
			argamassa = true
			argamassa_cor = c_black
			coletar(obj_argamassa)
		}
		if mx < posicoes[2][0] + 64 and mx > posicoes[2][0] - 64 and my < posicoes[2][1] + 64 and my > posicoes[2][1] - 64 and !chave {
			chave = true
			chave_cor = c_black
			coletar(obj_chave_fenda)
		}
		if mx < posicoes[3][0] + 64 and mx > posicoes[3][0] - 64 and my < posicoes[3][1] + 64 and my > posicoes[3][1] - 64 and !fita {
			fita = true
			fita_cor = c_black
			coletar(obj_fita_isolante)
		}
	}
}