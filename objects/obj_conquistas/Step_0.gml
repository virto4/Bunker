/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if room_get_name(room) == "rm_bunker" and !global.conquistas.conquista1 {
	global.conquistas.conquista1 = true
	ganhou_conquista = true
	ds_list_add(lista_ganhos, {sprite: spr_estrela1_ganhou, tempo: 0, alpha: 0})
}
var _municoes = 0
if ds_list_size(global.itens_pegos) > 0 {
	for (var _i = 0; _i < ds_list_size(global.itens_pegos); _i++) {
		if ds_list_find_value(global.itens_pegos, _i) == obj_municao {
			_municoes++
		}
	}
}
if _municoes >= 5 and !global.conquistas.conquista2 {
	global.conquistas.conquista2 = true
	ganhou_conquista = true
	ds_list_add(lista_ganhos, {sprite: spr_estrela2_ganhou, tempo: 0, alpha: 0})
}