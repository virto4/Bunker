/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = true
function is_ferramentas(slot) {
	if object_get_name(slot) == object_get_name(obj_chave_fenda) and !chave and !fita {
		cliques++
		largura = 36 * cliques / total_chave
		tempo = current_time
		clicou2 = true
		if cliques == total_chave {
			cliques = 0
			largura = 0
			ferramentas = spr_fita_isolante
		}
	}
	if object_get_name(slot) == object_get_name(obj_fita_isolante) and chave and !fita {
		cliques++
		largura= 36 * cliques / total_fita
		tempo = current_time
		clicou2 = true
		if cliques == total_fita {
			tempo_alpha = current_time
			
		}
	}
}

switch (obj_personagem.slot_selecionado) {
	case 1:
		is_ferramentas(obj_personagem.slot1)
		break
	case 2:
		is_ferramentas(obj_personagem.slot2)
		break
	case 3:
		is_ferramentas(obj_personagem.slot3)
		break
	case 4:
		is_ferramentas(obj_personagem.slot4)
		break
	case 5:
		is_ferramentas(obj_personagem.slot5)
		break
}
