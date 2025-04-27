/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 100 and !obj_personagem.opcoes {
	if !is_aberta {
		image_speed = 1
	} 
	if is_aberta {
		image_speed = -1
	}
}