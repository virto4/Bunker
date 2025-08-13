/// @description Inserir descrição aqui
// Você pode escrever seu código neste 
if !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 100 
	and obj_controlador_evento.evento_inimigo and !derrotou{
	clicou = true
	global.tem_tela_aberta = true
}