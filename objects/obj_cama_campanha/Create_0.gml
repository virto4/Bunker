/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false
scale = 0
primeiro = false
primeiro2 = false
tirar = false
mouse_sim = false
mouse_nao = false

draw_set_font(fnt_dialogos)

largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")

sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]

function passar_dia() {
	obj_personagem.passagem_dia = true
	if room == rm_bunker {
		if obj_controlador_evento.esperando_davi {
			obj_controlador_evento.davi_coletou = true
		}
		if obj_controlador_evento.evento_hoje == "comerciante" {
			obj_controlador_evento.mudar_vez = true
		}
		if obj_controlador_evento.evento_hoje == "coleta" {
			obj_controlador_evento.mudar_coleta = true
		}
	}
	if instance_exists(obj_radio) {
		obj_radio.entrou = true
		obj_radio.programacao = noone
		obj_radio.assistiu_hoje = false
	}
	if instance_exists(obj_davi) {
		obj_davi.interagir = true
		obj_davi.comecou_dia = true
	}
	if instance_exists(obj_meredith) {
		obj_meredith.tem_fala = true
		obj_meredith.comecou_dia = true
	}
	if instance_exists(obj_domino) {
		obj_domino.jogou_hoje = false
	}
	if instance_exists(obj_baralho) {
		obj_baralho.jogou_hoje = false
	}
}