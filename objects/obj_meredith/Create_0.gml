/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
image_speed = 0
tempo = current_time / 1000
lambendo = true
andando = false
tempo2 = current_time / 1000 + 5
voltando = true


if room == rm_bunker {
	terminou = 0
	ipsilon = 0
	frames = 0
} else if room == rm_casa {
	sprite_index = spr_meredith_idle
}