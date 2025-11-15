/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
if alimentou {
	y_alimentou = y - sprite_height / 2 + 20 + y_alimentou2
	y_alimentou2 -= 0.5
	draw_set_font(fnt_dialogos)
	draw_set_color(#009900)
	var width = string_width("+ " + string(aumento_fome))
	var height = string_height("+ " + string(aumento_fome))
	draw_text(x - sprite_width / 2 + (sprite_width - width) / 2, y_alimentou, "+ " + string(aumento_fome))
	if y - sprite_height / 2 - 20 >= y_alimentou {
		alimentou = false
		y_alimentou2 = 0
	}
}

if bebeu_agua {
	y_alimentou = y - sprite_height / 2 + 20 + y_alimentou2
	y_alimentou2 -= 0.5
	draw_set_font(fnt_dialogos)
	draw_set_color(#1111dd)
	var width = string_width("+ " + string(aumento_sede))
	var height = string_height("+ " + string(aumento_sede))
	draw_text(x - sprite_width / 2 + (sprite_width - width) / 2, y_alimentou, "+ " + string(aumento_sede))
	if y - sprite_height / 2 - 20 >= y_alimentou {
		bebeu_agua = false
		y_alimentou2 = 0
	}
}


if tomou_remedio {
	y_alimentou = y - sprite_height / 2 + 20 + y_alimentou2
	y_alimentou2 -= 0.5
	if perdeu_vida == 0 {
		draw_set_font(fnt_dialogos)
		draw_set_color(#FF3714)
		var width = string_width("+ " + string(aumento_saude))
		var height = string_height("+ " + string(aumento_saude))
		draw_text(x - sprite_width / 2 + (sprite_width - width) / 2, y_alimentou, "+ " + string(aumento_saude))
	} else {
		draw_set_font(fnt_dialogos)
		draw_set_color(#FF3714)
		var width = string_width("- " + string(perdeu_vida))
		var height = string_height("- " + string(perdeu_vida))
		draw_text(x - sprite_width / 2 + (sprite_width - width) / 2, y_alimentou, "- " + string(perdeu_vida))
	}
	if y - sprite_height / 2 - 20 >= y_alimentou {
		tomou_remedio = false
		y_alimentou2 = 0
		perdeu_vida = 0
	}
}

if sao {
	y_alimentou = y - sprite_height / 2 + 20 + y_alimentou2
	y_alimentou2 -= 0.5
	draw_set_font(fnt_dialogos)
	draw_set_color(#FF0739)
	var width = string_width("+ " + string(aumento_sanidade))
	var height = string_height("+ " + string(aumento_sanidade))
	draw_text(x - sprite_width / 2 + (sprite_width - width) / 2, y_alimentou, "+ " + string(aumento_sanidade))
	if y - sprite_height / 2 - 20 >= y_alimentou {
		atributos.sanidade += aumento_sanidade
		if atributos.sanidade > 100 {
			atributos.sanidade = 100	
		}
		sao = false
		sao_aux = false
		aumento_sanidade = 0
		y_alimentou2 = 0
	}
}