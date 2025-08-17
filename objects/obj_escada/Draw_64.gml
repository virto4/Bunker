/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou and !derrotou {
	draw_rectangle_color(0, 0, 1920, 1080, #15404C, #002733, #00332E, #1A664F, false)
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	
	draw_rectangle_color(x_inimigo - 128, y_inimigo - 256 - 30, x_inimigo + 128, y_inimigo - 256 - 10, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_inimigo - 128 + 5, y_inimigo - 256 - 25, x_inimigo - 128 + 5 + largura_inimigo, y_inimigo - 256 - 15, c_red, c_red, c_red, c_red, false)
	draw_sprite_ext(spr_retrato2, 0, 960, 540, 1, 1, 0, c_white, 1)
	draw_text(960 - string_width(inimigo.nome) / 2, 540 + 256 + 10, inimigo.nome)
	
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	
	var humor = obj_personagem.atributos.humor
	draw_text(x_roger - string_width("Roger") / 2, y_roger + 128 + 10, "Roger")
	draw_rectangle_color(x_roger - 128, y_roger - 128 - 30, x_roger + 128, y_roger - 128 - 10, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x_roger - 128 + 5, y_roger - 128 - 25,x_roger - 128 + 5 + largura_roger, y_roger - 128 - 15, c_red, c_red, c_red, c_red, false)
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
			var c = false
			if nome == "Curandeiro mestre" and mestre_tempo1 {
				c = true
				cor_unidade = #26434C
			} 
			if nome == "Golpe da morte" and golpe_morte_tempo1 {
				c = true
				cor_unidade = #26434C
			}
			
			if !c {
				if point_in_rectangle(mx, my, x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45 - 5, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45 + 5) { 
					cor_unidade = #335A66
				} else {
					cor_unidade = #43717F
				}
			}
			draw_rectangle_color(x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45 - 5, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45 + 5, c_black, c_black, c_black, c_black, false )
			draw_rectangle_color(x_roger - 128, novo_y_roger - 180 - 40 - i * 45, x_roger + 10 + string_width(nome), novo_y_roger - 180 - i * 45, cor_unidade, cor_unidade, cor_unidade, cor_unidade, false )
			draw_text(x_roger - 100, novo_y_roger - 180 - 40 - i * 45, nome)
			if point_in_rectangle(mx, my, x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45 - 5, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45 + 5) {
				draw_rectangle_color(mx + 50, my, mx + 60 + string_width(descricao) + 5, my + string_height(descricao) + 10 + 5, c_black, c_black, c_black, c_black, false)
				draw_rectangle_color(mx + 50, my - 5, mx + 60 + string_width(descricao), my + string_height(descricao) + 10, #B28435, #B28435, #B28435, #B28435, false)
				draw_text(mx + 60, my + 5, descricao)
				if mouse_check_button_pressed(mb_left) and !c {
					habilidade_roger = nome
					hab_roger = false
				}
			} else if !aux {
				if mouse_check_button_pressed(mb_left) {
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
			if point_in_circle(mx, my, 390 + arma_x_roger * 80, 894, 40) { //davi
				if mouse_check_button_pressed(mb_left) {
					arma_roger = obj_personagem.armas_pegas[i]
					selecionar_arma_roger = false
					break
				}
			} else if !aux {
				if mouse_check_button_pressed(mb_left) {
					selecionar_arma_roger = false
				}
			}
			if point_in_circle(mx, my, 390 + arma_x_roger * 80, 894, 40) {
				cor_circulo = #649910
			} else {
				cor_circulo = #2E7F0E
			}
			draw_circle_color(390 + arma_x_roger * 80, 894,30, cor_circulo, cor_circulo, false)
			draw_sprite_ext(object_get_sprite(obj_personagem.armas_pegas[i]), 0, 390 + arma_x_roger* 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
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
		draw_rectangle_color(x_davi - 128 + 5, y_davi - 128 - 25, x_davi - 128 + 5 +largura_davi, y_davi - 128 - 15, c_red, c_red, c_red, c_red, false)
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
				if point_in_circle(mx, my, 1524 - arma_x_davi * 80, 894, 40) { //davi
					if mouse_check_button_pressed(mb_left) {
						arma_davi = obj_personagem.armas_pegas[i]
						selecionar_arma_davi = false
						break
					}
				} else if !aux {
					if mouse_check_button_pressed(mb_left) {
						selecionar_arma_davi = false
					}
				}
				if point_in_circle(mx, my, 1524 - arma_x_davi * 80, 894, 40) {
					cor_circulo = #649910
				} else {
					cor_circulo = #2E7F0E
				}
				draw_circle_color(1524 - arma_x_davi * 80, 894,30, cor_circulo, cor_circulo, false)
				draw_sprite_ext(object_get_sprite(obj_personagem.armas_pegas[i]), 0, 1524 - arma_x_davi * 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
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
				var b = false
				if nome == "Curandeiro mestre" and mestre_tempo2 {
					cor_unidade = #26434C
					b = true
				} 
				if nome == "Golpe da morte" and golpe_morte_tempo2 {
					b = true
					cor_unidade = #26434C
				}
				if !b {
					if point_in_rectangle(mx, my, x_davi + 128 - 40 - string_width(nome) - 5, novo_y - 180 - 40 - i * 45 - 5, x_davi + 128, novo_y - 180 - i * 45 + 5) { 
						cor_unidade = #335A66
					} else {
						cor_unidade = #43717F
					}
				}
				draw_rectangle_color(x_davi + 128 - 40 - string_width(nome) - 5, novo_y - 180 - 40 - i * 45 - 5, x_davi + 128, novo_y - 180 - i * 45 + 5, c_black, c_black, c_black, c_black, false )
				draw_rectangle_color(x_davi + 128 - 40 - string_width(nome), novo_y - 180 - 40 - i * 45, x_davi + 123, novo_y - 180 - i * 45, cor_unidade, cor_unidade, cor_unidade, cor_unidade, false )
				draw_text(x_davi + 128 - 20 - string_width(nome), novo_y_roger - 180 - 40 - i * 45, nome)
				if point_in_rectangle(mx, my, x_davi + 128 - 10 - string_width(nome) - 5, novo_y - 180 - 40 - i * 45 - 5, x_davi + 128, novo_y - 180 - i * 45 + 5) {
					draw_rectangle_color(mx - 30 - string_width(descricao) - 5, my, mx - 20, my + string_height(descricao) + 10 + 5, c_black, c_black, c_black, c_black, false)
					draw_rectangle_color(mx - 30 - string_width(descricao) - 5, my - 5, mx - 15, my + string_height(descricao) + 10, #B28435, #B28435, #B28435, #B28435, false)
					draw_text(mx - 30 - string_width(descricao), my + 5, descricao)
					if mouse_check_button_pressed(mb_left) and !b {
						habilidade_davi = nome
						hab_davi = false
					} 
				} else if !aux {
					if mouse_check_button_pressed(mb_left) {
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
	
	if critico2 {
		draw_set_font(fnt_dialogos)
		draw_set_color(#990A0E)
		if receptor == obj_davi {
			draw_text(x_davi - 128 + (256 - string_width("CRITICO")) / 2, y_davi + 50, "CRÍTICO")
		} else if receptor == obj_personagem {
			draw_text(x_roger - 128 + (256 - string_width("CRITICO")) / 2, y_roger + 50, "CRÍTICO")
		} else {
			draw_text(x_inimigo - 128 + (256 - string_width("CRITICO")) / 2, y_inimigo + 50, "CRÍTICO")
		}
	}
	
	if errou2 {
		draw_set_font(fnt_dialogos)
		draw_set_color(#990A0E)
		if receptor == obj_davi {
			draw_text(x_davi - 128 + (256 - string_width("ERROU")) / 2, y_davi + 50, "ERROU")
		} else if receptor == obj_personagem {
			draw_text(x_roger - 128 + (256 - string_width("ERROU")) / 2, y_roger + 50, "ERROU")
		} else {
			draw_text(x_inimigo - 128 + (256 - string_width("ERROU")) / 2, y_inimigo + 50, "ERROU")
		}
	}
	
	if mensagem {
		if current_time / 1000 <= tempo {
			draw_set_color(c_white)
			draw_text((1920 - string_width(codigo)) / 2, 100, codigo)
		} else {
			mensagem = false
			mensagem_turno = true
		}
	}
	
	function vida(personagem, numero) {
		var _x = 0
		if personagem == "Roger" {
			_x = x_roger - 128 + (256 - string_width(numero)) / 2
			_y = y_roger
			draw_set_color(#9E0B0F)
			draw_text(_x, _y, string(numero))
		} else if personagem == "Davi" {
			_x = x_davi - 128 + (256 - string_width(numero)) / 2
			draw_set_color(#9E0B0F)
			_y = y_davi
			draw_text(_x, _y, string(numero))
		} else {
			_x = x_inimigo - 128 + (256 - string_width(numero)) / 2
			draw_set_color(#9E0B0F)
			_y = y_inimigo
			draw_text(_x, _y, string(numero))
		}
	}
	
	if inimigo.vida > 0 {
		if batalha {
			var ataque = 1
			var defesa = 1
			var atacou = true
			if executar {
				if sua_vez == 0 {
					sua_vez = 1
					_y = y_roger
					receptor = inimigo
					ataque = sqrt(obj_personagem.atributos.forca * variable_struct_get(armas, object_get_name(arma_roger))) //média geometrica 
					switch habilidade_roger {
						case "Sniper":
							if arma_roger == obj_metralhadora or arma_roger == obj_pistola {
								ataque *= 1.3
								mensagem = true
								tempo = current_time / 1000 + 3
								codigo = "Roger fuzila " + string(inimigo.nome) 
							}
							break
						case "Ferramenteiro":
							if arma_roger == obj_machado or arma_roger == obj_picareta {
								ataque *= 1.3
							}
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger corta " + string(inimigo.nome) 
							break
						case "Golpe da morte":
							if golpe_duplo {
								sua_vez = 1
								golpe_duplo = false
								mensagem = true
								tempo = current_time / 1000 + 3
								codigo = "Roger ataca novamente" 
								golpe_morte_tempo1 = true
							} else {
								golpe_duplo = true
								sua_vez = 0
								mensagem = true
								tempo = current_time / 1000 + 3
								codigo = "Roger ataca " + string(inimigo.nome) 
							}
							break
						case "Estoicismo":
							obj_personagem.atributos.humor = obj_personagem.humores[0]
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger fica NEUTRO"
							atacou = false
							obj_personagem.mudou_humor = true
							break
						case "Pensamentos intrusivos":
							obj_personagem.atributos.humor = obj_personagem.humores[3]
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger fica DEPRIMIDO"
							atacou = false
							obj_personagem.mudou_humor = true
							break
						case "Pensamentos intrusivos 2":
							obj_personagem.atributos.humor = obj_personagem.humores[2]
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger fica COLÉRICO"
							atacou = false
							obj_personagem.mudou_humor = true
							break
						case "Curandeiro aprendiz":
							obj_personagem.atributos.saude *= 1.33
							if obj_personagem.atributos.saude > 100 {
								obj_personagem.atributos.saude = 100
							}
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger se cura parcialmente"
							atacou = false
							break
						case "Curandeiro mestre":
							obj_personagem.atributos.saude = 100
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger se cura totalmente"
							atacou = false
							mestre_tempo1 = true
							break
						case "Parque de diversões":
							obj_personagem.atributos.humor = obj_personagem.humores[1]
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger fica EXTASIADO"
							obj_personagem.mudou_humor = true
							atacou = false
							break
						case "Concentração":
							ataque *= 1.2
							obj_personagem.atributos.resistencia *= 1.2
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger foca para melhorar sua performance"
							break
						case "Ataque":
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Roger ataca " + string(inimigo.nome)
							break
					}
					if atacou {
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
							if irandom_range(0, 25) == 0 {
								errou = true
							}
						} else {
							if irandom_range(0, 15) == 0 {
								errou = true
							}
						}
						var ataque_final
						if errou {
							ataque_final = 0
							errou2 = true
						} else if critico {
							critico2 = true
							ataque_final = round(random_range(0.9, 1.1) * ataque * 1.6 * (1 - inimigo.resistencia / 100))
						} else {
							ataque_final = round(random_range(0.9, 1.1) * ataque * (1 - inimigo.resistencia / 100))
						}
						inimigo.vida -= ataque_final
						obj = "inimigo"
						dano = ataque_final
						if habilidade_roger == "Concentração" {
							obj_personagem.atributos.resistencia /= 1.2
						}
					}
				} else if sua_vez == 1 {
					sua_vez = 2
					_y = y_davi
					receptor = inimigo
					ataque = sqrt(obj_davi.atributos.forca * variable_struct_get(armas, object_get_name(arma_davi)))
					switch habilidade_davi {
						case "Sniper":
							if arma_davi == obj_metralhadora or arma_davi == obj_pistola {
								ataque *= 1.3
							}
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi fuzila " + string(inimigo.nome)
							break
						case "Ferramenteiro":
							if arma_davi == obj_machado or arma_davi == obj_picareta {
								ataque *= 1.3
							}
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi corta " + string(inimigo.nome)
							break
						case "Golpe da morte":
							if golpe_duplo {
								sua_vez = 2
								golpe_duplo = false
								mensagem = true
								tempo = current_time / 1000 + 3
								codigo = "Davi ataca novamente" 
								golpe_morte_tempo2 = true
							} else {
								golpe_duplo = true
								sua_vez = 1
								mensagem = true
								tempo = current_time / 1000 + 3
								codigo = "Davi ataca " + string(inimigo.nome) 
							}
							break
						case "Estoicismo":
							obj_davi.atributos.humor = obj_davi.humores[0]
							atacou = false
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi fica NEUTRO"
							obj_davi.mudou_humor = true
							break
						case "Pensamentos intrusivos":
							obj_davi.atributos.humor = objobj_davi_personagem.humores[3]
							atacou = false
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi fica DEPRIMIDO"
							obj_davi.mudou_humor = true
							break
						case "Pensamentos intrusivos 2":
							obj_davi.atributos.humor = obj_davi.humores[2]
							atacou = false
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi fica COLÉRICO"
							obj_davi.mudou_humor = true
							break
						case "Curandeiro aprendiz":
							obj_davi.atributos.saude *= 1.33
							if obj_davi.atributos.saude > 100 {
								obj_davi.atributos.saude = 100
							}
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi se cura parcialmente"
							atacou = false
							break
						case "Curandeiro mestre":
							obj_davi.atributos.saude = 100
							atacou = false
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi se cura totalmente"
							mestre_tempo2 = true
							break
						case "Parque de diversões":
							obj_davi.atributos.humor = obj_davi.humores[1]
							atacou = false
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi fica EXTASIADO"
							obj_davi.mudou_humor = true
							break
						case "Concentração":
							ataque *= 1.2
							obj_davi.atributos.resistencia *= 1.2
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi foca para melhorar suas habilidades"
							break
						case "Ataque":
							mensagem = true
							tempo = current_time / 1000 + 3
							codigo = "Davi ataca " + string(inimigo.nome)
							break
					}
					if atacou {
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
							if irandom_range(0, 25) == 0 {
								errou = true
							}
						} else {
							if irandom_range(0, 15) == 0 {
								errou = true
							}
						}
						var ataque_final = 0
						if errou {
							errou2 = true
							ataque_final = 0
						} else if critico {
							critico2 = true
							ataque_final = round(random_range(0.9, 1.1) * ataque * 1.6 * (1 - inimigo.resistencia / 100))
						} else {
							ataque_final = round(random_range(0.9, 1.1) * ataque * (1 - inimigo.resistencia / 100))
						}
						inimigo.vida -= ataque_final
						obj = "inimigo"
						dano = ataque_final
						if habilidade_davi == "Concentracao" {
							obj_davi.atributos.resistencia /= 1.2
						}
					}
				} else {
					ataque = 0
					_y = y_inimigo
					//vez do inimigo
					var critico = false
					var errou = false
					if inimigo.sagacidade > 85 {
						if irandom_range(0, 6) == 0 {
							critico = true
						}
					} else if inimigo.sagacidade > 50 {
						if irandom_range(0, 12) == 0 {
							critico = true
						}
					} else if inimigo.sagacidade > 30 {
						if irandom_range(0, 25) == 0 {
							errou = true
						}
					} else {
						if irandom_range(0, 15) {
							errou = true
						}
					}
					var ataque_final = 0
					if irandom_range(0, 1) == 1 {
						obj = "Roger"
						receptor = obj_personagem
						if errou {
							errou2 = true
							ataque_final = 0
						} else if critico {
							critico2 = true
							ataque_final = round(inimigo.forca * 1.6 * (1 - obj_personagem.atributos.resistencia / 100))
						} else {
							ataque_final = round(inimigo.forca * (1 - obj_personagem.atributos.resistencia / 100))
						}
						obj_personagem.atributos.saude -= ataque_final
						mensagem = true
						codigo = string(inimigo.nome) + " ataca Roger"
						tempo = current_time / 1000 + 3
					} else {
						obj = "Davi"
						receptor = obj_davi
						if errou {
							errou2 = true
							ataque_final = 0
						} else if critico {
							critico2 = true
							ataque_final = round(inimigo.forca * 1.6 * (1 - obj_davi.atributos.resistencia / 100))
						} else {
							ataque_final = round(inimigo.forca * (1 - obj_davi.atributos.resistencia / 100))
						}
						ataque_final = round(ataque_final * random_range(0.9, 1.1))
						obj_davi.atributos.saude -= ataque_final
						mensagem = true
						codigo = string(inimigo.nome) + " ataca Davi"
						tempo = current_time / 1000 + 3
					}		
					dano = ataque_final
					ataque_inimigo = true
				}
			}
			executar = false
			if current_time / 1000 < tempo_turno {
				if atacou {
					vida(obj, dano)
				} else {
					obj = noone
					dano = ""
				}
			} else {
				if ataque_inimigo {
					executar = false
					batalha = false
					sua_vez = 0
					ataque_inimigo = false
					contagem = true
				} else {
					tempo_turno = current_time / 1000 + 3
					executar = true
				}
				errou2 = false
				critico2 = false
			}
			largura_inimigo = (246 * inimigo.vida / inimigo.total_vida < 0) ? 0 : 246 * inimigo.vida / inimigo.total_vida
			largura_davi = (246 * obj_davi.atributos.saude / 100 < 0 ) ? 0 : 246 * obj_davi.atributos.saude / 100
			largura_roger = (246 * obj_personagem.atributos.saude / 100 < 0) ? 0 : 246 * obj_personagem.atributos.saude / 100
		} else {
			if mensagem_turno {
				mensagem = true
				codigo = "É seu turno!"
				tempo = current_time / 1000 + 3
			}
			if contagem {
				contagem = false
				if golpe_morte_tempo1 {
					golpe_morte_numero1++
					if golpe_morte_numero1 > 5 {
						golpe_morte_numero1 = 1
						golpe_morte_tempo1 = false
					}
				}
				if mestre_tempo1 {
					mestre_numero1++
					if mestre_numero1 > 3 {
						mestre_numero1 = 1
						mestre_tempo1 = false
					}
				}
				if golpe_morte_tempo2 {
					golpe_morte_numero2++
					if golpe_morte_numero2 > 5 {
						golpe_morte_numero2 = 1
						golpe_morte_tempo2 = false
					}
				}
				if mestre_tempo2 {
					mestre_numero2++
					if mestre_numero2 > 3 {
						mestre_numero2 = 1
						mestre_tempo2 = false
					}
				}
			}
		}
	} else {
		mensagem = true
		codigo = "Batalha concluída"
		tempo = current_time / 1000 + 3
		if mouse_check_button_pressed(mb_left) {
			batalha = false
			clicou = false
			derrotou = true
			global.tem_tela_aberta = false
			if !seguir {
				obj_personagem.atributos.forca = round(obj_personagem.atributos.forca * 1.09)
				obj_personagem.atributos.resistencia = round(obj_personagem.atributos.resistencia * 1.09)
				obj_personagem.atributos.sagacidade = round(obj_personagem.atributos.sagacidade * 1.09)
				obj_personagem.atributos.fortuna = round(obj_personagem.atributos.fortuna * 1.09)
			
				obj_davi.atributos.forca = round(obj_davi.atributos.forca * 1.09)
				obj_davi.atributos.resistencia = round(obj_davi.atributos.resistencia * 1.09)
				obj_davi.atributos.sagacidade = round(obj_davi.atributos.sagacidade * 1.09)
				obj_davi.atributos.fortuna = round(obj_davi.atributos.fortuna * 1.09)
				
				seguir = true
			}
		}
	}
}