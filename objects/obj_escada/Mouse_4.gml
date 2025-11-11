/// @description Inserir descrição aqui
// Você pode escrever seu código neste 
if !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 200 and obj_controlador_evento.evento_inimigo and !derrotou {
	question = true 
}
if obj_controlador_evento.evento_comerciante and obj_controlador_evento.evento_hoje == "comerciante" and !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 200 {
	obj_controlador_evento.interagir_comerciante = true
	global.tem_tela_aberta = true
}
if obj_controlador_evento.evento_coleta and obj_controlador_evento.evento_hoje == "coleta" and !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 200 {
	obj_controlador_evento.sair_bunker = true
	global.tem_tela_aberta = true
}