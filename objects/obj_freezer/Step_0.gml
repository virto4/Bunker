/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if mouse_check_button_pressed(mb_left) {
		var width = sprite_get_width(spr_voltar) / 2
		var height = sprite_get_height(spr_voltar) / 2
		var x_sair = 1620
		var y_sair = 50
		if mx < x_sair + width and mx > x_sair - width and my < y_sair + height and my > y_sair - height {
			clicou = false
			global.tela_hotbar = false
			global.tem_tela_aberta = false
		}
		for (var i = 0; i < array_length(posicoes); i++) {
			if quantidades[i][1] > 0 {
				var x_item = posicoes[i][1]
				var y_item = posicoes[i][2]
				var w_item = 3.5 * sprite_get_width(object_get_sprite(posicoes[i][0])) / 2
				var h_item = 3.5 * sprite_get_height(object_get_sprite(posicoes[i][0])) / 2
				if mx < x_item + w_item and mx > x_item - w_item and my < y_item + h_item and my > y_item - h_item {
					switch obj_personagem.slot_selecionado { //verificando se o slot_selecionado esta ocupado na hora do clique
						case 1:
							if obj_personagem.slot1 != noone {
								global.mudar_slot_vazio()
							}
							break
						case 2:
							if obj_personagem.slot2 != noone {
								global.mudar_slot_vazio()
							}
							break
						case 3:
							if obj_personagem.slot3 != noone {
								global.mudar_slot_vazio()
							}
							break
						case 4:
							if obj_personagem.slot4 != noone {
								global.mudar_slot_vazio()
							}
							break
						case 5:
							if obj_personagem.slot5 != noone {
								global.mudar_slot_vazio()
							}
							break
					}
					switch (obj_personagem.slot_selecionado) { //se o slot_selecionado esta vazio
						case 1: 
							if obj_personagem.slot1 == noone {
								obj_personagem.slot1 = global.coletar_destruir(posicoes[i][0], obj_personagem.slot1)
							}
							break
						case 2: 
							if obj_personagem.slot2 == noone {
								obj_personagem.slot2 = global.coletar_destruir(posicoes[i][0], obj_personagem.slot2)
							}
							break
						case 3: 
							if obj_personagem.slot3 == noone {
								obj_personagem.slot3 = global.coletar_destruir(posicoes[i][0], obj_personagem.slot3)
							}
							break
						case 4: 
							if obj_personagem.slot4 == noone {
								obj_personagem.slot4 = global.coletar_destruir(posicoes[i][0], obj_personagem.slot4)
							}
							break
						case 5: 
							if obj_personagem.slot5 == noone {
								obj_personagem.slot5 = global.coletar_destruir(posicoes[i][0], obj_personagem.slot5)
							}
							break
					}
					global.mudar_slot_vazio()
				}
			}
		}
	}		
}
