/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
humores = ["NEUTRO", "COM NOJO", "HIPERATIVO", "FURIOSO", "DEPRIMIDO", "APAVORADO"]

atributos = {
	saude: 100,
	fome: 100,
	sede: 100,
	sanidade: 100,
	humor: humores[0],
	sagacidade: 57,
	forca: 88,
	resistencia: 85,
	fortuna: 32,
	fadiga: 12
}

d = 1

itens_iguais = ds_list_create()

mudar_bunker = 0
alpha2 = 0
if room == rm_bunker {
	mudar_bunker = true
	alpha2 = 1
} else if room == rm_casa {
	mudar_bunker = false
	alpha2 = 0
}

desenhar = false
desenhar2 = false
segunda_vez = false
px = 0
py = 0
item_segurado = 0

tempo = false
tempo2 = 0
aux_item = 0

velh				= 0
velv				= 0
vel					= 300
vel_diagonal		= 212
apertou_pulo		= false
posicao_pre_pulo	= 0
colidiu_porta_aux	= false
slot_selecionado	= 5
slot1=noone
slot2=noone
slot3=noone
slot4=noone
slot5=noone
slot1_novo = false
slot2_novo = false
slot3_novo = false
slot4_novo = false
slot5_novo = false
slot1_n = 0
slot2_n = 0
slot3_n = 0
slot4_n = 0
slot5_n = 0
numero_n = 1

global.tem_tela_aberta = false

itens_nao_consumiveis = [obj_radio, obj_bola_basquete, obj_embalagem_bala, obj_gato_empalhado, obj_ursinho,
						obj_arma_biologica, obj_frigideira, obj_machado, obj_metralhadora, obj_pistola,
						obj_panela_pressao, obj_picareta, obj_tv, obj_domino, obj_contador_geiger, obj_baralho,
						obj_inseticida, obj_ferramentas]
is_consumivel = true //variavel auxiliar para obj_coletavel
obj_anterior = noone //auxilia na geracao do sprite azulxznho
item_devolvido = false //o obj coletavel estpa por baixo deste aqui. ao clicar para devolver, ele entende que quero pegar outro também. Para saber se o clique é para pegar ou devolver, vemos essa variavel

//isso aqui é para o obj_coletavel, que, como não tem instancia dele na room, não é executado o create
slots_disponiveis = false
tempo_slot = false

alpha = 1
mudar_volume = false
volume_x = 960
clicou_volume = false
mudar_fov = false
fov_x = 960
clicou_fov = false
view_width_base = camera_get_view_width(view_camera[0]);
view_height_base = camera_get_view_height(view_camera[0]);

qtde_itens1 = {
    "obj_acucar": 0,
    "obj_agua": 0,
    "obj_alface": 0,
    "obj_arroz": 0,
    "obj_batata": 0,
    "obj_cerveja": 0,
    "obj_chocolate": 0,
    "obj_farinha": 0,
    "obj_frango": 0,
    "obj_ovo": 0,
    "obj_repolho": 0,
    "obj_bola_basquete": 0,
    "obj_embalagem_bala": 0,
    "obj_gato_empalhado": 0,
    "obj_ursinho": 0,
    "obj_arma_biologica": 0,
    "obj_frigideira": 0,
    "obj_machado": 0,
    "obj_metralhadora": 0,
    "obj_municao": 0,
    "obj_panela_pressao": 0,
    "obj_picareta": 0,
    "obj_pistola": 0,
    "obj_analgesico": 0,
    "obj_ansiolitico": 0,
    "obj_antibiotico": 0,
    "obj_aspirina": 0,
    "obj_curativo": 0,
    "obj_baralho": 0,
    "obj_contador_geiger": 0,
    "obj_domino": 0,
    "obj_saco_lixo": 0,
    "obj_tv": 0,
	"obj_radio": 0,
	"obj_pilha": 0,
	"obj_inseticida": 0,
	"obj_ferramentas": 0,
	"obj_arroz_frango": 0, 
	"obj_bolo_chocolate": 0,
	"obj_bolo_quatro_quartos": 0, 
	"obj_chucrute": 0,
	"obj_escondidinho": 0,
	"obj_ovo_mexido": 0,
	"obj_salada": 0,
	"obj_cookie": 0,
}


inputs = {
	esquerda	: ord("A"),
	direita		: ord("D"),
	cima		: ord("W"),
	baixo		: ord("S"),
	pulo		: vk_space,
}

opcoes = false

