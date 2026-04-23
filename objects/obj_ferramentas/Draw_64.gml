/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if pressionou and room == rm_bunker {
	draw_sprite(spr_voltar, 0, 1800, 50)
	draw_sprite_ext(spr_interface_ferramentas, 0, 1920 / 2, 1080 / 2, 6, 6, 0, c_white, 1)
	draw_sprite_ext(spr_martelo, 0, posicoes[0][0], posicoes[0][1], 4, 4, 0, martelo_cor, 1)
	draw_sprite_ext(spr_argamassa, 0, posicoes[1][0], posicoes[1][1], 4, 4, 0, argamassa_cor, 1)
	draw_sprite_ext(spr_chave_fenda, 0, posicoes[2][0], posicoes[2][1], 4, 4, 0, chave_cor, 1)
	draw_sprite_ext(spr_fita_isolante, 0, posicoes[3][0], posicoes[3][1], 4, 4, 0, fita_cor, 1)
}