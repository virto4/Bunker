/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 100 {
	if !is_aberta {
	    sprite_index = spr_porta
		is_aberta = true
	} else if is_aberta and !obj_personagem.colidiu_porta_aux {
	    sprite_index = spr_porta_fechada
		is_aberta = false
	}
}