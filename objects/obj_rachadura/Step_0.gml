/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if numero == 1 {
	sprite_index = spr_rachadura_1
}
if cliques == total {
	if current_time > tempo_alpha + 20 {
		alpha -= 0.05
		tempo_alpha = current_time
	} else {
		instance_destroy()
	}
}