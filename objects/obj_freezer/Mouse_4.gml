/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 200 and !global.tem_tela_aberta {
	clicou = true
	global.tela_hotbar = true
	global.tem_tela_aberta = true
}