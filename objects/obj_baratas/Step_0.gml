/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y + 64
if !global.tem_tela_aberta {
	if place_meeting(x, y, all) and !place_meeting(x, y, obj_personagem) {
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
		image_xscale = 1
		image_angle = 0
	} else if direcao == "baixo" {
		y += 6 * delta_time / 1000000
		image_yscale = -1
		image_angle = 0
	}
}