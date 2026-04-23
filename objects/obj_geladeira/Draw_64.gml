/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if desenhar {
	draw_sprite(spr_voltar, 0, 1920 - 300, 50)
	draw_sprite_ext(spr_interface_geladeira, 0, 1920 / 2, 1080 / 2, 6, 6, 0, c_white, 1)
	global.tela_hotbar = true
	global.tem_tela_aberta = true
	for (var i = 0; i < array_length(posicoes); i++) {
		draw_sprite_ext(object_get_sprite(posicoes[i][0]), 0, posicoes[i][1], posicoes[i][2], 3.5, 3.5, 0, c_white, 1)
	}
}