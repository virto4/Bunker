/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)
var tx_sim = 1920 / 2 - 450
var ty_sim = 800
var tx_nao = 1920 / 2 + 450
var ty_nao = 800
draw_set_font(fnt_alagard)

if clicou {
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		if !primeiro {
			primeiro = true
			audio_play_sound(snd_menu_mouse, 1, false)
		}
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			tirar = true
			obj_personagem.passagem_dia = true
			clicou = false
			global.tem_tela_aberta = false
			if instance_exists(obj_radio) {
				obj_radio.entrou = true
				obj_radio.programacao = noone
			}
			if instance_exists(obj_davi) {
				obj_davi.interagir = true
				obj_davi.comecou_dia = true
			}
			if instance_exists(obj_meredith) {
				obj_meredith.tem_fala = true
				obj_meredith.comecou_dia = true
			}
		}
	} else {
		primeiro = false
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		if !primeiro2 {
			audio_play_sound(snd_menu_mouse, 1, false)
			primeiro2 = true
		}
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			tirar = true
			clicou = false
			global.tem_tela_aberta = false
		}
	} else {
		primeiro2 = false
		mouse_nao = false
	}
}