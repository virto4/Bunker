/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if question {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale, scale, 0, c_white, 1)
	if scale < 5 {
		scale += 0.5
	} else {
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		draw_set_color(c_black)
		draw_set_font(fnt_dialogos)
		draw_text(220, 800, "Você deseja enfrentar um inimigo desconhecido?")
		if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
			if !mouse_aux1 {
				mouse_aux1 = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				question = false
				etapa2 = true
				escureceu = true
			}
		} else if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
			if !mouse_aux2 {
				mouse_aux2 = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				question = false
				etapa2 = true
				global.tem_tela_aberta = false
			}
		}
		draw_text(300, 940, "Sim")
		draw_text(1620, 940, "Não")
	}
}

function recarrega(obj, arma) {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	
	var text = "Sua arma precisa ser recarregada; clique nela para fazer isso"
	var text2 = "Você está sem munições"
	var recarregar = false
	if obj_personagem.qtde_itens1.obj_municao > 0 {
		recarregar = true
	}
	
	var xis = 0
	
	if obj == obj_personagem {
		xis = 390
	} else if obj == obj_davi {
		xis = 1524
	}
	if recarregar {
		if arma == obj_pistola {
			tiros_pistola = 10
		} else if arma == obj_metralhadora {
			tiros_metra = 8
		}
		if point_in_circle(mx, my, xis, 894, 38) {
			draw_rectangle_color(mx + 50, my, mx + 60 + string_width(text) + 5, my + string_height(text) + 10 + 5, c_black, c_black, c_black, c_black, false)
			draw_rectangle_color(mx + 50, my - 5, mx + 60 + string_width(text), my + string_height(text) + 10, #B28435, #B28435, #B28435, #B28435, false)
			draw_text(mx + 60, my + 5, text)
			if mouse_check_button_pressed(mb_left) {
				if instance_exists(obj_municao) {
					obj_municao.qtde_itens--
					if obj_municao.qtde_itens <= 0 {
						instance_destroy(obj_municao)
					}
				} else {
					if obj_personagem.slot1 == obj_municao {
						obj_personagem.slot1 = noone
					} else if obj_personagem.slot2 == obj_municao {
						obj_personagem.slot2 = noone
					} else if obj_personagem.slot3 == obj_municao {
						obj_personagem.slot3 = noone
					} else if obj_personagem.slot4 == obj_municao {
						obj_personagem.slot4 = noone
					} else {
						obj_personagem.slot5 = noone
					}
				}
			}
		}
	} else {
		if point_in_circle(mx, my, xis, 894, 38) {
			draw_rectangle_color(mx + 50, my, mx + 60 + string_width(text2) + 5, my + string_height(text2) + 10 + 5, c_black, c_black, c_black, c_black, false)
			draw_rectangle_color(mx + 50, my - 5, mx + 60 + string_width(text2), my + string_height(text2) + 10, #B28435, #B28435, #B28435, #B28435, false)
			draw_text(mx + 60, my + 5, text2)
		}
	}
}

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
	if hab_roger and !batalha {
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
			if point_in_rectangle(mx, my, x_roger - 128 - 5, novo_y_roger - 180 - 40 - i * 45, x_roger + 10 + string_width(nome) + 4, novo_y_roger - 180 - i * 45) {
				if !aaa {
					i_selecionado = i
					i_selecionado_novo = i
					aaa = true
				} 
				i_selecionado = i
				if i_selecionado != i_selecionado_novo {
					i_selecionado_novo = i_selecionado
					audio_play_sound(snd_menu_mouse, 1, false)
				}
		
				draw_rectangle_color(mx + 50, my, mx + 60 + string_width(descricao) + 5, my + string_height(descricao) + 10 + 5, c_black, c_black, c_black, c_black, false)
				draw_rectangle_color(mx + 50, my - 5, mx + 60 + string_width(descricao), my + string_height(descricao) + 10, #B28435, #B28435, #B28435, #B28435, false)
				draw_text(mx + 60, my + 5, descricao)
				if mouse_check_button_pressed(mb_left) and !c {
					audio_play_sound(snd_menu_in, 1, false)
					habilidade_roger = nome
					hab_roger = false
				}
			} else if !aux {
				if mouse_check_button_pressed(mb_left) {
					audio_play_sound(snd_menu_out, 1, false)
					aaa = false
					hab_roger = false
				}
			}
		}
	}
	
	largura_pistola = 70 * tiros_pistola / 10
	largura_metra = 70 * tiros_metra / 8
	
		
	if arma_roger == obj_pistola {
		draw_rectangle_color(390 - 40, 894 + 40, 390 + 40, 894 + 65, c_black, c_black, c_black, c_black, false )
		draw_rectangle_color(390 - 40 + 5, 894 + 45, 390 - 35 + largura_pistola, 894 + 60, #2E7F0E, #2E7F0E, #2E7F0E, #2E7F0E, false )
		if tiros_pistola == 0 {
			recarrega(obj_personagem, obj_pistola)
		}
	}
	if arma_davi == obj_pistola {
		draw_rectangle_color(1524 - 40, 894 + 40, 1524 + 40, 894 + 65, c_black, c_black, c_black, c_black, false )
		draw_rectangle_color(1524 - 40 + 5, 894 + 45, 1524 - 35 + largura_pistola, 894 + 60, #2E7F0E, #2E7F0E, #2E7F0E, #2E7F0E, false )
		if tiros_pistola == 0 {
			recarrega(obj_davi, obj_pistola)
		}
	}
	if arma_roger == obj_metralhadora {
		draw_rectangle_color(390 - 40, 894 + 40, 390 + 40, 894 + 65, c_black, c_black, c_black, c_black, false )
		draw_rectangle_color(390 - 40 + 5, 894 + 45, 390 - 35 + largura_metra, 894 + 60, #2E7F0E, #2E7F0E, #2E7F0E, #2E7F0E, false )
		if tiros_metra == 0 {
			recarrega(obj_personagem, obj_metralhadora)
		}
	}
	if arma_davi == obj_metralhadora {
		draw_rectangle_color(1524 - 40, 894 + 40, 1524 + 40, 894 + 65, c_black, c_black, c_black, c_black, false )
		draw_rectangle_color(1524 - 40 + 5, 894 + 45, 1524 - 35 + largura_metra, 894 + 60, #2E7F0E, #2E7F0E, #2E7F0E, #2E7F0E, false )
		if tiros_metra == 0 {
			recarrega(obj_davi, obj_metralhadora)
		}	
	}
	
	if selecionar_arma_roger and !batalha {
		for (var i = 0; i <= array_length(obj_personagem.armas_pegas); i++) {
			if i < array_length(obj_personagem.armas_pegas) {
				if obj_personagem.armas_pegas[i] == arma_davi or obj_personagem.armas_pegas[i] == arma_roger {
					continue
				}
			}
			var width = 0
			var heigth = 0
			if i < array_length(obj_personagem.armas_pegas) {
				width = sprite_get_width(object_get_sprite(obj_personagem.armas_pegas[i]))
				heigth = sprite_get_height(object_get_sprite(obj_personagem.armas_pegas[i]))
			} else {
				width = sprite_get_width(object_get_sprite(obj_punhos))
				heigth = sprite_get_height(object_get_sprite(obj_punhos))
			}
			maior = width
			if width < heigth {
				maior = heigth
			}
			if point_in_circle(mx, my, 390 + arma_x_roger * 80, 894, 40) { //davi
				if !bbb {
					i_selecionadob = i
					i_selecionado_novob = i
					bbb = true
				} 
				i_selecionadob = i
				if i_selecionadob != i_selecionado_novob {
					i_selecionado_novob = i_selecionadob
					audio_play_sound(snd_menu_mouse, 1, false)
				}
				if mouse_check_button_pressed(mb_left) {
					audio_play_sound(snd_menu_in, 1, false)
					if i < array_length(obj_personagem.armas_pegas) {
						arma_roger = obj_personagem.armas_pegas[i]
					} else {
						arma_roger = obj_punhos
					}
					selecionar_arma_roger = false
					break
				}
			} else if !aux {
				if mouse_check_button_pressed(mb_left) {
					audio_play_sound(snd_menu_out, 1, false)
					selecionar_arma_roger = false
				}
			}
			if point_in_circle(mx, my, 390 + arma_x_roger * 80, 894, 40) {
				cor_circulo = #649910
			} else {
				cor_circulo = #2E7F0E
			}
			draw_circle_color(390 + arma_x_roger * 80, 894,30, cor_circulo, cor_circulo, false)
			if i < array_length(obj_personagem.armas_pegas) {
				draw_sprite_ext(object_get_sprite(obj_personagem.armas_pegas[i]), 0, 390 + arma_x_roger* 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
			} else {
				draw_sprite_ext(object_get_sprite(obj_punhos), 0, 390 + arma_x_roger* 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
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
			for (var i = 0; i <= array_length(obj_personagem.armas_pegas); i++) {
				if i < array_length(obj_personagem.armas_pegas) {
					if (obj_personagem.armas_pegas[i] == arma_davi or obj_personagem.armas_pegas[i] == arma_roger) {
						continue
					}
				}
				var width = 0
				var heigth = 0
				if i == array_length(obj_personagem.armas_pegas) {
					width = sprite_get_width(object_get_sprite(obj_punhos))
					heigth = sprite_get_height(object_get_sprite(obj_punhos))
				} else {
					width = sprite_get_width(object_get_sprite(obj_personagem.armas_pegas[i]))
					heigth = sprite_get_height(object_get_sprite(obj_personagem.armas_pegas[i]))
				}
				maior = width
				if width < heigth {
					maior = heigth
				}
				if point_in_circle(mx, my, 1524 - arma_x_davi * 80, 894, 40) { //davi
					if !bbb {
						i_selecionadob = i
						i_selecionado_novob = i
						bbb = true
					} 
					i_selecionadob = i
					if i_selecionadob != i_selecionado_novob {
						i_selecionado_novob = i_selecionadob
						audio_play_sound(snd_menu_mouse, 1, false)
					}
					if mouse_check_button_pressed(mb_left) {
						audio_play_sound(snd_menu_in, 1, false)
						if i == array_length(obj_personagem.armas_pegas) {
							arma_davi = obj_punhos
						} else {
							arma_davi = obj_personagem.armas_pegas[i]
						}
						selecionar_arma_davi = false
						break
					}
				} else if !aux {
					if mouse_check_button_pressed(mb_left) {
						audio_play_sound(snd_menu_out, 1, false)
						selecionar_arma_davi = false
					}
				}
				if point_in_circle(mx, my, 1524 - arma_x_davi * 80, 894, 40) {
					cor_circulo = #649910
				} else {
					cor_circulo = #2E7F0E
				}
				draw_circle_color(1524 - arma_x_davi * 80, 894,30, cor_circulo, cor_circulo, false)
				if i == array_length(obj_personagem.armas_pegas) {
					draw_sprite_ext(object_get_sprite(obj_punhos), 0, 1524 - arma_x_davi * 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
				} else {
					draw_sprite_ext(object_get_sprite(obj_personagem.armas_pegas[i]), 0, 1524 - arma_x_davi * 80, 894, 64 / maior, 64 / maior, 0, c_white, 1)
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
				if point_in_rectangle(mx, my, x_davi + 128 - 10 - string_width(nome), novo_y - 180 - 40 - i * 45, x_davi + 128, novo_y - 180 - i * 45) {
					if !aaa {
						i_selecionado = i
						i_selecionado_novo = i
						aaa = true
					} 
					i_selecionado = i
					if i_selecionado != i_selecionado_novo {
						i_selecionado_novo = i_selecionado
						audio_play_sound(snd_menu_mouse, 1, false)
					}
		
					draw_rectangle_color(mx - 30 - string_width(descricao) - 5, my, mx - 20, my + string_height(descricao) + 10 + 5, c_black, c_black, c_black, c_black, false)
					draw_rectangle_color(mx - 30 - string_width(descricao) - 5, my - 5, mx - 15, my + string_height(descricao) + 10, #B28435, #B28435, #B28435, #B28435, false)
					draw_text(mx - 30 - string_width(descricao), my + 5, descricao)
					if mouse_check_button_pressed(mb_left) and !b {
						audio_play_sound(snd_menu_in, 1, false)
						habilidade_davi = nome
						hab_davi = false
					} 
				} else if !aux {
					if mouse_check_button_pressed(mb_left) {
						audio_play_sound(snd_menu_out, 1, false)
						aaa = false
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
				atirou = true
				if sua_vez == 0 {
					if instance_exists(obj_davi) {
						sua_vez = 1
					} else {
						sua_vez = 2
					}
					_y = y_roger
					receptor = inimigo
					ataque = sqrt(obj_personagem.atributos.forca * variable_struct_get(armas, object_get_name(arma_roger))) //média geometrica 
					ataque = ataque / (ataque + 20) * 100
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

						if !roger_som {
							roger_som = true
							switch arma_roger {
								case obj_metralhadora:
									audio_play_sound(snd_metralhadora, 1, false)
									break
								case obj_pistola:
									audio_play_sound(snd_pistola, 1, false)
									break
								case obj_machado:
									audio_play_sound(snd_machado, 1, false)
									break
								case obj_picareta:
									audio_play_sound(snd_picareta, 1, false)
									break
							}
						}
						
						if arma_roger == obj_metralhadora {
							tiros_metra--
						} else if arma_roger == obj_pistola {
							tiros_pistola--
						}
						
						var sag = obj_personagem.atributos.sagacidade;

						var chance_critico = clamp((sag - 30) / 5, 0, 25);
						var chance_erro    = clamp((40 - sag) / 5, 0, 16);

						var rolagem = irandom(99);
						var critico = (rolagem < chance_critico);
						var errou   = (!critico && rolagem > 99 - chance_erro);

 						var ataque_final = 0
						if errou {
							ataque_final = 0
							errou2 = true
						} else if critico {
							critico2 = true
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * 1.6 * (1 - power(inimigo.resistencia / 100, 1.3))
						} else {
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * (1 - power(inimigo.resistencia / 100, 1.3))
						}
						ataque_final = round(lerp(ataque_final, random_range(ataque_final * 0.8, ataque_final * 1.2), 0.25))
						inimigo.vida -= ataque_final
						obj = "inimigo"
						dano = ataque_final
						if habilidade_roger == "Concentração" {
							obj_personagem.atributos.resistencia /= 1.2
						}
					}
				} else if sua_vez == 1 and instance_exists(obj_davi) {
					sua_vez = 2
					_y = y_davi
					receptor = inimigo
					ataque = sqrt(obj_personagem.atributos.forca * variable_struct_get(armas, object_get_name(arma_roger))) //média geometrica 
					ataque = ataque / (ataque + 20) * 100
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
						
						if !davi_som {
							davi_som = true
							switch arma_davi {
								case obj_metralhadora:
									audio_play_sound(snd_metralhadora, 1, false)
									break
								case obj_pistola:
									audio_play_sound(snd_pistola, 1, false)
									break
								case obj_machado:
									audio_play_sound(snd_machado, 1, false)
									break
								case obj_picareta:
									audio_play_sound(snd_picareta, 1, false)
									break
							}
						}
						
						if arma_davi == obj_metralhadora {
							tiros_metra--
						} else if arma_davi == obj_pistola {
							tiros_pistola--
						}
						
						var sag = obj_davi.atributos.sagacidade;

						var chance_critico = clamp((sag - 30) / 5, 0, 25);
						var chance_erro    = clamp((40 - sag) / 5, 0, 16);

						var rolagem = irandom(99);
						var critico = (rolagem < chance_critico);
						var errou   = (!critico && rolagem > 99 - chance_erro);

 						var ataque_final = 0
						if errou {
							ataque_final = 0
							errou2 = true
						} else if critico {
							critico2 = true
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * 1.6 * (1 - power(inimigo.resistencia / 100, 1.3))
						} else {
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * (1 - power(inimigo.resistencia / 100, 1.3))
						}
						ataque_final = round(lerp(ataque_final, random_range(ataque_final * 0.8, ataque_final * 1.2), 0.25))
						inimigo.vida -= ataque_final
						obj = "inimigo"
						dano = ataque_final
						if habilidade_davi == "Concentracao" {
							obj_davi.atributos.resistencia /= 1.2
						}
					}
				} else {
					audio_play_sound(snd_golpe_inimigo, 1, false)
					ataque = 0
					_y = y_inimigo
					//vez do inimigo
					
					var sag = inimigo.sagacidade;
					var chance_critico = clamp((sag - 30) / 5, 0, 25);
					var chance_erro    = clamp((40 - sag) / 5, 0, 16);
					var rolagem = irandom(99);
					var critico = (rolagem < chance_critico);
					var errou   = (!critico && rolagem > 99 - chance_erro)
					var ataque_final = 0
					if irandom_range(0, 1) == 1 or !instance_exists(obj_davi) {
						obj = "Roger"
						receptor = obj_personagem
						if errou {
							ataque_final = 0
							errou2 = true
						} else if critico {
							critico2 = true
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * 1.6 * (1 - power(obj_personagem.atributos.resistencia / 100, 1.3))
						} else {
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * (1 - power(obj_personagem.atributos.resistencia / 100, 1.3))
						}
						ataque_final = round(lerp(ataque_final, random_range(ataque_final * 0.8, ataque_final * 1.2), 0.25))
					
						obj_personagem.atributos.saude -= ataque_final
						mensagem = true
						codigo = string(inimigo.nome) + " ataca Roger"
						tempo = current_time / 1000 + 3
					} else {
						obj = "Davi"
						receptor = obj_davi
						if errou {
							ataque_final = 0
							errou2 = true
						} else if critico {
							critico2 = true
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * 1.6 * (1 - power(obj_davi.atributos.resistencia / 100, 1.3))
						} else {
							ataque_final = random_range(0.9, 1.1) * (ataque * 0.8 + 5) * (1 - power(obj_davi.atributos.resistencia / 100, 1.3))
						}
						ataque_final = round(lerp(ataque_final, random_range(ataque_final * 0.8, ataque_final * 1.2), 0.25))
					
						obj_davi.atributos.saude -= ataque_final
						mensagem = true
						codigo = string(inimigo.nome) + " ataca Davi"
						tempo = current_time / 1000 + 3
					}		
					dano = ataque_final
					ataque_inimigo = true
				}
			}
			davi_som = false
			roger_som = false
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
			if instance_exists(obj_davi) {
				largura_davi = (246 * obj_davi.atributos.saude / 100 < 0 ) ? 0 : 246 * obj_davi.atributos.saude / 100
			}
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
		venceu = true
		if mouse_check_button_pressed(mb_left) {
			escureceu2 = true
			if !seguir {
				obj_personagem.atributos.forca = round(obj_personagem.atributos.forca * 1.09)
				obj_personagem.atributos.resistencia = round(obj_personagem.atributos.resistencia * 1.09)
				obj_personagem.atributos.sagacidade = round(obj_personagem.atributos.sagacidade * 1.09)
				obj_personagem.atributos.fortuna = round(obj_personagem.atributos.fortuna * 1.09)
				if instance_exists(obj_davi) {
					obj_davi.atributos.forca = round(obj_davi.atributos.forca * 1.09)
					obj_davi.atributos.resistencia = round(obj_davi.atributos.resistencia * 1.09)
					obj_davi.atributos.sagacidade = round(obj_davi.atributos.sagacidade * 1.09)
					obj_davi.atributos.fortuna = round(obj_davi.atributos.fortuna * 1.09)
					obj_davi.forca_padrao = obj_davi.atributos.forca
					obj_davi.fortuna_padrao = obj_davi.atributos.fortuna
					obj_davi.resistencia_padrao = obj_davi.atributos.resistencia
					obj_davi.sagacidade_padrao = obj_davi.atributos.sagacidade
				}
				obj_personagem.forca_padrao = obj_personagem.atributos.forca
				obj_personagem.fortuna_padrao = obj_personagem.atributos.fortuna
				obj_personagem.resistencia_padrao = obj_personagem.atributos.resistencia
				obj_personagem.sagacidade_padrao = obj_personagem.atributos.sagacidade
		
				seguir = true
	
				loots = []
				var sorte = 0
				if instance_exists(obj_davi) {
					sorte = sqrt(obj_davi.atributos.fortuna * obj_personagem.atributos.fortuna)
				} else {
					sorte = obj_personagem.atributos.fortuna
				}
				sorte = sorte / (sorte + 30) * 100
				var qtde_loots = irandom(sorte div 10)
				var loots_coletados = 0
				var probabilidades = {
					"obj_municao": 0.2 + (sorte div 10) / 20,
					"obj_pilha": 0.01 + (sorte div 10) / 20,
					"obj_batata": 0.08 + (sorte div 10) / 20,
					"obj_cookie": 0.09 + (sorte div 10) / 20,
					"obj_arroz": 0.01 + (sorte div 10) / 20,
					"obj_frango": 0.1 + (sorte div 10) / 20,
					"obj_repolho": 0.05 + (sorte div 10) / 20,
					"obj_agua": 0.5 + (sorte div 10) / 20,
					"obj_curativo": 0.1 + (sorte div 10) / 20,
					"obj_antibiotico": 0.2 + (sorte div 10) / 20,
				}
				for (var i = 0; i < array_length(struct_get_names(probabilidades)); i++) {
					if random(1) < variable_struct_get(probabilidades, struct_get_names(probabilidades)[i]) and loots_coletados <= qtde_loots {
						loots_coletados++
						array_push(loots, struct_get_names(probabilidades)[i])
						var is_alimento = false
						for (var j = 0; j < array_length(global.alimentos); j++) {
							if object_get_name(global.alimentos[j]) == struct_get_names(probabilidades)[i] {
								is_alimento = true
							}
						}
						if is_alimento {
							for (var j = 0; j < array_length(obj_freezer.quantidades); j++) {
								if object_get_name(obj_freezer.quantidades[j][0]) == struct_get_names(probabilidades)[i] {
									obj_freezer.quantidades[j][1]++
								}
							}
						} else {
							var object = asset_get_index(struct_get_names(probabilidades)[i]);
							if !instance_exists(object) {
								var pos = variable_struct_get(global.posicoes, object_get_name(object))
								var ax = variable_struct_get(pos, "x")
								var ay = variable_struct_get(pos, "y")
								instance_create_layer(ax, ay, layer_get_id("Instances"), object, {})
							} else {
								object.qtde_itens += 1	
							}
						}
						variable_struct_set(obj_personagem.qtde_itens1, struct_get_names(probabilidades)[i], variable_struct_get(obj_personagem.qtde_itens1, struct_get_names(probabilidades)[i]) + 1)
					}
				}
			}
		}
	}
} else if final {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale < 5 {
		scale += 0.5
	} else if scale >= 5 {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var texto = ""
		if array_length(loots) > 0 {
			texto = "Enquanto seu inimigo jazia morto no chão, você coletou dele: "
			for (var i = 0; i < array_length(loots); i++) {
				texto += variable_struct_get(global.nomes, loots[i]) + "; "
			}
		} else {
			texto = "Você não conseguiu coletar nada"
		}
		var linhas = quebrar_texto(texto, 1520)
		for (var i = 0; i < array_length(linhas); i++) {
			draw_text(200, 760 + i * string_height("A") + 5, linhas[i])
		}
		if mouse_check_button_pressed(mb_left) {
			final = false
			etapa2 = true
			global.tem_tela_aberta = false
		}
	}
}
if instance_exists(obj_davi) and clicou {
	if obj_davi.atributos.saude <= 0 {
		if sua_vez == 1 {
			sua_vez = 2
		}
		if morte_davi_aux {
			morte_davi = true
			morte_davi_aux = false
		}
	}
}

if morte_davi and clicou {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_morte)
	if !etapa2_morte and alpha_morte < 1 {
		if alpha_morte < 1 {
			alpha_morte += 0.05
		} 
	} else if !etapa2_morte {
		var msg_game_over = "Ele levou a pior enquanto lutava pela soberania do Bunker, embora o tenha feito bravamente"
		if !aux1 {
			aux1 = true
			tempo_over = current_time / 1000 + 1.5
		}
		draw_set_font(fnt_alagard)
		draw_set_color(c_white)
		var _txt = "Davi morreu"
		draw_text(960 - string_width(_txt) / 2, 540 - string_height(_txt), _txt)
		draw_set_font(fnt_dialogos)
		if tempo_over < current_time / 1000 {
			draw_text(960 - string_width(msg_game_over) / 2, 660, msg_game_over)
			if pode_comecar {
				tempo_over2 = current_time / 1000 + 1.5
				pode_comecar = false
			}
		}
		if tempo_over2 < current_time / 1000 and !pode_comecar {
			var data_morte = "Data da morte: " + string(obj_calendario.dia_atual) + " de " + string(mes)
			draw_text(960 - string_width(data_morte) / 2, 760, data_morte)
			if pode_comecar2 {
				tempo_over3 = current_time / 1000 + 1.5
				pode_comecar2 = false
			}
		}
		if tempo_over3 < current_time / 1000 and !pode_comecar2 {
			var msg_tela_inicial = "Voltar para a batalha"
			var xinicial = 960 - string_width(msg_tela_inicial) / 2 - 5
			var xfinal = xinicial + string_width(msg_tela_inicial) + 5
			var yinicial = 860 - 5
			var yfinal = 860 + string_height(msg_tela_inicial) + 5
			draw_rectangle_color(xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5, cor_botao, cor_botao, cor_botao, cor_botao, false)
			draw_rectangle_color(xinicial, yinicial, xfinal, yfinal, c_black, c_black, c_black, c_black, false)
			draw_text(960 - string_width(msg_tela_inicial) / 2, 860, msg_tela_inicial)
			if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5) {
				cor_botao = #527F7F
				if mouse_check_button_pressed(mb_left) {
					etapa2_morte = true
					instance_destroy(obj_davi)
				}
			} else {
				cor_botao = c_white
			}
		}
	} else if etapa2_morte {
		if alpha_morte > 0 {
			alpha_morte -= 0.05
		} else {
			etapa2_morte = false
			morte_davi = false
		}
	}
}

if etapa2 {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale, scale, 0, c_white, 1)
	if scale > 0 {
		scale -= 0.5
	} else if scale == 0 {
		etapa2 = false
	}
}

if escureceu {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_morte)
	if !escureceu_aux {
		if alpha_morte < 1 {
			alpha_morte += 0.05
		} else {
			iniciar_batalha()
			escureceu_aux = true
		}
	} else {
		if alpha_morte > 0 {
			alpha_morte -= 0.05
		} else {
			escureceu = false
			escureceu_aux = false
		}
	}
}

if escureceu2 {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_morte)
	if !escureceu_aux {
		if alpha_morte < 1 {
			alpha_morte += 0.05
		} else {
			if audio_is_playing(musicas[musica]) {
				audio_stop_sound(musicas[musica])
			}
			clicou = false
			derrotou = true 
			final = true 
			escureceu_aux = true
		}
	} else {
		if alpha_morte > 0 {
			alpha_morte -= 0.05
		} else {
			escureceu2 = false
		}
	}
}

if escureceu3 {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_morte)
	if !escureceu_aux {
		if alpha_morte < 1 {
			alpha_morte += 0.05
		} else {
			audio_stop_sound(musicas[musica])
			derrotou = true
			global.tem_tela_aberta = false
			clicou = false
			escureceu_aux = true
		}
	} else {
		if alpha_morte > 0 {
			alpha_morte -= 0.05
		} else {
			escureceu3 = false
		}
	}
}