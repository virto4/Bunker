/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if place_meeting(x, y, obj_personagem) {
	instance_destroy()
		if is_aberta == false {
			sprite_index = spr_porta_aberta
			is_aberta = true
		} else {
			sprite_index = spr_porta_fechada
		}
	}

