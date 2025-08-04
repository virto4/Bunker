/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou {
	draw_sprite_ext(spr_interface_freezer, 0, 1920 / 2, (1080 / 2) + 40, 2.4, 2.4, 0, c_white, 1)
	draw_sprite(spr_voltar, 0, 1920 - 300, 50)
	for (var i = 0; i < array_length(quantidades); i++) {
		if quantidades[i][1] > 0 {
			for (var j = 0; j < array_length(posicoes); j++) {
				if posicoes[j][0] == quantidades[i][0] {
					draw_sprite_ext(object_get_sprite(quantidades[i][0]), 0, posicoes[j][1], posicoes[j][2], 3.5, 3.5, 0, c_white, 1)
					draw_text(posicoes[j][1] + sprite_get_width(object_get_sprite(posicoes[j][0])) - 10, 
								posicoes[j][2] + sprite_get_height(object_get_sprite(posicoes[j][0])) - 10, 
								quantidades[i][1])
				}
			}
		}
	}
}