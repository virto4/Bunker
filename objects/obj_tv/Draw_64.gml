if desenha {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale, scale, 0, c_white, 1)
	if scale < 5 {
		scale += 0.5
	} else if scale >= 5 {
		draw_set_color(c_black)
		draw_set_font(fnt_dialogos)
		draw_text(220, 800, "Essa televisão não funciona... Acho que não tem mais sinal.")
		if mouse_check_button_pressed(mb_left) {
			desenha = false
			tirar = true
		}
	}
}

if tirar {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale, scale, 0, c_white, 1)
	if scale > 0 {
		scale -= 0.5
	} else if scale == 0 {
		tirar = false
		global.tem_tela_aberta = false
	}
}