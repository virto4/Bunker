/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 200 and !global.tem_tela_aberta {
	obj_personagem.geladeira = true
	if !is_aberta {
		image_speed = 1
	} 
}