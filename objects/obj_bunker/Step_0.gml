/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if point_distance(x, y, obj_personagem.x, obj_personagem.y) < 200 {
	image_speed = 1
	if !primeiro and !audio_is_playing(snd_portao_bunker){
		audio_play_sound(snd_portao_bunker, 1, false)
		passou = true
		primeiro = true
	}
	if image_index >= image_number - 1 {
		image_speed = 0
		image_index = image_number - 1
	}
} else {
	primeiro = false
	image_speed = -1
	if !audio_is_playing(snd_portao_bunker) and passou {
		audio_play_sound(snd_portao_bunker, 1, false)
	}
	if image_index <= 1 {
		image_speed = 0
		image_index = 0
	} 
	passou = false
}