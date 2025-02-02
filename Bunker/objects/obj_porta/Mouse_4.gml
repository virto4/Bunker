/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if x - 5 < obj_personagem.x < x + 5  and y - 5 < obj_personagem.y < y + 5 {
	if !is_aberta {
	    sprite_index = spr_porta_aberta;
		is_aberta = true
	} else if is_aberta {
	    sprite_index = spr_porta_fechada;
		is_aberta = false
	}
}