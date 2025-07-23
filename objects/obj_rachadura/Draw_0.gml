/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
if !clicou {
	draw_sprite(spr_exclamacao, 0, eixox, eixoy)
	if xvoltando {
		eixox += 2 * delta_time / 1000000
	} else {
		eixox -= 2 * delta_time / 1000000
	}
	if eixox <= x - 20 {
		xvoltando = true
	}
	if eixox >= x + 20 {
		xvoltando = false
	}
} else {
	draw_rectangle_color(x - 20, y - 5 + 25, x + 20, y + 5 + 25, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(x -  20 + 2, y - 5 + 25 + 2, x + largura - 20 + 2, y + 5 + 25 - 2, #487F7D, #487F7D, #487F7D, #487F7D, false)
}