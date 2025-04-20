/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if room_get_name(room) == "rm_bunker" {
	global.conquistas.conquista1 = true
	ganhou_conquista = true
	sprite = spr_estrela1_ganhou
}
var _municoes = 0
if ds_list_size(global.itens_pegos) > 0 {
	for (var _i = 0; i < ds_list_size(global.itens_pegos); _i++) {
		if ds_list_find_value(global.itens_pegos, _i) == obj_municao {
			_municoes++
		}
	}
}
if _municoes >= 5 {
	global.conquistas.conquista2 = true
	ganhou_conquista = true
	sprite = spr_estrela2_ganhou
}