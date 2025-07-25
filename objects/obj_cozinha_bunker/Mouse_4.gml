/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 100 and !clicou and !global.tem_tela_aberta{
	global.tem_tela_aberta = true
	clicou = true
}
