/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
numero = irandom_range(1, 4)
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
morreu = false
alpha = 1
tempo = 0
morreu_esmagada = true

// Criar tipo de partícula
particula = part_type_create();
part_type_shape(particula, pt_shape_pixel)
part_type_size(particula, 0.2, 0.7, 0.03, 0) // tamanho: começa pequeno e cresce (efeito puff)
part_type_color3(particula, #FF9532, #E55B16, #FF328D) // cor cinza tipo fumaça (duas variações)
part_type_alpha3(particula, 0.9, 0.5, 0) // alpha: começa visível e desaparece suave
part_type_life(particula, 40, 60) // duração maior (alguns segundos dependendo do room_speed)
part_type_speed(particula, 0.2, 0.3, 0.01, 0) 
part_type_direction(particula, -20, 20, 0, 0) // sobe com leve variação
part_type_gravity(particula, -0.02, 270) // gravidade negativa (faz subir devagar)

particula2 = part_type_create()
part_type_shape(particula2, pt_shape_pixel)
part_type_size(particula2, 0.2, 0.7, 0.03, 0) // tamanho: começa pequeno e cresce (efeito puff)
part_type_color2(particula2, make_color_rgb(120,120,120), make_color_rgb(200,200,200)) // cor cinza tipo fumaça (duas variações)
part_type_alpha3(particula2, 0.9, 0.5, 0) // alpha: começa visível e desaparece suave
part_type_life(particula2, 40, 60) // duração maior (alguns segundos dependendo do room_speed)
part_type_speed(particula2, 0.2, 0.3, 0.01, 0) part_type_speed(particula2, 0.2, 0.3, 0.01, 0)
part_type_direction(particula2, -20, 20, 0, 0) // sobe com leve variação
part_type_gravity(particula2, -0.02, 270) // gravidade negativa (faz subir devagar)

lancar_part1 = false
lancar_part2 = false

aux_part = true
sistema = noone
emissor = noone

function lancar_particulas(coord_x, coord_y, sistema, particula) {
	var px = coord_x + random_range(-8, 8)
	var py = coord_y + random_range(-8, 8)
	part_particles_create(sistema, px, py, particula, 20)
}