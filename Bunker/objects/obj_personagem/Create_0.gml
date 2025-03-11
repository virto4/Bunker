/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
velh				= 0
velv				= 0
vel					= 5
vel_diagonal		= 3.5
vel_pulo			= 7
apertou_pulo		= false
posicao_pre_pulo	= 0
colidiu_porta_aux	= false
objetos_colidiveis	= [obj_porta, obj_chao, obj_chao_lateral, obj_geladeira, 
					obj_cama_roger, obj_cama_davi, obj_armario1, obj_armario2]

inputs = {
	esquerda	: ord("A"),
	direita		: ord("D"),
	cima		: ord("W"),
	baixo		: ord("S"),
	pulo		: vk_space
}