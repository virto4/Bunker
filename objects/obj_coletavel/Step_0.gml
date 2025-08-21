/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

if y < obj_personagem.y + 86 and y > obj_personagem.y - 5 {
	depth = obj_personagem.depth + 1
} else if instance_exists(obj_davi) {
	if y < obj_davi.y + 86 and y > obj_davi.y - 5 {
		depth = obj_personagem.depth + 1
	}
}