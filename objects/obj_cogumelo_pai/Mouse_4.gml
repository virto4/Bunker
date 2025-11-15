if !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) {
	global.tem_tela_aberta = true
	obj_controlador_evento.clicou_cogumelo = true
	obj_controlador_evento.instancia_clicada = instance_position(mouse_x, mouse_y, obj_cogumelo_pai)
}