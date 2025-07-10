/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_retornar_item.desenhar {
	xx = obj_retornar_item.px
	yy = obj_retornar_item.py
	show_debug_message("entro")
    part_emitter_region(part_system, part_emitter, xx - 5, xx + 5, yy - 5, yy + 5, ps_shape_ellipse, ps_distr_gaussian);
    part_emitter_burst(part_system, part_emitter, particula, 15); // número de partículas
}

