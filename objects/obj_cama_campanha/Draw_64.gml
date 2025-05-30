/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 0.4)
	var msg = "Deseja passar a noite?"
	draw_set_font(fnt_alagard)
	draw_set_color(#999999)
	draw_text(1920 / 2 - string_width(msg) / 2, 1080 / 2, msg)
	draw_set_color(cor_sim)
	draw_text(1920 / 2 - 450, 800, "Sim")
	draw_set_color(cor_nao)
	draw_text(1920 / 2 + 450, 800, "Não")
}