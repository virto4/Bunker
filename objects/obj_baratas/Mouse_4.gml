/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

function matar(slot) {
	if slot == obj_inseticida {
		morreu = true
	}
}

tempo = current_time

switch obj_personagem.slot_selecionado {
	case 1:
		matar(obj_personagem.slot1)
		break
	case 2:
		matar(obj_personagem.slot2)
		break
	case 3:
		matar(obj_personagem.slot3)
		break
	case 4:
		matar(obj_personagem.slot4)
		break
	case 5:
		matar(obj_personagem.slot5)
		break
}