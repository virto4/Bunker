/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 100 {
	abrindo = true
	tempo = current_time / 1000000
	if obj_personagem.colidiu_porta_aux {
		pode_abrir = false
	} else {
		pode_abrir = true
	}
}