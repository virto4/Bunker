/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
switch slot_selecionado {
	case 1:
		casa(slot1, slot1_novo, slot1_n)
		slot1 = noone
		break
	case 2:
		casa(slot2, slot2_novo, slot2_n)
		slot2 = noone
		break
	case 3:
		casa(slot3, slot3_novo, slot3_n)
		slot3 = noone
		break
	case 4:
		casa(slot4, slot4_novo, slot4_n)
		slot4 = noone
		break
	case 5:
		casa(slot5, slot5_novo, slot5_n)
		slot5 = noone
		break
}
function mudar_slot_cheio() { //muda para o slot cheio
	for (var _i = 1; _i <= 5; _i++) {
		slot_selecionado--
		if slot_selecionado < 1 {
			slot_selecionado = 5
		}
		if slot_selecionado == 1 and slot1 != noone {
			break
		} else if slot_selecionado == 2 and slot2 != noone {
			break
		} else if slot_selecionado == 3 and slot3 != noone {
			break
		} else if slot_selecionado == 4 and slot4 != noone {
			break
		} else if slot_selecionado == 5 and slot5 != noone {
			break
		}
	}
}
mudar_slot_cheio()