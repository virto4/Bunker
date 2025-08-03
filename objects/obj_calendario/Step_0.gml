/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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

if mudou_dia {
	dia_atual++
	if mes_atual == 7 or mes_atual == 8 or mes_atual == 10 or mes_atual == 12 {
		if dia_atual > 31 {
			dia_atual = 1
			mes_atual++
		}
	}
	if mes_atual == 9 or mes_atual == 11 {
		if dia_atual > 30 {
			dia_atual = 1
			mes_atual++
		}
	}
	mudou_dia = false
}
