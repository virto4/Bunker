/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var mx = device_mouse_x_to_gui(0)
var my = device_mouse_y_to_gui(0)
var tx_sim = 1920 / 2 - 450
var ty_sim = 800
var tx_nao = 1920 / 2 + 450
var ty_nao = 800
draw_set_font(fnt_alagard)

if clicou {
	if (mx > tx_sim && mx < tx_sim + string_width("Sim") && my > ty_sim && my < ty_sim + string_height("Sim")) {
		cor_sim = #999999
		if mouse_check_button_pressed(mb_left) {
			obj_diario.dia += 1
			clicou = false
			global.tem_tela_aberta = false
		}
	} else if (mx > tx_nao && mx < tx_nao + string_width("Não") && my > ty_nao && my < ty_nao + string_height("Não")) {
		cor_nao = #999999
		if mouse_check_button_pressed(mb_left) {
			clicou = false
			global.tem_tela_aberta = false
		}
	} else {
		cor_sim = #555555 
		cor_nao = #555555
	}
}