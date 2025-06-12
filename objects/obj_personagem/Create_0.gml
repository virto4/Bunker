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
	obj_municao		: 0,
	obj_radio		: 0,
	obj_pilha		: 0
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
	tempo_espera = 0
	tempo_escrito = tempo_espera - tempo_decorrido
} else if room_get_name(room) == "rm_bunker" if room_get_name(room) == "rm_bunker" and ds_list_size(global.itens_pegos) > 0 {
	for (i = 0; i < ds_list_size(global.itens_pegos); i++) {
		switch (ds_list_find_value(global.itens_pegos, i)) {
			case obj_municao: //se o jogador pegou municao, instancia a municao no bunker
				if qtde_itens.obj_municao == 0 {
					instance_create_layer(global.posicoes.municao_x, global.posicoes.municao_y, layer_get_id("Instances"), obj_municao, {})
					qtde_itens.obj_municao++
				} else { //se pegou mais de uma municao, no obj_municao estara dizendo quantas ela tem
					obj_municao.qtde_itens++
				}
				break
			case obj_radio:
				if qtde_itens.obj_radio == 0 {
					instance_create_layer(global.posicoes.radio_x, global.posicoes.radio_y, layer_get_id("Instances"), obj_radio, {})
					qtde_itens.obj_radio++
				} else {
					obj_radio.qtde_itens++
				}
				break
			case obj_pilha:
				if qtde_itens.obj_pilha == 0 {
					instance_create_layer(global.posicoes.pilha_x, global.posicoes.pilha_y, layer_get_id("Instances"), obj_pilha, {})
					qtde_itens.obj_pilha++
				} else {
					obj_pilha.qtde_itens++
				}
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