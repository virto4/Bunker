/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if point_in_rectangle(x, y, obj_personagem.x - 40, obj_personagem.y, obj_personagem.x + 40, obj_personagem.y + 62) and y < 320 {
	depth = obj_personagem.depth + 1
}
if instance_exists(obj_davi) and obj_personagem.ativada {
	if point_in_rectangle(x, y, obj_davi.x - 40, obj_davi.y, obj_davi.x + 40, obj_davi.y + 62) and y < 320 {
		depth = obj_davi.depth + 1
	}
}