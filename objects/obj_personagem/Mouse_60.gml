/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if alpha == 0 and !opcoes {
	slot_selecionado--
	if slot_selecionado < 1 {
		slot_selecionado = 5
	}

	if obj_anterior != noone { //esse aqui é o ultimo obj que foi instaciado, aquele que estava no slot selecionado por ultimo e foi trocado agora
		//quando rolar o mouse e trocar o selecionado, o ultimo objeto deve ser destruido
		instance_destroy(obj_anterior)
		obj_anterior = noone
	}

	switch slot_selecionado {
		case 1:
			if slot1 != noone {
				desenhar_selecionado(slot1)
			}
			break
		case 2:
			if slot2 != noone {
				desenhar_selecionado(slot2)
			}
			break
		case 3:
			if slot3 != noone {
				desenhar_selecionado(slot3)
			}
			break
		case 4:
			if slot4 != noone {
				desenhar_selecionado(slot4)
			}
			break
		case 5:
			if slot5 != noone {
				desenhar_selecionado(slot5)
			}
			break
	}
}