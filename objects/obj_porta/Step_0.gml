/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if abrindo {
	if current_time / 1000000 > tempo {
		image_index += 1 
		tempo += 0.005 * delta_time / 1000000
	}
	if image_index >= image_number - 2 {
		image_index = image_number - 1
		is_aberta = true
		abrindo = false
		instance_destroy(instance_place(x, y + 56, obj_chao_1))
	}
}
