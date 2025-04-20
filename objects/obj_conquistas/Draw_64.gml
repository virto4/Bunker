/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if ganhou_conquista {
	draw_sprite_ext(sprite, 0, 1550, 900, 1, 1, 0, c_white, alpha)
	if alpha < 1 and tempo == 0 {
		alpha += 0.05
	} else if tempo < 500 {
		tempo++
	} else if alpha > 0 {
		alpha -= 0.05
	}
}