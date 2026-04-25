// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais 
conquistas = {
	conquista1 : false,
	conquista2 : false,
	conquista3 : false,
	conquista4 : false,
	conquista5 : false,
	conquista6 : false,
	conquista7 : false,
	conquista8 : false,
	conquista9 : false,
	conquista10: false,
	conquista11: false,
	conquista12: false,
	conquista13: false,
	conquista14: false,
	conquista15: false
}

lista_ganhos = ds_list_create()
nova_estrela = true
system = noone
part = noone
cadente = noone
rastro = noone

shooting_x = random(room_width)
shooting_y = 0
shooting_dir = 0
shooting_speed = 0
shooting_active = 0

function criar_estrela() {
	global.system = part_system_create_layer("Instances", false)
	//part_system_depth(global.system, 1000)
	part_estrela = part_type_create()
	part_type_shape(part_estrela, pt_shape_pixel)
	part_type_size(part_estrela, 0.6, 3, 0, 0) 	// tamanho pequeno (tipo pixel/estrela distante)
	part_type_color2(part_estrela, make_color_rgb(255,255,255), make_color_rgb(180,200,255)) 	// cores levemente variadas (branco, azul claro)
	part_type_alpha3(part_estrela, 0.2, 1, 0.2) 	// efeito de "piscar"
	part_type_life(part_estrela, 200, 400) 	// vida longa
	part_type_speed(part_estrela, 0, 0, 0, 0) 	// praticamente parada
	part_type_direction(part_estrela, 0, 360, 0, 0)
	part_type_gravity(part_estrela, 0, 0)
	global.part = part_estrela
}

function estrela_cadente() {
	part_cadente = part_type_create()
	part_type_shape(part_cadente, pt_shape_pixel)
	part_type_size(part_cadente, 0.5, 1, 0, 0) // um pouco maior que estrelas normais
	part_type_color3(part_estrela, make_color_rgb(255,255,255), #66AACC, #32667F)  // branco puxando pra azul
	part_type_alpha3(part_cadente, 1, 0.8, 0) // fade rápido
	part_type_life(part_cadente, 20, 50) // vida curta (movimento rápido)
	part_type_speed(part_cadente, 0.5, 1, 0, 0) // velocidade alta
	part_type_direction(part_cadente, 200, 250, 0, 0) // direção diagonal (tipo caindo)
	part_type_gravity(part_cadente, 0.1, 270) // leve “gravidade” pra curvar um pouco
	global.cadente = part_cadente
	
	part_rastro = part_type_create();
	part_type_shape(part_rastro, pt_shape_pixel);
	part_type_size(part_rastro, 0.2, 0.4, 0, 0);
	part_type_color3(part_estrela, make_color_rgb(255,255,255), #66AACC, #32667F) 
	part_type_alpha3(part_rastro, 0.6, 0.3, 0);
	part_type_life(part_rastro, 60, 100);
	part_type_speed(part_rastro, 0, 0, 0, 0);
	part_type_gravity(part_rastro, 0, 0);
	global.rastro = part_rastro
}