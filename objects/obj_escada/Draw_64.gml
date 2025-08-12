/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	
	draw_rectangle_color(0, 0, 1920, 1080, #15404C, #002733, #00332E, #1A664F, false)
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	
	draw_rectangle_color(x_inimigo - 128, y_inimigo - 256 - 30, x_inimigo + 128, y_inimigo - 256 - 10, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_inimigo - 128 + 5, y_inimigo - 256 - 25, x_inimigo + 128 - 5, y_inimigo - 256 - 15, c_red, c_red, c_red, c_red, false)
	draw_sprite_ext(spr_retrato2, 0, 960, 540, 1, 1, 0, c_white, 1)
	draw_text(960 - string_width(nome_inimigo) / 2, 540 + 256 + 10, nome_inimigo)
	
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	
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
	draw_rectangle_color(x_roger - 128 + 5, novo_y_roger - 155, x_roger + 128 - 5, novo_y_roger - 15, cor_hab, cor_hab, cor_hab, cor_hab, false)
	draw_text(x_roger - 128 + (256 - string_width("Habilidade")) / 2, novo_y_roger - 100 - string_height("Habilidade"), "Habilidade")
	draw_set_color(c_black)
	draw_line_width(x_roger - 128, novo_y_roger - 95, x_roger + 128, novo_y_roger - 95, 5)
	draw_text(x_roger - 128 + (256 - string_width(habilidade_roger)) / 2, novo_y_roger - 20 - string_height(habilidade_roger), habilidade_roger)
	
	var x_scale = 1
	var y_scale = 1
	var maior = 1
	if hab_roger and !batalha{
		for (var i = 0; i < array_length(obj_personagem.habilidades_adquiridas); i++) {
			var nome = obj_personagem.habilidades_adquiridas[i][0]
			var descricao = obj_personagem.habilidades_adquiridas[i][1]
			if point_in_rectangle(mx, my, x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45 - 5, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45 + 5) { 
				cor_unidade = #335A66
			} else {
				cor_unidade = #43717F
			}
			draw_rectangle_color(x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45 - 5, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45 + 5, c_black, c_black, c_black, c_black, false )
			draw_rectangle_color(x_roger - 128, novo_y_roger - 180 - 40 - i * 45, x_roger + 10 + string_width(nome), novo_y_roger - 180 - i * 45, cor_unidade, cor_unidade, cor_unidade, cor_unidade, false )
			draw_text(x_roger - 100, novo_y_roger - 180 - 40 - i * 45, nome)
			if point_in_rectangle(mx, my, x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45 - 5, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45 + 5) {
				draw_rectangle_color(mx + 50, my, mx + 60 + string_width(descricao) + 5, my + string_height(descricao) + 10 + 5, c_black, c_black, c_black, c_black, false)
				draw_rectangle_color(mx + 50, my - 5, mx + 60 + string_width(descricao), my + string_height(descricao) + 10, #B28435, #B28435, #B28435, #B28435, false)
				draw_text(mx + 60, my + 5, descricao)
				if mouse_check_button_pressed(mb_left) {
					habilidade_roger = nome
					hab_roger = false
				}
			}
		}
	}
	
	if selecionar_arma_roger and !batalha {
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
		draw_rectangle_color(x_davi - 128 + 5, novo_y_roger - 155, x_davi + 128 - 5, novo_y_roger - 15, cor_hab_1, cor_hab_1, cor_hab_1, cor_hab_1, false)
		draw_text(x_davi - 128 + (256 - string_width("Habilidade")) / 2, novo_y_roger - 100 - string_height("Habilidade"), "Habilidade")
		draw_set_color(c_black)
		draw_line_width(x_davi - 128, novo_y_roger - 95, x_davi + 128, novo_y_roger - 95, 5)
		
		if selecionar_arma_davi and !batalha {
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
	
		if hab_davi and !batalha {
			for (var i = 0; i < array_length(obj_personagem.habilidades_adquiridas); i++) {
				var nome = obj_personagem.habilidades_adquiridas[i][0]
				var descricao = obj_personagem.habilidades_adquiridas[i][1]
				if point_in_rectangle(mx, my, x_davi + 128 - 40 - string_width(nome) - 5, novo_y - 180 - 40 - i * 45 - 5, x_davi + 128, novo_y - 180 - i * 45 + 5) { 
					cor_unidade = #335A66
				} else {
					cor_unidade = #43717F
				}
				draw_rectangle_color(x_davi + 128 - 40 - string_width(nome) - 5, novo_y - 180 - 40 - i * 45 - 5, x_davi + 128, novo_y - 180 - i * 45 + 5, c_black, c_black, c_black, c_black, false )
				draw_rectangle_color(x_davi + 128 - 40 - string_width(nome), novo_y - 180 - 40 - i * 45, x_davi + 123, novo_y - 180 - i * 45, cor_unidade, cor_unidade, cor_unidade, cor_unidade, false )
				draw_text(x_davi + 128 - 20 - string_width(nome), novo_y_roger - 180 - 40 - i * 45, nome)
				if point_in_rectangle(mx, my, x_davi + 128 - 10 - string_width(nome) - 5, novo_y - 180 - 40 - i * 45 - 5, x_davi + 128, novo_y - 180 - i * 45 + 5) {
					draw_rectangle_color(mx - 30 - string_width(descricao) - 5, my, mx - 20, my + string_height(descricao) + 10 + 5, c_black, c_black, c_black, c_black, false)
					draw_rectangle_color(mx - 30 - string_width(descricao) - 5, my - 5, mx - 15, my + string_height(descricao) + 10, #B28435, #B28435, #B28435, #B28435, false)
					draw_text(mx - 30 - string_width(descricao), my + 5, descricao)
					if mouse_check_button_pressed(mb_left) {
						habilidade_davi = nome
						hab_davi = false
					}
				}
			}
		}
		draw_text(x_davi - 128 + (256 - string_width(habilidade_davi)) / 2, novo_y - 20 - string_height(habilidade_davi), habilidade_davi)
	}

	
	draw_rectangle_color(960 - 128, 863, 960 + 128, 943, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(960 - 128 + 5, 863 + 5, 960 + 128 - 5, 943 - 5, cor_atacar, cor_atacar, cor_atacar, cor_atacar, false)
	draw_text(960 - 128 + (256 - string_width("Atacar")) / 2, 863 + (80 - string_height("Atacar")) / 2, "Atacar")
	draw_rectangle_color(960 - 128, 963, 960 + 128, 1043, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(960 - 128 + 5, 963 + 5, 960 + 128 - 5, 1043 - 5, cor_correr, cor_correr, cor_correr, cor_correr, false)
	draw_text(960 - 128 + (256 - string_width("Correr")) / 2, 963 + (80 - string_height("Correr")) / 2, "Correr")
	
	if mensagem {
		if current_time / 1000 <= tempo {
			draw_set_color(c_white)
			draw_text((1920 - string_width(codigo)) / 2, 100, codigo)
		} else {
			mensagem = false
		}
	}
	
	function vida(personagem, numero) {
		var _x = 0
		var _y = 0
		if personagem == "Roger" {
			_x = x_roger 
			_y = y_roger
			if numero > 0 {
				draw_set_color(#088C2F)
				draw_text(_x, _y, "+" + string(numero))
			} else {
				draw_set_color(#9E0B0F)
				draw_text(_x, _y, "-" + string(numero))
			}
		} else if personagem == "Davi" {
			_x = x_davi 
			_y = y_davi
			if numero > 0 {
				draw_set_color(#088C2F)
				draw_text(_x, _y, "+" + string(numero))
			} else {
				draw_set_color(#9E0B0F)
				draw_text(_x, _y, "-" + string(numero))
			}
		} else {
			_x = x_inimigo
			_y = y_inimigo
			draw_set_color(#9E0B0F)
			draw_text(_x, _y, "-" + string(numero))
		}
	}
	
	if inimigo.vida > 0 {
		if batalha {
			var ataque = 1
			var defesa = 1
			if executar {
				if sua_vez == 0 {
					sua_vez = 1
					ataque = obj_personagem.atributos.forca * variable_struct_get(armas, object_get_name(arma_roger))
					switch habilidade_roger {
						case "Sniper":
							if arma_roger == obj_metralhadora or arma_roger == obj_pistola {
								ataque *= 1.3
							}
							break
						case "Ferramenteiro":
							if arma_roger == obj_machado or arma_roger == obj_picareta {
								ataque *= 1.3
							}
							break
						case "Golpe da morte":
							sua_vez = 0
							break
						case "Estoicismo":
							obj_personagem.atributos.humor = obj_personagem.humores[0]
							break
						case "Pensamentos intrusivos":
							obj_personagem.atributos.humor = obj_personagem.humores[3]
							break
						case "Pensamentos intrusivos 2":
							obj_personagem.atributos.humor = obj_personagem.humores[2]
							break
						case "Curandeiro aprendiz":
							obj_personagem.saude *= 1.33
							if obj_personagem.saude > 100 {
								obj_personagem.saude = 100
							}
							break
						case "Curandeiro mestre":
							obj_personagem.saude = 100
							break
						case "Parque de diversões":
							obj_personagem.atributos.humor = obj_personagem.humores[1]
							break
						case "Concentração":
							ataque *= 1.1
							defesa *= 1.1
							break
					}
					var critico = false
					var errou = false
					if obj_personagem.atributos.sagacidade > 85 {
						if irandom_range(0, 6) == 0 {
							critico = true
						}
					} else if obj_personagem.atributos.sagacidade > 50 {
						if irandom_range(0, 12) == 0 {
							critico = true
						}
					} else if obj_personagem.atributos.sagacidade > 30 {
						if irandom_range(0, 14) == 0 {
							errou = true
						}
					} else {
						if irandom_range(0, 8) {
							errou = true
						}
					}
					var ataque_final
					if errou {
						ataque_final = 0
					} else if critico {
						ataque_final = ataque * 1.5 / inimigo.resistencia
					} else {
						ataque_final = ataque / inimigo.resistencia
					}
					inimigo.vida -= ataque_final
					obj = "inimigo"
					dano = -ataque_final
				} else if sua_vez == 1 {
					sua_vez = 2
					ataque = obj_davi.atributos.forca * variable_struct_get(armas, object_get_name(arma_davi))
					switch habilidade_roger {
						case "Sniper":
							if arma_davi == obj_metralhadora or arma_davi == obj_pistola {
								ataque *= 1.3
							}
							break
						case "Ferramenteiro":
							if arma_davi == obj_machado or arma_davi == obj_picareta {
								ataque *= 1.3
							}
							break
						case "Golpe da morte":
							sua_vez = 1
							break
						case "Estoicismo":
							obj_davi.atributos.humor = obj_davi.humores[0]
							break
						case "Pensamentos intrusivos":
							obj_davi.atributos.humor = objobj_davi_personagem.humores[3]
							break
						case "Pensamentos intrusivos 2":
							obj_davi.atributos.humor = obj_davi.humores[2]
							break
						case "Curandeiro aprendiz":
							obj_davi.saude *= 1.33
							if obj_davi.saude > 100 {
								obj_davi.saude = 100
							}
							break
						case "Curandeiro mestre":
							obj_davi.saude = 100
							break
						case "Parque de diversões":
							obj_davi.atributos.humor = obj_davi.humores[1]
							break
						case "Concentração":
							ataque *= 1.1
							defesa *= 1.1
							break
					}
					var critico = false
					var errou = false
					if obj_davi.atributos.sagacidade > 85 {
						if irandom_range(0, 6) == 0 {
							critico = true
						}
					} else if obj_davi.atributos.sagacidade > 50 {
						if irandom_range(0, 12) == 0 {
							critico = true
						}
					} else if obj_davi.atributos.sagacidade > 30 {
						if irandom_range(0, 14) == 0 {
							errou = true
						}
					} else {
						if irandom_range(0, 8) {
							errou = true
						}
					}
					var ataque_final
					if errou {
						ataque_final = 0
					} else if critico {
						ataque_final = ataque * 1.5 / inimigo.resistencia
					} else {
						ataque_final = ataque / inimigo.resistencia
					}
					inimigo.vida -= ataque_final
					obj = "inimigo"
					dano = -ataque_final
				} else {
					sua_vez = 0
					var ataque = 0
					//vez do inimigo
					if irandom_range(0, 1) == 1 {
						obj = "Roger"
						ataque = inimigo.forca / obj_personagem.atributos.resistencia 
						obj_personagem.atributos.saude -= ataque
					} else {
						obj = "Davi"
						ataque = inimigo.forca / obj_davi.atributos.resistencia
						obj_davi.atributos.saude -= ataque
					}
					dano = -ataque
				}
			}
			if current_time / 1000 > tempo_turno {
				executar = true
				tempo_turno = current_time / 1000 + 3 
			} else {
				vida(obj, dano)
			}
		}
	}
}