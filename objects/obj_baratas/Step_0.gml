/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y + 64

if !global.tem_tela_aberta and !morreu {
	if place_meeting(x, y, all) and !place_meeting(x, y, obj_personagem) and !place_meeting(x, y, obj_cursor) {
		var aux = numero
		while aux == numero {
			numero = irandom_range(1, 4)
		}
		switch numero {
			case 1:
				direcao = "esquerda"
				break
			case 2:
				direcao = "direita"
				break
			case 3:
				direcao = "cima"
				break
			case 4:
				direcao = "baixo"
				break
		}
	}

	if direcao == "esquerda" {
		x -= 6 * delta_time / 1000000
		image_yscale = 1 
		image_angle = 90
	} else if direcao == "direita" {
		x += 6 * delta_time / 1000000
		image_yscale = 1
		image_angle = 270
	} else if direcao == "cima" {
		y -= 6 * delta_time / 1000000
		image_yscale = 1
		image_angle = 0
	} else if direcao == "baixo" {
		y += 6 * delta_time / 1000000
		image_yscale = -1
		image_angle = 0
	}
} 

if !global.tem_tela_aberta and morreu {
	sprite_index = spr_baratas_morta
	image_alpha = alpha
	if current_time > tempo + 1000 * delta_time / 1000000 {
		alpha -= 0.05
		tempo = current_time
	}
	
	part_emitter_region(sistema, emissor, x - 18, x + 18, y - 25, y +25, ps_shape_ellipse, ps_distr_linear)
	part_emitter_burst(sistema, emissor, particula, 3)
	
	if alpha == 0 {
		instance_destroy()
	}
}