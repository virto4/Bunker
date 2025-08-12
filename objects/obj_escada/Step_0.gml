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
	
	var x_roger = 172
	var y_roger = 894
	var humor = obj_personagem.atributos.humor
	var novo_y_roger = y_roger - 128 - 45 - string_height(humor)
	if point_in_rectangle(mx, my, x_roger - 128, novo_y_roger - 160, x_roger + 128, novo_y_roger - 10) {
		if mouse_check_button_pressed(mb_left) {
			hab_roger = true
		}
		cor_hab = #335A66
	} else {
		cor_hab = #43717F
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
		
		var x_davi = 1742
		var y_davi = 894 
		var humor_davi = obj_davi.atributos.humor
		var novo_y = y_davi - 128 - 50 - string_height(humor_davi)
		
		if point_in_rectangle(mx, my, x_davi - 128, novo_y - 160, x_davi + 128, novo_y - 10) {
			if mouse_check_button_pressed(mb_left) {
				hab_davi = true
			}
			cor_hab_1 = #335A66
		} else {
			cor_hab_1 = #43717F
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
	
	if point_in_rectangle(mx, my, 960 - 128, 863, 960 + 128, 943) and mouse_check_button_pressed(mb_left) and !batalha{
		if habilidade_davi == "" or habilidade_roger == "" or arma_davi = noone or arma_roger == noone {
			mensagem = true
			codigo = "selecione uma arma e uma habilidade para cada personagem"
			tempo = current_time / 1000 + 3 
		} else if !batalha {
			batalha = true
			tempo_turno = current_time / 1000 + 3
			executar = true
			sua_vez = 0
		}
	}
}