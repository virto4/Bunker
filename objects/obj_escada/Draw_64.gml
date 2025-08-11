/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	draw_rectangle_color(0, 0, 1920, 1080, #15404C, #002733, #00332E, #1A664F, false)
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	
	var x_roger = 172
	var y_roger = 894
	var humor = obj_personagem.atributos.humor
	draw_text(x_roger - string_width("Roger") / 2, y_roger + 128 + 10, "Roger")
	draw_rectangle_color(x_roger - 128, y_roger - 128 - 30, x_roger + 128, y_roger - 128 - 10, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_roger - 128 + 5, y_roger - 128 - 25, x_roger + 128 - 5, y_roger - 128 - 15, c_red, c_red, c_red, c_red, false)
	draw_sprite_ext(spr_retrato, 0, 172, 894, 1, 1, 0, c_white, 1)
	draw_circle_color(390, 894, 40, c_black, c_black, false)
	draw_circle_color(390, 894, 38, cor_circulo2, cor_circulo2, false)
	
	draw_rectangle_color(x_roger - 128, y_roger - 128 - 50 - string_height(humor), x_roger + 128, y_roger - 128 - 40, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_roger - 128 + 5, y_roger - 128 - 45 - string_height(humor), x_roger + 128 - 5, y_roger - 128 - 45, c_white, c_white, c_white, c_white, false)
	draw_text(x_roger - 128 + (256 - string_width(humor)) / 2, y_roger - 128 - 45 - string_height(humor), humor)
	
	var novo_y_roger = y_roger - 128 - 45 - string_height(humor)
	
	draw_rectangle_color(x_roger - 128, novo_y_roger - 160, x_roger + 128, novo_y_roger - 10, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_roger - 128 + 5, novo_y_roger - 155, x_roger + 128 - 5, novo_y_roger - 15, #43717F, #43717F, #43717F, #43717F, false)
	draw_text(x_roger - 128 + (256 - string_width("Habilidade")) / 2, novo_y_roger - 100 - string_height("Habilidade"), "Habilidade")
	draw_set_color(c_black)
	draw_line_width(x_roger - 128, novo_y_roger - 95, x_roger + 128, novo_y_roger - 95, 5)
	
	for (var i = 0; i < array_length(obj_personagem.habilidades_adquiridas); i++) {
		
	}
	
	var x_scale = 1
	var y_scale = 1
	var maior = 1
	if selecionar_arma_roger {
		for (var i = 0; i < array_length(obj_personagem.armas_pegas); i++) {
			if obj_personagem.armas_pegas[i] == arma_davi or obj_personagem.armas_pegas[i] == arma_roger {
				continue
			}
			var width = sprite_get_width(object_get_sprite(obj_personagem.armas_pegas[i]))
			var heigth = sprite_get_height(object_get_sprite(obj_personagem.armas_pegas[i]))
			maior = width
			if width < heigth {
				maior = heigth
			}
			draw_circle_color(390 + arma_x_roger * 80, 894,30, #2E7F0E, #2E7F0E, false)
			draw_sprite_ext(object_get_sprite(obj_personagem.armas_pegas[i]), 0, 390 + arma_x_roger* 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
			if point_in_circle(mx, my, 390 + arma_x_roger * 80, 894, 40) { //davi
				if mouse_check_button_pressed(mb_left) {
					arma_roger = obj_personagem.armas_pegas[i]
					selecionar_arma_roger = false
					break
				}
			} 
			arma_x_roger++
		}
		arma_x_roger = 1
	}
	if arma_roger != noone {
		var width = sprite_get_width(object_get_sprite(arma_roger))
		var heigth = sprite_get_height(object_get_sprite(arma_roger))
		maior = width
		if width < heigth {
			maior = heigth
		}
		draw_sprite_ext(object_get_sprite(arma_roger), 0, 390, 894, 64 / maior, 64 / maior, 0, c_white, 1)
	}
		
	if instance_exists(obj_davi) {
		var x_davi = 1742
		var y_davi = 894 
		var humor_davi = obj_davi.atributos.humor
		draw_rectangle_color(x_davi - 128, y_davi - 128 - 30, x_davi + 128, y_davi - 128 - 10, c_black, c_black, c_black, c_black, false)
		draw_rectangle_color(x_davi - 128 + 5, y_davi - 128 - 25, x_davi + 128 - 5, y_davi - 128 - 15, c_red, c_red, c_red, c_red, false)
		draw_sprite_ext(spr_retrato, 0, 1742, 894, 1, 1, 0, c_white, 1)
		draw_text(1742 - string_width("Davi") / 2, 894 + 128 + 10, "Davi")
		draw_circle_color(1524, 894, 40, c_black, c_black, false)
		draw_circle_color(1524, 894, 38, cor_circulo1, cor_circulo1, false)
		
		draw_rectangle_color(x_davi - 128, y_davi - 128 - 50 - string_height(humor_davi), x_davi + 128, y_davi - 128 - 40, c_black, c_black, c_black, c_black, false)
		draw_rectangle_color(x_davi - 128 + 5, y_davi - 128 - 45 - string_height(humor_davi), x_davi + 128 - 5, y_davi - 128 - 45, c_white, c_white, c_white, c_white, false)
		draw_text(x_davi - 128 + (256 - string_width(humor_davi)) / 2, y_davi - 128 - 45 - string_height(humor_davi), humor_davi)
		
		var novo_y = y_davi - 128 - 50 - string_height(humor_davi)
		
		draw_rectangle_color(x_davi - 128, novo_y_roger - 160, x_davi + 128, novo_y_roger - 10, c_black, c_black, c_black, c_black, false)
		draw_rectangle_color(x_davi - 128 + 5, novo_y_roger - 155, x_davi + 128 - 5, novo_y_roger - 15, #43717F, #43717F, #43717F, #43717F, false)
		draw_text(x_davi - 128 + (256 - string_width("Habilidade")) / 2, novo_y_roger - 100 - string_height("Habilidade"), "Habilidade")
		draw_set_color(c_black)
		draw_line_width(x_davi - 128, novo_y_roger - 95, x_davi + 128, novo_y_roger - 95, 5)
		
		if selecionar_arma_davi {
			for (var i = 0; i < array_length(obj_personagem.armas_pegas); i++) {
				if obj_personagem.armas_pegas[i] == arma_davi or obj_personagem.armas_pegas[i] == arma_roger {
					continue
				}
				var width = sprite_get_width(object_get_sprite(obj_personagem.armas_pegas[i]))
				var heigth = sprite_get_height(object_get_sprite(obj_personagem.armas_pegas[i]))
				maior = width
				if width < heigth {
					maior = heigth
				}
				draw_circle_color(1524 - arma_x_davi * 80, 894,30, #2E7F0E, #2E7F0E, false)
				draw_sprite_ext(object_get_sprite(obj_personagem.armas_pegas[i]), 0, 1524 - arma_x_davi * 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
				if point_in_circle(mx, my, 1524 - arma_x_davi * 80, 894, 40) { //davi
					if mouse_check_button_pressed(mb_left) {
						arma_davi = obj_personagem.armas_pegas[i]
						selecionar_arma_davi = false
						break
					}
				} 
				arma_x_davi++
			}
			arma_x_davi = 1
		}
		if arma_davi != noone {
			var width = sprite_get_width(object_get_sprite(arma_davi))
			var heigth = sprite_get_height(object_get_sprite(arma_davi))
			maior = width
			if width < heigth {
				maior = heigth
			}
			draw_sprite_ext(object_get_sprite(arma_davi), 0, 1524, 894, 64 / maior, 64 / maior, 0, c_white, 1)
		}
	}
	
	var x_inimigo = 960
	var y_inimigo = 540
	draw_rectangle_color(x_inimigo - 128, y_inimigo - 256 - 30, x_inimigo + 128, y_inimigo - 256 - 10, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_inimigo - 128 + 5, y_inimigo - 256 - 25, x_inimigo + 128 - 5, y_inimigo - 256 - 15, c_red, c_red, c_red, c_red, false)
	draw_sprite_ext(spr_retrato2, 0, 960, 540, 1, 1, 0, c_white, 1)
	draw_text(960 - string_width(nome_inimigo) / 2, 540 + 256 + 10, nome_inimigo)
	
	draw_rectangle_color(960 - 128, 863, 960 + 128, 943, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(960 - 128 + 5, 863 + 5, 960 + 128 - 5, 943 - 5, cor_atacar, cor_atacar, cor_atacar, cor_atacar, false)
	draw_text(960 - 128 + (256 - string_width("Atacar")) / 2, 863 + (80 - string_height("Atacar")) / 2, "Atacar")
	draw_rectangle_color(960 - 128, 963, 960 + 128, 1043, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(960 - 128 + 5, 963 + 5, 960 + 128 - 5, 1043 - 5, cor_correr, cor_correr, cor_correr, cor_correr, false)
	draw_text(960 - 128 + (256 - string_width("Correr")) / 2, 963 + (80 - string_height("Correr")) / 2, "Correr")
}