if room_get_name(room) == "rm_casa" {
	tempo_decorrido = 0 
	tempo_espera = 10
	tempo_escrito = tempo_espera - tempo_decorrido
} else if room_get_name(room) == "rm_bunker" and ds_list_size(global.itens_pegos) > 0 {
	for (i = 0; i < ds_list_size(global.itens_pegos); i++) {
		switch (ds_list_find_value(global.itens_pegos, i)) {
			case obj_municao:
				mudar_fase("obj_municao", obj_municao);
				break;
			case obj_cerveja:
				mudar_fase("obj_cerveja", obj_cerveja)
				obj_freezer.quantidades[8][1] += 1
				break
			case obj_agua:
				mudar_fase("obj_agua", obj_agua)
				obj_freezer.quantidades[1][1] += 1
				break
			case obj_radio:
				mudar_fase("obj_radio", obj_radio);
				break;
			case obj_pilha:
				mudar_fase("obj_pilha", obj_pilha);
				break;
			case obj_acucar:
				mudar_fase("obj_acucar", obj_acucar);
				obj_freezer.quantidades[0][1] += 1
				break;
			case obj_alface:
				mudar_fase("obj_alface", obj_alface);
				obj_freezer.quantidades[2][1] += 1
				break;
			case obj_arroz:
				mudar_fase("obj_arroz", obj_arroz);
				obj_freezer.quantidades[3][1] += 1
				break;
			case obj_batata:
				mudar_fase("obj_batata", obj_batata);
				obj_freezer.quantidades[5][1] += 1
				break;
			case obj_chocolate:
				mudar_fase("obj_chocolate", obj_chocolate);
				obj_freezer.quantidades[9][1] += 1
				break;
			case obj_farinha:
				mudar_fase("obj_farinha", obj_farinha);
				obj_freezer.quantidades[13][1] += 1
				break;
			case obj_frango:
				mudar_fase("obj_frango", obj_frango);
				obj_freezer.quantidades[14][1] += 1
				break;
			case obj_ovo:
				mudar_fase("obj_ovo", obj_ovo);
				obj_freezer.quantidades[15][1] += 1
				break;
			case obj_repolho:
				mudar_fase("obj_repolho", obj_repolho);
				obj_freezer.quantidades[17][1] += 1
				break;
			case obj_bola_basquete:
				mudar_fase("obj_bola_basquete", obj_bola_basquete);
				break;
			case obj_embalagem_bala:
				mudar_fase("obj_embalagem_bala", obj_embalagem_bala);
				break;
			case obj_gato_empalhado:
				mudar_fase("obj_gato_empalhado", obj_gato_empalhado);
				break;
			case obj_ursinho:
				mudar_fase("obj_ursinho", obj_ursinho);
				break;
			case obj_arma_biologica:
				mudar_fase("obj_arma_biologica", obj_arma_biologica);
				break;
			case obj_frigideira:
				mudar_fase("obj_frigideira", obj_frigideira);
				break;
			case obj_panela_pressao:
				mudar_fase("obj_panela_pressao", obj_panela_pressao);
				break;
			case obj_machado:
				mudar_fase("obj_machado", obj_machado);
				break;
			case obj_metralhadora:
				mudar_fase("obj_metralhadora", obj_metralhadora);
				break;
			case obj_picareta:
				mudar_fase("obj_picareta", obj_picareta);
				break;
			case obj_pistola:
				mudar_fase("obj_pistola", obj_pistola);
				break;
			case obj_analgesico:
				mudar_fase("obj_analgesico", obj_analgesico);
				break;
			case obj_ansiolitico:
				mudar_fase("obj_ansiolitico", obj_ansiolitico);
				break;
			case obj_antibiotico:
				mudar_fase("obj_antibiotico", obj_antibiotico);
				break;
			case obj_aspirina:
				mudar_fase("obj_aspirina", obj_aspirina);
				break;
			case obj_curativo:
				mudar_fase("obj_curativo", obj_curativo);
				break;
			case obj_baralho:
				mudar_fase("obj_baralho", obj_baralho);
				break;
			case obj_contador_geiger:
				mudar_fase("obj_contador_geiger", obj_contador_geiger);
				break;
			case obj_domino:
				mudar_fase("obj_domino", obj_domino);
				break;
			case obj_saco_lixo:
				mudar_fase("obj_saco_lixo", obj_saco_lixo);
				break;
			case obj_tv:
				mudar_fase("obj_tv", obj_tv);
				break;
			case obj_inseticida:
				mudar_fase("obj_inseticida", obj_inseticida);
				break;
			case obj_ferramentas:
				mudar_fase("obj_ferramentas", obj_ferramentas);
				break;
		}
	}

	function mudar_fase(nome_obj, index_obj) {
		var is_alimento = false
		for (var i = 0; i < array_length(global.alimentos); i++) {
			if index_obj = global.alimentos[i] {
				is_alimento = true
				break
			}
		}
		if is_alimento {
			variable_struct_set(qtde_itens1, nome_obj, variable_struct_get(qtde_itens1, nome_obj) + 1)
		} else {
			if variable_struct_get(qtde_itens1, nome_obj) == 0 { //pega o valor de tde_itens chamado obj
				var pos = variable_struct_get(global.posicoes, nome_obj)
				var ax = variable_struct_get(pos, "x")
				var ay = variable_struct_get(pos, "y")
				inst = instance_create_layer(ax, ay, layer_get_id("Instances"), index_obj, {})
				variable_struct_set(qtde_itens1, nome_obj, variable_struct_get(qtde_itens1, nome_obj) + 1)
			} else { //se pegou mais de uma municao, no obj_municao estara dizendo quantas ela tem
				//variable_instance_set(obj, "qtde_itens", variable_instance_get(obj, "qtde_itens") + 1)
				variable_instance_set(instance_find(index_obj, 0), "qtde_itens", variable_instance_get(instance_find(index_obj, 0), "qtde_itens") + 1)
			}
		}
	}
}