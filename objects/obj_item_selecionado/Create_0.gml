/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function devolver(_item) {
	for (var _j = 0; _j < array_length(obj_personagem.itens_nao_consumiveis); _j++) {
		if _item == obj_personagem.itens_nao_consumiveis[_j] {
			obj_personagem.is_consumivel = false
			break
		}
	}
	if room_get_name(room) == "rm_casa" and !obj_personagem.is_consumivel {
		switch(_item) { //switch com os objetos nao consumiveis
			case obj_radio:
				instance_create_layer(global.casa.radio_x, global.casa.radio_y, "Instancias", obj_radio, {})
				break
		}
	} else if room_get_name(room) == "rm_bunker" and obj_personagem.is_consumivel {
		if !instance_exists(_item) { //se for 0, o objeto esta destruido, entao deve ser refeito
			switch(_item) { //switch com os objetos consumiveis
				case obj_municao:
					instance_create_layer(global.posicoes.municao_x, global.posicoes.municao_y, "Instances", obj_municao, {})
					break
				case obj_pilha:
					instance_create_layer(global.posicoes.pilha_x, global.posicoes.pilha_y, "Instances", obj_pilha, {})
					break
			}
			_item.qtde_itens-- //como o objeto e instanciado com 1, eu tiro esse para contar o de baixo, que serve para todos
		}
		_item.qtde_itens++ //esse aqui aumenta a quantidade do item no bunker, todas as vezes que colocam ele la
	}
	obj_personagem.is_consumivel = true //preciso voltar para true, que é o padrão, senao da ruim, pois vai ficar false
}