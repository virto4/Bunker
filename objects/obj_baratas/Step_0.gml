/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y + 64

if !global.tem_tela_aberta and !morreu {
	if place_meeting(x, y, obj_colidivel) {
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
	image_alpha = alpha
	if current_time > tempo + 1000 * delta_time / 1000000 {
		alpha -= 0.05
		tempo = current_time
	}
	if aux_part {
		var layer_id = layer_create(depth, "Particulas")
		sistema = part_system_create_layer(layer_id, false)
		emissor = part_emitter_create(sistema)
		aux_part = false
	}
	if !morreu_esmagada {
		lancar_particulas(x, y, sistema, particula)
	} else {
		lancar_particulas(x, y, sistema, particula2)
	}
	
	if alpha == 0 {
		lancar_part1 = false
		lancar_part2 = false
		instance_destroy()
	}
}