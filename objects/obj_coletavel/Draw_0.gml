/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var is_consumivel = false
for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
	if object_index == obj_personagem.itens_nao_consumiveis[i] {
		is_consumivel = true
		break
	}
}
draw_self()
if room == rm_bunker and !is_consumivel {
	draw_set_font(fnt_dialogos_menor)
	draw_set_color(c_black)
	draw_text(x, y - 5, qtde_itens)
}