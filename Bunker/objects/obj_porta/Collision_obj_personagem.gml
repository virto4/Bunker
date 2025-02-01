if keyboard_check(ord("X")) {
	if is_aberta == false {
		sprite_index = spr_porta_aberta
		is_aberta = true
	} else {
		sprite_index = spr_porta_fechada
	}
}