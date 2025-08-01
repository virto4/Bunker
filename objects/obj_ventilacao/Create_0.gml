/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
eixox = x
xvoltando = false
eixoy = y - 10
yvoltando = false
clicou = false
tempo = 0
clicou2 = false
total = 20 //quantos cliques até quebrar o objeto
terminou = false
comecar = false


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

ferramentas = spr_chave_fenda
todas_chaves = false
chave1 = false
largura1 = 0
cliques1 = 0
chave2 = false
largura2 = 0
cliques2 = 0
chave3 = false
largura3 = 0
cliques3 = 0
chave4 = false
largura4 = 0
cliques4 = 0
total_chave = 8

todos_espanador = false
largura11 = 0
cliques11 = 0
espanador1 = false
largura22 = 0
cliques22 = 0
espanador2 = false
largura33 = 0
cliques33 = 0
espanador3 = false
total_espanador = 35

x11 = 1920 / 2 - 225
y11 = 1080 / 2 - 330

x22 = 1920 /2 + 385
y22 = 1080 / 2 - 130

x33 = 1920 / 2 - 225
y33 = 1080 / 2 + 70
mancha1 = [[1920 / 2 - 450, 1080 / 2 - 300], [1920 / 2 + 100, 1080 / 2 - 170]]
mancha2 = [[1920 / 2 + 270, 1080 / 2 - 100], [1920 / 2 + 500, 1080 / 2 + 100]]
mancha3 = [[1920 / 2 - 350, 1080 / 2 + 100], [1920 / 2 - 200, 1080 / 2 + 350]]

x1 = 1920 / 2 - 595
y1 = 1080 / 2 - 295
	
x2 = 1920 / 2 + 595
y2 = 1080 / 2 + 295