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
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			obj_diario.dia += 1
			clicou = false
			global.tem_tela_aberta = false
			obj_calendario.mudou_dia = true
			obj_radio.entrou = true
			obj_radio.programacao = noone
		}
	} else {
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			clicou = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}