/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
xx = obj_retornar_item.px
yy = obj_retornar_item.py

part_system = part_system_create();
part_emitter = part_emitter_create(part_system);
particula = part_type_create();

part_system_draw_order(part_system, false);
part_type_shape(particula, pt_shape_pixel);
part_type_size(particula, 0.5, 1, 0, 0);
part_type_speed(particula, 1, 2, 0, 0);
part_type_direction(particula, 0, 360, 0, 0);
part_type_life(particula, 20, 40);
part_type_color1(particula, c_silver);
