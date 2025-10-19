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

msg = "Miau, maiu."

if room == rm_bunker {
	tem_fala = true
} else {
	tem_fala = false
}
mostrar = false
char_index = 1
type_speed = 0.06; // caracteres por frame
current_text = 0
tempo_fala = 0
aux = false
clicou = false
audio = 0
function escrever(mensagem) {
	if char_index < string_length(mensagem) {
		char_index++
		current_text =  string_copy(mensagem, 1, char_index)
	}
}