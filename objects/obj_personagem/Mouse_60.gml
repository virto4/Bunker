/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if alpha == 0 and !global.tem_tela_aberta{
	slot_selecionado--
	if slot_selecionado < 1 {
		slot_selecionado = 5
	}

	if obj_anterior != noone { //esse aqui é o ultimo obj que foi instaciado, aquele que estava no slot selecionado por ultimo e foi trocado agora
		//quando rolar o mouse e trocar o selecionado, o ultimo objeto deve ser destruido
		instance_destroy(obj_anterior)
		obj_anterior = noone
	}
}