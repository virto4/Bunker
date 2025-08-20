/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
qtde_itens = 1
clicou = false
pecas = []
pecas_jogador = []
pecas_adversario = []
comecou = false
monte = []
for (var i = 0; i < 7; i++) {
	for (var j = 0; j < 7; j++) {
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