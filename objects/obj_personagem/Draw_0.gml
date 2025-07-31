/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
if alimentou {
	draw_set_font(fnt_dialogos)
	draw_set_color(#009900)
	var width = string_width("+ " + string(aumento_fome))
	var height = string_height("+ " + string(aumento_fome))
	draw_text(x - sprite_width / 2 + (sprite_width - width) / 2, y_alimentou, "+ " + string(aumento_fome))
	y_alimentou -= 0.5
	if y - sprite_height / 2 - 20 >= y_alimentou {
		alimentou = false
		y_alimentou = y - sprite_height / 2 + 20
	}
}