/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_speed = 0
tempo = current_time / 1000
lambendo = true
andando = false
tempo2 = current_time / 1000 + 5
voltando = true
comecou_dia = false

if room == rm_bunker {
	terminou = 0
	ipsilon = 0
	frames = 0
	dia_bunker = obj_diario.dia
} else if room == rm_casa {
	sprite_index = spr_meredith_sleep
}

interagir = true
mostrar = false
char_index = 0
type_speed = 0.06; // caracteres por frame
current_text = 0
tempo = 0
aux = false
function escrever(mensagem) {
	draw_set_font(fnt_dialogos)
	if char_index < string_length(mensagem) {
		char_index++
		return string_copy(mensagem, 1, char_index)
	}
}