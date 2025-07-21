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

// Criar sistema e emissor
sistema = part_system_create();
emissor = part_emitter_create(sistema);

// Criar tipo de partícula
particula = part_type_create();

part_type_shape(particula, pt_shape_square);
part_type_orientation(particula, 0, 90, -3, 0, 0)
part_type_size(particula, 0.1, 0.2, -0.05, 0); // tamanho pequeno
part_type_color1(particula, c_white); // cor branca
//part_type_blend(particula, true)
part_type_alpha3(particula, 1, 0.8, 0);         // desvanece
part_type_life(particula, 30, 60);         // vida útil curta
part_type_speed(particula, 0.3, 0.6, -0.6, 0);      // sobe devagar
part_type_direction(particula, 85, 95, 0, 0); // sobe levemente variado
part_type_gravity(particula, -0.02, 270);  // flutua levemente para cima
