/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/*
sem amuletos; armas fazem o papel deles: aumentando a força e outros atrivutos
atributos são: força (regula o dano causado), resistência (regula o dano sofrida), fortuna (regula os drops),
sagacidade (regula a chance dde crítico ou de errar o golpe)
humor: extasiado (+força +resistencia -sagaz + fortuna), 
	deprimido (- força - fortuna + resisteia +sagaz)
	apavorado (+ forca + sagaz - todos), 
	colérico (+ força +fortuna - sagaz - resistencia)
	
	
outra coisa: CORES DOS DIÁLOGOS
personagens ou inimigos: azul (16637F)
itens: amarelo (B29711)
atrivbutos e humores: roxo (7F1434)
*/
humores = ["NEUTRO", "EXTASIADO", "COLÉRICO", "DEPRIMIDO", "APAVORADO"]

atributos = {
	saude: 100,
	fome: 100,
	sede: 100,
	sanidade: 100,
	humor: humores[0],
	sagacidade: 30,
	forca: 30,
	resistencia: 30,
	fortuna: 30,
}

forca_padrao = atributos.forca
fortuna_padrao = atributos.fortuna
resistencia_padrao = atributos.resistencia
sagacidade_padrao = atributos.sagacidade

mudou_humor = false

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
item_selecionado = noone

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

itens_nao_consumiveis = [obj_radio, obj_machado, obj_metralhadora, obj_pistola,
						obj_picareta, obj_tv, obj_domino, obj_contador_geiger, obj_baralho,
						obj_inseticida, obj_ferramentas, obj_espanador, obj_meredith, obj_davi]
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
    "obj_machado": 0,
    "obj_metralhadora": 0,
    "obj_municao": 0,
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
	"obj_agua_sanitaria": 0,
	"obj_espanador": 0,
	"obj_meredith": 0,
	"obj_davi": 0
}

habilidades = [
	["Sniper", "Armas de fogo dão mais dano."],
	["Ferramenteiro", "Obtém mais eficiência em armas brancas."],
	["Golpe da morte", "Dá 2 ataques pelo preço de um"],
	["Estoicismo", "Remove suas emoções."],
	["Pensamentos intrusivos", "Fica deprimido."],
	["Pensamentos intrusivos 2", "Fica coolérico."],
	["Curandeiro aprendiz", "Cura 1/3 de toda a saúde do personagem"],
	["Curandeiro mestre", "Cura toda a saúde de um personagem"],
	["Parque de diversões", "Fica extasiado"],
	["Concentração", "Resistência e força são melhoradas um pouco."],
	["Ataque", "Um ataque padrão. Nada de mais"],
]

habilidades_adquiridas = habilidades //provisorio, futuramente as habilidades serão conquistadas ao longo do tempo

inputs = {
	esquerda	: ord("A"),
	direita		: ord("D"),
	cima		: ord("W"),
	baixo		: ord("S"),
	pulo		: vk_space,
}

opcoes = false

armas_pegas = [obj_metralhadora, obj_picareta, obj_machado, obj_pistola]

if room_get_name(room) == "rm_casa" {
	tempo_decorrido = 0 
	tempo_espera = 60
	tempo_escrito = tempo_espera - tempo_decorrido
} else if room_get_name(room) == "rm_bunker" and ds_list_size(global.itens_pegos) > 0 {
	for (i = 0; i < ds_list_size(global.itens_pegos); i++) {
		switch (ds_list_find_value(global.itens_pegos, i)) {
			case obj_espanador:
				mudar_fase("obj_espanador", obj_espanador)
				break
			case obj_davi:
				mudar_fase("obj_davi", obj_davi)
				break
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
			case obj_machado:
				array_push(armas_pegas, obj_machado)
				mudar_fase("obj_machado", obj_machado);
				break;
			case obj_metralhadora:
				array_push(armas_pegas, obj_metralhadora)
				mudar_fase("obj_metralhadora", obj_metralhadora);
				break;
			case obj_picareta:
				array_push(armas_pegas, obj_picareta)
				mudar_fase("obj_picareta", obj_picareta);
				break;
			case obj_pistola:
				array_push(armas_pegas, obj_pistola)
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
			case obj_agua_sanitaria:
			mudar_fase("obj_agua_sanitaria", obj_agua_sanitaria)
				break
			case obj_meredith:
				mudar_fase("obj_meredith", obj_meredith)
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

alimento = false
alimento_scale = 0
alpha_sim = 0
alpha_nao = 0
mouse_sim = false
mouse_nao = false
draw_set_font(fnt_dialogos)
largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")
sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]
alimentou = false
y_alimentou = y - sprite_height / 2 + 20
aumento_fome = 0

remedio = false
tomou_remedio = false
aumento_saude = 0