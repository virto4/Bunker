/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
qtde_itens = 1
jogou_hoje = false
clicou = false
nao_pode = false
tirar = false
comecou = false
cartas = []
carta_monte = 0
carta_monte_passada = 0
sua_vez = true
cartas_davi = []
cartas_roger = []
cartas_comprar = []
scale = 0
comprar = false
descartar = false
msg = ""

reverse = false
alpha = 0

timer = 0
a = false
b = false
c = false
d = false
timer2 = 0
davi_monte = false
davi_descarte = false
carta_descarte = 0
carta_aux = 0
vermelho = []
grupos_roger = []
grupos_davi = []
venceu = false
fechou_grupo = false
instrucoes = false
draw_set_font(fnt_dialogos)
msg_instrucoes = "Nesse jogo, a cada rodada, você compra uma carta de uma das pilhas no centro da tela e coloca uma carta de sua mão na pilha de descarte. Essas ações você realiza clicando com o botão esquerdo do mouse na carta selecionada. O objetivo é formar 3 trios de cartas da seguinte forma: 3 cartas do mesmo número e naipes distintos; 3 cartas do mesmo naipe em sequência. Para selecionar os trios, clique com o botão direito do mouse em cada carta que deseja selecionar."
linhas = 30 * (string_width(msg_instrucoes) div 300)

for (var i = 0; i < 4; i++) {
	for (var j = 1; j <= 13; j++) {
		switch i {
			case 1:
				array_push(cartas, [j, "espadas", 0])
				break
			case 2:
				array_push(cartas, [j, "paus", 0])
				break
			case 3:
				array_push(cartas, [j, "copas", 0])
				break
			case 0:
				array_push(cartas, [j, "ouros", 0])
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

function ordenar(_array) {
	for (var i = 0; i < array_length(_array) - 1; i++) { // ordena as carta em ordem crescente de valor
		for (var j = 0; j < array_length(_array) - 1 - i; j++) {
			if _array[j][0] > _array[j + 1][0] {
				var aux = _array[j + 1]
				_array[j + 1] = _array[j]
				_array[j] = aux
			}
		}
	}
	return _array
}

function eliminar(posicoes) { //tem que ser nessa ordem por k é o ultimo e tem que ser eliminado primeiro
	array_delete(cartas_davi, posicoes[2], 1)
	array_delete(cartas_davi, posicoes[1], 1)
	array_delete(cartas_davi, posicoes[0], 1)
}