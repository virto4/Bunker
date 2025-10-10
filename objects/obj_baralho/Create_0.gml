/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
qtde_itens = 1

clicou = false
comecou = false
cartas = []
carta_monte = 0
carta_monte_passada = 0
sua_vez = true
cartas_davi = []
cartas_roger = []
cartas_comprar = []

comprar = false
descartar = false
msg = ""

reverse = false
alpha = 0

timer = 0
a = false

for (var i = 0; i < 4; i++) {
	for (var j = 1; j <= 13; j++) {
		switch i {
			case 1:
				array_push(cartas, {numero: j, naipe: "espadas", valor: 0})
				break
			case 2:
				array_push(cartas, {numero: j, naipe: "paus", valor: 0})
				break
			case 3:
				array_push(cartas, {numero: j, naipe: "copas", valor: 0})
				break
			case 0:
				array_push(cartas, {numero: j, naipe: "ouros", valor: 0})
				break
		}
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