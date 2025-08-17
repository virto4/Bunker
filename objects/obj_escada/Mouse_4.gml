/// @description Inserir descrição aqui
// Você pode escrever seu código neste 
if !global.tem_tela_aberta and point_distance(x, y, obj_personagem.x, obj_personagem.y) <= 100 
	and obj_controlador_evento.evento_inimigo and !derrotou{
	clicou = true
	global.tem_tela_aberta = true
	
	seguir = false
	largura_inimigo = (246 * inimigo.vida / inimigo.total_vida < 0) ? 0 : 246 * inimigo.vida / inimigo.total_vida
	largura_davi = (246 * obj_davi.atributos.saude / 100 < 0 ) ? 0 : 246 * obj_davi.atributos.saude / 100

	largura_roger = (246 * obj_personagem.atributos.saude / 100 < 0) ? 0 : 246 * obj_personagem.atributos.saude / 100
	habilidade_roger = ""
	habilidade_davi = ""
	arma_davi = noone
	arma_roger = noone
	obj_personagem.mudou_humor = true
	obj_personagem.atributos.humor = obj_davi.humores[0]
	obj_davi.mudou_humor = true
	obj_davi.atributos.humor = obj_davi.humores[0]
	
	golpe_morte_tempo1 = false
	golpe_morte_numero1 = 1
	mestre_tempo1 = false
	mestre_numero1 = 1

	golpe_morte_tempo2 = false
	golpe_morte_numero2 = 1
	mestre_tempo2 = false
	mestre_numero2 = 1
	contagem = false
	
	critico2 = false
	errou2 = false
	receptor = noone
	
	sua_vez = 0
	batalha = false
}