/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if abrindo {
	if !is_aberta {
		if image_index == 0 {
			image_speed = 1
		} else if image_index >= image_number - 2 {
			image_speed = 0
			image_index = image_number - 1
			is_aberta = true
			abrindo = false
			instance_destroy(instance_place(x, y + 56, obj_chao_1))
		}
	}
}