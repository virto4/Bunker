/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
qtde_itens = 1
clicou = false
pecas = []
pecas_jogador = []
pecas_adversario = []
pecas_tela = []
index = 0
comecou = false
monte = []
pecas_mesa = []
largura = 0
cor_peca = #CCCCCC
for (var i = 0; i < 7; i++) {
	for (var j = i; j < 7; j++) {
		array_push(pecas, [i, j])
	}
}
function embaralhar(_array) {
	var i = array_length(_array) - 1;
	while (i > 0) {
		var j = random_range(0, i + 1);
		var temp = _array[i];
		_array[i] = _array[j];
		_array[j] = temp;
		i -= 1;
	}
	return _array;
}
