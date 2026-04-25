/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

function quebrar_texto(texto, largura_maxima) {
    var linhas = [];
    var palavras = string_split(texto, " ");
    var linha_atual = "";
    var i;

    for (i = 0; i < array_length(palavras); i++) {
        var palavra = palavras[i];
        var linha_teste = linha_atual + palavra + " ";

        if (string_width(linha_teste) > largura_maxima) {
            array_push(linhas, string_trim(linha_atual));
            linha_atual = palavra + " ";
        } else {
            linha_atual = linha_teste;
        }
    }

    if (linha_atual != "") {
        array_push(linhas, string_trim(linha_atual));
    }

    return linhas;
}

if room_get_name(room) = "rm_conquistas" {
	if global.nova_estrela {
		global.criar_estrela()
		global.estrela_cadente()
		for (var i = 0; i < 150; i++) {
		    var px = random(room_width);
		    var py = random(room_height);
		    part_particles_create(global.system, px, py, global.part, 1);
		}
		global.nova_estrela = false
	}
	if (random(1) < 0.3) {
	    var px = random(room_width);
	    var py = random(room_height);
	    part_particles_create(global.system, px, py, global.part, 1);
	}
	// chance de spawn
	if (random(1) < 0.0002) {
    
	    // posição inicial
	    global.shooting_x = random(room_width);
	    global.shooting_y = random_range(-10, 1000);
    
	    // direção e velocidade
	    global.shooting_dir = random_range(0, 250);
	    global.shooting_speed = random_range(1, 4);
    
	    global.shooting_active = true;
	}
	if (global.shooting_active) {
    
	    // movimento
	    var vx = lengthdir_x(global.shooting_speed, global.shooting_dir);
	    var vy = lengthdir_y(global.shooting_speed, global.shooting_dir);
    
	    global.shooting_x += vx;
	    global.shooting_y += vy;
    
	    // partícula principal
	    part_particles_create(global.system, global.shooting_x, global.shooting_y, global.cadente, 1);
    
	    // rastro (várias pequenas atrás)
	    for (var i = 0; i < 3; i++) {
	        part_particles_create(global.system,
	            global.shooting_x + random_range(-2, 2),
	            global.shooting_y + random_range(-2, 2),
	            global.part_rastro, 1);
	    }
    
	    // remove quando sair da tela
	    if (global.shooting_y > room_height || global.shooting_x < 0) {
	        global.shooting_active = false;
	    }
	}
	if position_meeting(mouse_x, mouse_y, obj_conquistas) {
		var _filho = instance_position(mouse_x, mouse_y, obj_conquistas)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		if _filho != noone {
			var _titulo = _filho.titulo
			var _descricao = _filho.descricao
			var altura =  (array_length(quebrar_texto(_descricao, 400)) + 1) * string_height("A") * 1.2 + 20
			var largura = 0
			if string_width(_titulo) > string_width(_descricao) {
				largura = string_width(_titulo)
			} else {
				largura = string_width(_descricao)
			}
			if largura > 410 {
				largura = 400
			}
			draw_rectangle_color(mouse_x + 70, mouse_y + 65, mouse_x + 70 + largura + 10, mouse_y + 65 + altura, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(mouse_x + 75, mouse_y + 70, mouse_x + 65 + largura + 10, mouse_y + 70 + string_height("A") * 1.2, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			draw_rectangle_color(mouse_x + 75, mouse_y + 75 + string_height("A") * 1.2, mouse_x + 65 + largura + 10, mouse_y + 60 + altura, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			draw_text(mouse_x + 80, mouse_y + 80, _titulo)
			draw_text_ext(mouse_x + 80, mouse_y + 80 + string_height("A") * 1.2, _descricao, string_height("A") * 1.2, 400)
		}
	}
} else {
	if ganhou_conquista {
		if ds_list_size(global.lista_ganhos) > 0 {
			for (var _i = 0; _i < ds_list_size(global.lista_ganhos); _i++) {
				draw_sprite_ext(ds_list_find_value(global.lista_ganhos, _i).sprite, 0, 1550, 900 - 120 * _i, 1, 1, 0, c_white, ds_list_find_value(global.lista_ganhos, _i).alpha)
				if ds_list_find_value(global.lista_ganhos, _i).alpha < 1 and ds_list_find_value(global.lista_ganhos, _i).tempo == 0 {
					ds_list_find_value(global.lista_ganhos, _i).alpha += 0.05
				} else if ds_list_find_value(global.lista_ganhos, _i).tempo < 200 {
					ds_list_find_value(global.lista_ganhos, _i).tempo  += 1
				} else if ds_list_find_value(global.lista_ganhos, _i).alpha > 0 {
					ds_list_find_value(global.lista_ganhos, _i).alpha -= 0.05
				} else {
					ds_list_delete(global.lista_ganhos, _i)
					break
				}
			} 
		} else {
			ganhou_conquista = false
		}
	}
}