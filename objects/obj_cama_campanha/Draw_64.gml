/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function escrever(_x, _y, _texto, _cores) { //cores é um vetro de struct assim: {pos: 0, cor: c_green}. passar na ordem por posicao
	var x_atual = _x
	for (var i = 0; i < array_length(_cores); i++) {
		var inicio = _cores[i].pos
		var fim = (i < array_length(_cores) - 1) ? _cores[i + 1].pos : string_length(_texto) + 1 //se essa não for a ultima interação, o final é o inicio da proxima cor. se for, o final é o fim do proprio texto
		draw_set_color(_cores[i].cor)
		draw_set_font(fnt_dialogos)
		draw_text(x_atual, _y, string_copy(_texto, inicio, fim - inicio))
		x_atual += string_width(string_copy(_texto, inicio, fim - inicio))
	}
}
if clicou {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
	escrever(220, 800, "Você deseja passar a noite?", [{pos: 0, cor: c_black}])
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	if mouse_sim {
		draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
		draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
	}
	draw_text(300, 940, "Sim")
	if mouse_nao {
		draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
		draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
	}
	draw_text(1620, 940, "Não")
}