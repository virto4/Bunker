/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false
receitas = ds_list_create()
receitas_totais = ds_list_create()
ds_list_add(receitas_totais, obj_arroz_frango, obj_bolo_chocolate, obj_bolo_quatro_quartos, obj_chucrute, obj_cookie, obj_escondidinho, obj_ovo_mexido, obj_salada)

posicoes = [[472, 380], [780, 380], [1090, 380], [1408, 380],
			[472, 688], [780, 688], [1090, 688], [1408, 688 ]]
			
//irei declarar um booleano para cada receita, para saber se o cara pode ou nao fazer essa receita 
bolo_chocolate = false
bolo_quatro_quartos = false
cookie = false
ovo_mexido = false
chucrute = false
escondidinho = false
arroz_frango = false
salada = false