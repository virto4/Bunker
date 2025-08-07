/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false

mouse_sim = false
mouse_nao = false

draw_set_font(fnt_dialogos)

largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")

sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]