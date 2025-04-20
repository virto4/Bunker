/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 100 {
	image_speed = 1
	if image_index >= image_number - 1 {
		image_speed = 0
		image_index = image_number - 1
	}
} else {
	image_speed = -1
	if image_index <= 1 {
		image_speed = 0
		image_index = 0
	}
}