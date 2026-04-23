/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = true
function is_ferramentas(slot) {
	if object_get_name(slot) == object_get_name(obj_martelo) and !martelo and !fita and !argamassa {
		cliques++
		largura = 36 * cliques / total_martelo
		clicou2 = true
		tempo = current_time
		if cliques >= total_martelo {
			martelo = true
			cliques = 0
			largura = 36 * cliques / total_fita
			ferramentas = spr_fita_isolante
		}
	}
	if slot == obj_fita_isolante and martelo and !fita and !argamassa {
		cliques++
		largura = 36 * cliques / total_fita
		clicou2 = true
		tempo = current_time
		if cliques >= total_fita {
			fita = true
			cliques = 0 
			largura = 0
			ferramentas = spr_argamassa
		}
	}
	if slot == obj_argamassa and martelo and fita and !argamassa {
		cliques++
		largura = 36 * cliques / total_argamassa
		clicou2 = true
		tempo = current_time
		if cliques >= total_argamassa {
			fita = true
			argamassa = true
		}
	}
}
is_ferramentas(obj_personagem.item_selecionado)