/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 100 and !is_aberta and !abrindo {
	audio_play_sound(snd_porta, 1, false)
	obj_personagem.porta = true
	abrindo = true
	tempo = current_time / 1000000
}