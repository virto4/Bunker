/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if numero == 1 {
	sprite_index = spr_rachadura_1
}
if cliques == total {
	if current_time > tempo_alpha + 20 {
		alpha -= 0.05
		tempo_alpha = current_time
	} else {
		instance_destroy()
	}
}
if clicou2 {
	part_emitter_region(sistema, emissor, mouse_x - 10, mouse_x + 10, mouse_y - 10, mouse_y + 10, ps_shape_ellipse, ps_distr_gaussian)
	part_emitter_burst(sistema, emissor, tipo, 1)
	if current_time >= tempo + 20 {
		clicou2 = false
	}
}