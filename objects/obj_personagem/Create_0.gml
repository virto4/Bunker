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

velh				= 0
velv				= 0
vel					= 300
vel_diagonal		= 212
apertou_pulo		= false
posicao_pre_pulo	= 0
colidiu_porta_aux	= false
slot_selecionado	= 1
slot1=noone
slot2=noone
slot3=noone
slot4=noone
slot5=noone
itens_nao_consumiveis = [obj_radio]
is_consumivel = true //variavel auxiliar para obj_coletavel
obj_anterior = noone //auxilia na geracao do sprite azulxznho
item_devolvido = false //o obj coletavel estpa por baixo deste aqui. ao clicar para devolver, ele entende que quero pegar outro também. Para saber se o clique é para pegar ou devolver, vemos essa variavel

alpha = 1
mudar_volume = false
volume_x = 960
clicou_volume = false
mudar_fov = false
fov_x = 960
clicou_fov = false
view_width_base = camera_get_view_width(view_camera[0]);
view_height_base = camera_get_view_height(view_camera[0]);

qtde_itens = {
	obj_acucar: 0,
	obj_agua: 0,
	obj_alface: 0,
	obj_arroz: 0,
	obj_batata: 0,
	obj_cerveja: 0,
	obj_chocolate: 0,
	obj_farinha: 0,
	obj_frango: 0,
	obj_ovo: 0,
	obj_repolho: 0,
	obj_bola_basquete: 0,
	obj_embalagem_bala: 0,
	obj_gato_empalhado: 0,
	obj_ursinho: 0,
	obj_arma_biologica: 0,
	obj_frigideira: 0,
	obj_machado: 0,
	obj_metralhadora: 0,
	obj_municao: 0,
	obj_panela_pressao: 0,
	obj_picareta: 0,
	obj_pistola: 0,
	obj_analgesico: 0,
	obj_ansiolitico: 0,
	obj_antibiotico: 0,
	obj_aspirina: 0,
	obj_curativo: 0,
	obj_baralho: 0,
	obj_contador_geiger: 0,
	obj_domino: 0,
	obj_saco_lixo: 0,
	obj_tv: 0
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
	tempo_espera = 400
	tempo_escrito = tempo_espera - tempo_decorrido
} else if room_get_name(room) == "rm_bunker" if room_get_name(room) == "rm_bunker" and ds_list_size(global.itens_pegos) > 0 {
	for (i = 0; i < ds_list_size(global.itens_pegos); i++) {
		switch (ds_list_find_value(global.itens_pegos, i)) {
			case obj_municao: //se o jogador pegou municao, instancia a municao no bunker
				mudar_fase(obj_municao)
				break
			case obj_radio:
				mudar_fase(obj_radio)
				break
			case obj_pilha:
				mudar_fase(obj_pilha)
				break
			case obj_acucar:
				mudar_fase(obj_acucar)
				break
			case obj_agua:
				mudar_fase(obj_agua)
				break
			case obj_alface:
				mudar_fase(obj_alface)
				break
			case obj_arroz:
				mudar_fase(obj_arroz)
				break
			case obj_arroz_frango:
				mudar_fase(obj_arroz_frango)
				break
			case obj_batata:
				mudar_fase(obj_batata)
				break
			case obj_cerveja:
				mudar_fase(obj_cerveja)
				break
			case obj_chocolate:
				mudar_fase(obj_chocolate)
				break
			case obj_farinha:
				mudar_fase(obj_farinha)
				break
			case obj_frango:
				mudar_fase(obj_frango)
				break
			case obj_ovo:
				mudar_fase(obj_ovo)
				break
			case obj_repolho:
				mudar_fase(obj_repolho)
				break
			case obj_bola_basquete:
				mudar_fase(obj_bola_basquete)
				break
			case obj_embalagem_bala:
				mudar_fase(obj_embalagem_bala)
				break
			case obj_gato_empalhado:
				mudar_fase(obj_gato_empalhado)
				break
			case obj_ursinho:
				mudar_fase(obj_ursinho)
				break
			case obj_arma_biologica:
				mudar_fase(obj_arma_biologica)
				break
			case obj_frigideira:
				mudar_fase(obj_frigideira)
				break
			case obj_panela_pressao:
				mudar_fase(obj_panela_pressao)
				break
			case obj_machado:
				mudar_fase(obj_machado)
				break
			case obj_metralhadora:
				mudar_fase(obj_metralhadora)
				break
			case obj_picareta:
				mudar_fase(obj_picareta)
				break
			case obj_pistola:
				mudar_fase(obj_pistola)
				break
			case obj_analgesico:
				mudar_fase(obj_analgesico)
				break
			case obj_ansiolitico:
				mudar_fase(obj_ansiolitico)
				break
			case obj_antibiotico:
				mudar_fase(obj_antibiotico)
				break
			case obj_aspirina:
				mudar_fase(obj_aspirina)
				break
			case obj_curativo:
				mudar_fase(obj_curativo)
				break
			case obj_baralho:
				mudar_fase(obj_baralho)
				break
			case obj_contador_geiger:
				mudar_fase(obj_contador_geiger)
				break
			case obj_domino:
				mudar_fase(obj_domino)
				break
			case obj_saco_lixo:
				mudar_fase(obj_saco_lixo)
				break
			case obj_tv:
				mudar_fase(obj_tv)
				break
		}
	}
}

function desenhar_selecionado(_slot) { //desenha uma camada acima do sprite para identificar a psoiçao que ele ocupa no mapa
	if room_get_name(room) == "rm_casa" {
		switch(_slot) {
			case obj_pilha:
				obj_anterior = instance_create_layer(global.casa.pilha_x, global.casa.pilha_y, "Selecionados", obj_pilha_selecionado, {})
				break
			case obj_radio:
				obj_anterior = instance_create_layer(global.casa.radio_x, global.casa.radio_y, "Selecionados", obj_radio_selecionado, {})
				break
			case obj_municao:
				obj_anterior = instance_create_layer(global.casa.municao_x, global.casa.municao_y, "Selecionados", obj_municao_selecionado, {})
				break
		}
	} else if room_get_name(room) == "rm_bunker" {
		switch(_slot) {
			case obj_radio:
				obj_anterior = instance_create_layer(global.posicoes.radio_x, global.posicoes.radio_y, "Selecionados", obj_radio_selecionado, {})
				break
			case obj_pilha:
				obj_anterior = instance_create_layer(global.posicoes.pilha_x, global.posicoes.pilha_y, "Selecionados", obj_pilha_selecionado, {})
				break
			case obj_municao:
				obj_anterior = instance_create_layer(global.posicoes.municao_x, global.posicoes.municao_y, "Selecionados", obj_municao_selecionado, {})
				break
		}
	}
}

function mudar_fase(obj) {
	if qtde_itens.obj == 0 {
		instance_create_layer(global.posicoes.obj, global.posicoes.obj, layer_get_id("Instances"), obj, {})
		qtde_itens.obj++
		} else { //se pegou mais de uma municao, no obj_municao estara dizendo quantas ela tem
			obj.qtde_itens++
		}
}