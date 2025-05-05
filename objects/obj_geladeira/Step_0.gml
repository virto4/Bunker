/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if image_speed > 0 {
	if image_index >= image_number - 2 {
		image_index = image_number - 1
		image_speed = 0
		is_aberta = true
	}
} else if image_speed < 0 {
	if image_index <= 1 {
		image_index = 0
		image_speed = 0
		is_aberta = false
	}
}