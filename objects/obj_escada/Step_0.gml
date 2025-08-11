/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if clicou {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, 960 - 128, 863, 960 + 128, 943) {
		cor_atacar = #99093D
	} else {
		cor_atacar = #990A0E
	}
	
	if point_in_rectangle(mx, my, 960 - 128, 963, 960 + 128, 1043) {
		cor_correr = #B25A0B
	} else {
		cor_correr = #B2760B
	}
	
	if instance_exists(obj_davi) {
		if point_in_circle(mx, my, 1524, 894, 40) { //davi
			cor_circulo1 = #649910
			if mouse_check_button_pressed(mb_left) {
				selecionar_arma_davi = true
			}
		} else {
			cor_circulo1 = #2E7F0E
		}
	}
	if point_in_circle(mx, my, 390, 894, 40) { //roger
		cor_circulo2 = #649910
		if mouse_check_button_pressed(mb_left) {
			selecionar_arma_roger = true
		}
	} else {
		cor_circulo2 = #2E7F0E
	}
}