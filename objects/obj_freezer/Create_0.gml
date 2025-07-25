/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false

posicoes = [
	[obj_acucar, 290, 804],
	[obj_agua, 500, 810],
	[obj_alface, 620, 620],
	[obj_arroz, 400, 450],
	[obj_batata, 800, 615],
	[obj_cerveja, 680, 804],
	[obj_chocolate, 1120, 802],
	[obj_farinha, 1450, 440],
	[obj_frango, 670, 438],
	[obj_ovo, 1600, 620],
	[obj_repolho, 1600, 804],
	[obj_bolo_chocolate, 1600, 450],
	[obj_bolo_quatro_quartos, 1500, 615],
	[obj_cookie, 500, 620],
	[obj_escondidinho, 289, 450],
	[obj_chucrute, 810, 460],
	[obj_arroz_frango, 1110, 620],
	[obj_salada, 980, 800],
	[obj_ovo_mexido, 1000, 320]
]

quantidades = [
	[obj_acucar, 2],
	[obj_agua, 1],
	[obj_alface, 3],
	[obj_arroz, 4],
	[obj_arroz_frango, 5],
	[obj_batata, 5],
	[obj_bolo_chocolate, 1],
	[obj_bolo_quatro_quartos, 3],
	[obj_cerveja, 3],
	[obj_chocolate, 1],
	[obj_chucrute, 1],
	[obj_cookie, 1],
	[obj_escondidinho, 1],
	[obj_farinha, 1],
	[obj_frango, 1],
	[obj_ovo, 1],
	[obj_ovo_mexido, 1],
	[obj_repolho, 1],
	[obj_salada, 1]
]

for (var i = 0; i < ds_list_size(global.alimentos_pegos); i++) {
	for (var j = 0; j < array_length(quantidades); j++) {
		if ds_list_find_value(global.alimentos_pegos, i) == quantidades[j][0] {
			quantidades[j][1]++
			break
		}
	}
}