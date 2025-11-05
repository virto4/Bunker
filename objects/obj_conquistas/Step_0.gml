/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

/*
1- conquista suprema
2- lenda: vença o jogo
3-eu sou estupido: perca o jogo
4-venca 10 batalhas
5-venca 5 batalhas
6-mate o gato
7-nao traga davi para o bunker
8-5 municoes
9-chegue ao bunker
10- assista todos os programas de radio
11-fique deprimido
12-traga todas as armas
13-Dupla dinâmica: deixe ambos os personagens hiperativos e vença batalhas.
14-converse com davi 30 vezes
15-eu sou inevittavel: chegue ao final secreto

*/
if global.conquistas.conquista2 and global.conquistas.conquista3 and global.conquistas.conquista4 and 
	global.conquistas.conquista5 and global.conquistas.conquista6 and global.conquistas.conquista7 and
	global.conquistas.conquista8 and global.conquistas.conquista9 and global.conquistas.conquista10 and
	global.conquistas.conquista11 and global.conquistas.conquista12 and global.conquistas.conquista13 and
	global.conquistas.conquista14 and global.conquistas.conquista15 and !global.conquistas.conquista1 {
		global.conquistas.conquista1 = true
		ganhou_conquista = true
		ds_list_add(global.lista_ganhos, {sprite: spr_estrela1_ganhou, tempo: 0, alpha: 0})
}
if instance_exists(obj_personagem) {
	if obj_personagem.ganhou_jogo and !global.conquistas.conquista2 {
		global.conquistas.conquista2 = true
		ganhou_conquista = true
		ds_list_add(global.lista_ganhos, {sprite: spr_estrela2_ganhou, tempo: 0, alpha: 0})
	}
}
if instance_exists(obj_personagem) {
	if obj_personagem.game_over and !global.conquistas.conquista3 {
		global.conquistas.conquista3 = true
		ganhou_conquista = true
		ds_list_add(global.lista_ganhos, {sprite: spr_estrela3_ganhou, tempo: 0, alpha: 0})
	}
}
if batalhas >= 10 and !global.conquistas.conquista4 {
	global.conquistas.conquista4 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela4_ganhou, tempo: 0, alpha: 0})
}
if batalhas >= 5 and !global.conquistas.conquista5 {
	global.conquistas.conquista5 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela5_ganhou, tempo: 0, alpha: 0})
}
if room == rm_bunker and !instance_exists(obj_davi) and !global.conquistas.conquista7 {
	global.conquistas.conquista7 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela7_ganhou, tempo: 0, alpha: 0})
}
var _municoes = 0
if ds_list_size(global.itens_pegos) > 0 {
	for (var _i = 0; _i < ds_list_size(global.itens_pegos); _i++) {
		if ds_list_find_value(global.itens_pegos, _i) == obj_municao {
			_municoes++
		}
	}
}
if _municoes >= 5 and !global.conquistas.conquista8 {
	global.conquistas.conquista8 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela8_ganhou, tempo: 0, alpha: 0})
}
if room_get_name(room) == "rm_bunker" and !global.conquistas.conquista9 {
	global.conquistas.conquista9 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela9_ganhou, tempo: 0, alpha: 0})
}
if programas_assistidos == 4 and !global.conquistas.conquista10 {
	global.conquistas.conquista10 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela10_ganhou, tempo: 0, alpha: 0})
}
if instance_exists(obj_personagem) {
	if obj_personagem.atributos.humor == obj_personagem.humores[3] and !global.conquistas.conquista11 {
		global.conquistas.conquista11 = true
		ganhou_conquista = true
		ds_list_add(global.lista_ganhos, {sprite: spr_estrela11_ganhou, tempo: 0, alpha: 0})
	}
}
if room == rm_bunker {
	if array_length(obj_personagem.armas_pegas) == 4 and !global.conquistas.conquista12 {
		global.conquistas.conquista12 = true
		ganhou_conquista = true
		ds_list_add(global.lista_ganhos, {sprite: spr_estrela12_ganhou, tempo: 0, alpha: 0})
	}
}
if room == rm_bunker and !global.conquistas.conquista13 {
	if obj_escada.clicou and obj_personagem.atributos.humor == obj_personagem.humores[1] and instance_exists(obj_davi) and obj_escada.derrotou {
		if obj_davi.atributos.humor = obj_davi.humores[1] {
			global.conquistas.conquista13 = true
			ganhou_conquista = true
			ds_list_add(global.lista_ganhos, {sprite: spr_estrela13_ganhou, tempo: 0, alpha: 0})
		}
	}
}
if conversou == 30 and !global.conquistas.conquista14 {
	global.conquistas.conquista14 = true
	ganhou_conquista = true
	ds_list_add(global.lista_ganhos, {sprite: spr_estrela14_ganhou, tempo: 0, alpha: 0})
}
if instance_exists(obj_personagem) {
	if obj_personagem.ganhou_jogo and obj_personagem.final_secreto and !global.conquistas.conquista15 {
		global.conquistas.conquista15 = true
		ganhou_conquista = true
		ds_list_add(global.lista_ganhos, {sprite: spr_estrela15_ganhou, tempo: 0, alpha: 0})
	}
}