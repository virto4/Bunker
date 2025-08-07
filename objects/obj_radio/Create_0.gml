/// @description Inserir descrição aqui
// Você pode escrever seu código neste eds
//sexta: Semanário do Sobrevivente, programa de humor em que um grupo de amigos contam piadas e discutem temas corriqueiros entre os que sobraram
//quarta: Cozinha Improvisada, prigrama de cozinha em que Kelly expõe seus conhecimentos práticos de culinária
//segunda: Guia de Sobrevivência Pós-Apocalíptica, programa no qual o ex-militar Roberto Navas fala sobre dicas de sobrevivência em situações de recursos escassos e pode dar habilidades ao jogador de reparos em seu bunker e de combate
//quinta: Notícias Urgentes, fala sobre decisões governamentais, ONG's e suas ações recentes, catástrofes ambientes próximas, dicas de locais de distribuição de recurso
//domingo: radio jesus, Padre Keyson leva sua palavra de fé aos católicos restantes
//todo dia: musica, somente música tocando mesmo
function escrever(mensagem) {
	draw_set_font(fnt_dialogos)
	if char_index < string_length(mensagem) {
		char_index++
		current_text = string_copy(mensagem, 1, char_index)
	}
}

function quebrar_texto(texto, largura_maxima) {
    var linhas = [];
    var palavras = string_split(texto, " ");
    var linha_atual = "";
    var i;

    for (i = 0; i < array_length(palavras); i++) {
        var palavra = palavras[i];
        var linha_teste = linha_atual + palavra + " ";

        if (string_width(linha_teste) > largura_maxima) {
            array_push(linhas, string_trim(linha_atual));
            linha_atual = palavra + " ";
        } else {
            linha_atual = linha_teste;
        }
    }

    if (linha_atual != "") {
        array_push(linhas, string_trim(linha_atual));
    }

    return linhas;
}

programacao = []

qtde_itens = 1
clicou = false

j = 0
indice_atual = 0
tempo = 0
texto_atual = 0
clicou_cancelar = false
clicou_radio = false

linhas_anteriores = ds_list_create()
aux = false
current_text = "";
full_text = "";
display_text = "";
char_index = 0;
type_speed = 0.06; // caracteres por frame
timer = 0;
messages = [];
box_width = 500;
box_height = 150;
box_x = room_width/2 - box_width/2;
box_y = room_height - box_height - 20;

noticias = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
]

cozinha = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
]

sobrevivencia = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
]

jesus = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
]

resenha = [
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
	[],
]

musica = [

]