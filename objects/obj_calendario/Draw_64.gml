/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	draw_sprite(spr_voltar, 0, 1800, 50)
	draw_rectangle_color(260, 50, 1660, 330, #CCC7A3, #CCC7A3, #CCC7A3, #CCC7A3, false)
	draw_rectangle_color(460, 330, 1660, 1030, #B7C9CC, #B7C9CC, #B7C9CC, #B7C9CC, false)
	draw_rectangle_color(260, 330, 460, 1030, #CCB1B1, #CCB1B1, #CCB1B1, #CCB1B1, false)
	var _x = 260
	var _y = 50
	for (var i = 0; i < 8; i++) {
		draw_line_color(260, _y, 1660, _y, c_black, c_black)
		_y += 140
	}
	draw_line_color(_x, 50, _x, 1030, c_black, c_black)
	_x += 200
	for (var i = 0; i < 6; i++) {
		draw_line_color(_x, 190, _x, 1030, c_black, c_black)
		_x += 200
	}
	draw_line_color(_x, 50, _x, 1030, c_black, c_black)
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	draw_text(280, 204, "Domingo")
	draw_text(480, 204, "Segunda")
	draw_text(680, 204, "Terça")
	draw_text(880, 204, "Quarta")
	draw_text(1080, 204, "Quinta")
	draw_text(1280, 204, "Sexta")
	draw_text(1480, 204, "Sábado")
	var mes_escrito = ""
	var dia_primeiro = ""
	var semana = 1
	switch mes_atual {
		//d - 1; s - 2; t - 3; q - 4; q - 5; s - 6; s - 7
		case 7:
			mes_escrito = "Julho"
			dia_primeiro = 1 //domingo
			break
		case 8:
			mes_escrito = "Agosto"
			dia_primeiro = 4 //quarta
			break
		case 9:
			mes_escrito = "Setembro"
			dia_primeiro = 7 //sabado
			break
		case 10:
			mes_escrito = "Outubro"
			dia_primeiro = 2 //segunda
			break
		case 11:
			mes_escrito = "Novembro"
			dia_primeiro = 5
			break
		case 12:
			mes_escrito = "Dezembro"
			dia_primeiro = 7
			break
	}
	draw_text(260 + (1400 - string_width(mes_escrito)) / 2, 50 + (140 - string_height(mes_escrito)) / 2, mes_escrito)
	var x_dia = 0
	var y_dia = 0
	var dia_semana = dia_primeiro
	for (var i = 1; i <= 31; i++) {
		if i == 31 and mes_atual == 9 or mes_atual == 11 {
			break
		}
		switch semana {
			case 1:
				y_dia = 344
				break
			case 2: 
				y_dia = 484
				break
			case 3:
				y_dia = 624
				break
			case 4:
				y_dia = 764
				break
			case 5: 
				y_dia = 904
				break
		}
		switch dia_semana {
			case 1:	
				x_dia = 280
				break
			case 2: 
				x_dia = 480
				break
			case 3:
				x_dia = 680
				break
			case 4:
				x_dia = 880
				break
			case 5: 
				x_dia = 1080
				break
			case 6:
				x_dia = 1280
				break
			case 7:
				x_dia = 1480
				break
		}
		
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(x_dia, y_dia, i)
		
		if dia_atual == i {
			draw_circle(x_dia + 80, y_dia + 56, 100, true)
		}
		
		dia_semana++
		if dia_semana > 7 {
			dia_semana = 1
			semana++
		}
	}
}
