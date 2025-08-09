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

programa = ""
dia_atual = 16
programacao = noone
mensagem_atual = ""
entrou = true
qtde_itens = 1
clicou = false

dia_atual = 16
mes_atual = 7

dia_semana = 0
dia_semana1 = 0
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

noticias_id = 0
noticias = [
	["Bom dia telespectadores. Cá estamos para discutir as noticias mais relevantes da semana.", 
	"Primeiramente, é de cunho comunitário a informação de que ocorreu, em 16/07, a explosão nuclear que danificou a atmosfera terrestre.",
	"Tal explosão é apontada como resultado de um teste por parte dos nazistas na guerra. Teóricos da geopolítica apontam suas motivações a seguir:"],
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

cozinha_id = 0
cozinha = [
	["Cozinha", "Cozinha", "Cozinha"],
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

sobrevivencia_id = 0
sobrevivencia = [
	["sobrevivencia"],
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

jesus_id = 0
jesus = [
	["'O Senhor é meu pastor e nada me faltará': assim diz a Bíblia e assim deve ser.",
	"Que o senhor os proteja e guarde. Amém."],
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

resenha_id = 0
resenha = [
	["discussao e amizade"],
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