/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
switch obj_personagem.slot_selecionado { //vê qual item esta selecionado
	case 1:
		if obj_personagem.slot1 != noone {
			devolver(obj_personagem.slot1)
			obj_personagem.slot1 = noone
		}
		break
	case 2:
		if obj_personagem.slot2 != noone {
			devolver(obj_personagem.slot2)
			obj_personagem.slot2 = noone
		}
		break
	case 3:
		if obj_personagem.slot3 != noone {
			devolver(obj_personagem.slot3)
			obj_personagem.slot3 = noone
		}
		break
	case 4:
		if obj_personagem.slot4 != noone {
			devolver(obj_personagem.slot4)
			obj_personagem.slot4 = noone
		}
		break
	case 5:
		if obj_personagem.slot5 != noone {
			devolver(obj_personagem.slot5)
			obj_personagem.slot5 = noone
		}
		break
}
	
obj_personagem.item_devolvido = true

if obj_personagem.obj_anterior != noone { //tira o desenho que esta por cima do item
	instance_destroy(obj_personagem.obj_anterior)
	obj_personagem.obj_anterior = noone
}
