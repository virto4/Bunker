/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
if !terminou and comecar and !clicou {
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
}
part_system_drawit(sistema)
if clicou2 {
	part_emitter_region(sistema, emissor, mouse_x - 10, mouse_x + 10, mouse_y - 10, mouse_y + 10, ps_shape_ellipse, ps_distr_gaussian)
	part_emitter_burst(sistema, emissor, tipo, 1)
	if current_time >= tempo + 20 {
		clicou2 = false
	}
}