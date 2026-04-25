/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// se y do personagem estiver em y + 62 ou menos, o personagem deve ficar atrás da porta
// obj_personagem.y + 62
if obj_personagem.y < y + 8 {
	depth = -y - 10
} else {
	depth = -y
}
if abrindo {
	if current_time / 1000000 > tempo {
		image_index += 1 
		tempo += 0.005 * delta_time / 1000000
	}
	if image_index >= image_number - 2 {
		image_index = image_number - 1
		is_aberta = true
		abrindo = false
		instance_destroy(instance_place(x, y, obj_chao_2))
	}
}
