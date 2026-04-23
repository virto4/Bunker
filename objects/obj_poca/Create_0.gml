/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
sistema = part_system_create()
emissor = part_emitter_create(sistema)
tipo = part_type_create()

part_type_alpha1(tipo, 1)
part_type_color1(tipo, #E59B00)
part_type_size(tipo, 0.1, 0.2, -0.01, 0)
part_type_life(tipo, 30, 60)
part_type_shape(tipo, pt_shape_square)
part_type_orientation(tipo, 0, 90, -2, 0, 0)
part_type_speed(tipo, 0.4, 0.7, 0, 0)
part_type_direction(tipo, 0, 360, 0, 0)
part_type_gravity(tipo, 0.1, 270)

eixox = x
xvoltando = false
eixoy = y + 25
yvoltando = false
clicou = false
largura = 0
cliques = 0
tempo = 0
clicou2 = false
alpha = 1
tempo_alpha = 0
total_martelo = 20 //quantos cliques até quebrar o objeto
total_fita = 30
total_argamassa = 40
martelo = false
fita = false
argamassa = false
ferramentas = spr_martelo