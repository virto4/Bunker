/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
velh				= 0
velv				= 0
vel					= 5
vel_diagonal		= 3.5
vel_pulo			= 7
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
	pulo		: vk_space
}

if room_get_name(room) == "rm_casa" {
	tempo_decorrido = current_time + 20000 //a data atual mais 10 segundos
	tempo_escrito = tempo_decorrido - current_time
} else if room_get_name(room) == "rm_bunker" if room_get_name(room) == "rm_bunker" and ds_list_size(global.itens_pegos) > 0 {
	for (i = 0; i < ds_list_size(global.itens_pegos); i++) {
		switch (ds_list_find_value(global.itens_pegos, i)) {
			case obj_municao:
				if qtde_itens.obj_municao == 0 {
					instance_create_layer(global.posicoes.municao_x, global.posicoes.municao_y, layer_get_id("Instances"), obj_municao, {})
					qtde_itens.obj_municao++
				} else {
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