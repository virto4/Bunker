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

sem_programa = ["Sem programação para hoje."]

noticias_id = 0
noticias = [
	["Bom dia, telespectadores. Cá estamos para discutir as noticias mais relevantes da semana.", 
	"Primeiramente, é de cunho comunitário a informação de que ocorreu, em 16/07, a explosão nuclear que danificou a atmosfera terrestre.",
	"Tal explosão é apontada como resultado de um teste por parte dos nazistas na guerra. Por hoje é só, até semana que vem."],
	["Crise climática global com tempestades gigantes de névoa radiotiva se intensifica; especialistas apontam recuperação total do planeta para alguns milhares de anos, considerando a meia vida do isótopo mais instável do urânio.",
	"Além disso, com o comércio global estagnado, governos tem dificuldade de abrigar ou suprir nessecidades do povo. Boa noite"],
	["Animais mutantes começam a aparecer e atacar sobreviventes: baratas com 20 centímetros de comprimento; formgas com venenos capaz de matar 3 pessoas; até mesmo mulheres humanas dão luz à crianças com deficiências nunca antes vistas."],
	["Terremoto de magnetude 9.8 no Japão causa submersão de toda uma ilha e tsunamis por todo o pacífico; estimativas dizem que a população mundial restante está na casa dos 100 milhões, e deve cair a 0 nos próximas 2 anos."],
	["Presidente dos EUA renuncia ao cargo e desaparece misteriosamente; Congresso, com apenas 3 representantes vivos, se recusa a comentar.",
	"Além da fome, a criminalidade aumenta pelo planeta: furto, latrocínio, estupro, homicídio..."],
	["Líderes mundiais propõem a criação da Organização das Nações Unidas (ONU), para gerenciar as crises. Protocolo não é aceito e continuamos cada um por si.", ],
	["ONG's da região, munidas de fazendas hidropônicas, tomam decisão de ajudar os moradores locais resisdentes em abrigos.", 
	" Compareça no endereço da organização: Rua 13 de Maio, número 220 se quiser receber algo."],
	["Nível do mar começa a subir devido ao derretimento das geleiras; terras emersas agora são 70% do que eram antes."
	,"Intemperismo físico começa a deformar grandes formações rochosas pela erosão, ocasionando grandes falhas geológicas e formação de enormes crateras em locais aleatórios;",
	"URSS ameaça tomar terras de toda a Europa que não foram afetadas, para fortalecer sua própria população; é possúvel que a Guerra seja retomada?"],
	["EUA começam a investir no projeto Apolo, para levar cidadãos do país à Lua na intensão de reestabelecer a humanidade;",
	" URSS corre atrás dos prejuízos de sua empreitada anterior para concorrer com os EUA."],
	["Misteriosos Homens de Preto são vistos invadindo bunkers por toda parte; não se sabe o que querem nem o que fazem.",
	"Só se sabe que, depois que aparecem, ou matam os habitantes do abrigo ou os levam embora. "],
	["Projetos de ONG's planejam novamente realizar entregas de mantimentos no endereço da rua 13 de Maio. Compareça até amanhã, 12h"],
	["Programa espacial americano é um fracasso total; acumulam mais de 5 mortes em tentativas de lançamento; russos não se saem muito melhor.",
	"Estima-se que vida na terra perdeu 97% de sua biodiversidade; humanos são 5% do que eram."],
	["Projetos de ONG's planejam novamente realizar entregas de mantimentos no endereço da rua 13 de Maio. Compareça até amanhã, 12h"],
	["Alerta! Alerta!: nuvem de radiação causada pel Especialistas estimam que a o que restou da Europa e da América seja completamente dizimada. Busquem abrigo subterrâneo seguro; busquem comida o mais rápido possível e se escondam. Que Deus te ame a gurde. Amém"],
]

cozinha_id = 0
cozinha = [
	["Bom dia telespectadores! Estamos aqui para apresentar meu programa 'Cozinha Improvisada', no qual revelo-lhes segredos e técnicas culinárias diversas!",
	"Hoje, vamos cozinhar um ovo mexido! Primeiro, separe 3 ovos de galinha.", "Em seguida coloque no fogo baixo e mexa, retirando e recolocando no fogo várias vezes até o ovo fica pronto.",
	"E está pronto! Viu como é fácil? Muito obrigado por assistir e até a próxima."],
	["Ora, ora, se não é dia de mais um episódio de 'Cozinha Improvisada!'", "Hoje, aprenderemos salada Caesar! um tipo de salada com croutons de pão, frango desfiado e alface!",
	"Primeiramente, corte pedaços de pão amanhecido e frite. Cozinhe o frango e desfie. Corte as folhas do alface. Misture tudo e está pronto! Desejo uma boa semana a todos e até a próxima edição!"],
	["Bem vindos de volta! Hoje vamos aprender bolo de chocolate. É simples assim: misture ovos e açúcar; adicione o chocolate derretido e misture; por fim, mistura a farinha e asse. Está pronto! Até a próxima!"],
	["Bom dia, boa tarde, boa noite! Hoje vamos aprender uma receita simples e prática, que qualquer pessoa consegue fazer: bolo quatro quartos!",
	"Basta misturar 4 ingredientes em proporções iguais: manteiga, ovos, açúcar e farinha. Asse e se delicie!"],
	
	["[Reprise] Bom dia telespectadores! Meu nome é Kelly e estou aqui para apresentar meu programa 'Cozinha Improvisada', no qual revelo-lhes segredos e técnicas culinárias diversas!",
	"[Reprise] Hoje, vamos cozinhar um ovo mexido! Primeiro, separe 3 ovos de galinha.", "[Reprise] Em seguida coloque no fogo baixo e mexa, retirando e recolocando no fogo várias vezes até o ovo fica pronto."],
	["[Reprise] Ora, ora, se não é dia de mais um episódio de 'Cozinha Improvisada!'", "[Reprise] Hoje, aprenderemos salada Caesar! um tipo de salada com croutons de pão, frango desfiado e alface!",
	"Primeiramente, corte pedaços de pão amanhecido e frite. Cozinhe o frango e desfie. Corte as folhas do alface. Misture tudo e está pronto! Desejo uma boa semana a todos e até a próxima edição!"],
	["[Reprise] Bem vindos de volta! Hoje vamos aprender bolo de chocolate. É simples assim: misture ovos e açúcar; adicione o chocolate derretido e misture; por fim, mistura a farinha e asse. Está pronto! Até a próxima!"],
	["[Reprise] Bom dia, boa tarde, boa noite! Hoje vamos aprender uma receita simples e prática, que qualquer pessoa consegue fazer: bolo quatro quartos!",
	"[Reprise] Basta misturar 4 ingredientes em proporções iguais: manteiga, ovos, açúcar e farinha. Asse e se delicie!"],
	
	["[Reprise] Bom dia telespectadores! Meu nome é Kelly e estou aqui para apresentar meu programa 'Cozinha Improvisada', no qual revelo-lhes segredos e técnicas culinárias diversas!",
	"[Reprise] Hoje, vamos cozinhar um ovo mexido! Primeiro, separe 3 ovos de galinha.", "[Reprise] Em seguida coloque no fogo baixo e mexa, retirando e recolocando no fogo várias vezes até o ovo fica pronto."],
	["[Reprise] Ora, ora, se não é dia de mais um episódio de 'Cozinha Improvisada!'", "[Reprise] Hoje, aprenderemos salada Caesar! um tipo de salada com croutons de pão, frango desfiado e alface!",
	"Primeiramente, corte pedaços de pão amanhecido e frite. Cozinhe o frango e desfie. Corte as folhas do alface. Misture tudo e está pronto! Desejo uma boa semana a todos e até a próxima edição!"],
	["[Reprise] Bem vindos de volta! Hoje vamos aprender bolo de chocolate. É simples assim: misture ovos e açúcar; adicione o chocolate derretido e misture; por fim, mistura a farinha e asse. Está pronto! Até a próxima!"],
	["[Reprise] Bom dia, boa tarde, boa noite! Hoje vamos aprender uma receita simples e prática, que qualquer pessoa consegue fazer: bolo quatro quartos!",
	"[Reprise] Basta misturar 4 ingredientes em proporções iguais: manteiga, ovos, açúcar e farinha. Asse e se delicie!"],
	
	["[Reprise] Bom dia telespectadores! Meu nome é Kelly e estou aqui para apresentar meu programa 'Cozinha Improvisada', no qual revelo-lhes segredos e técnicas culinárias diversas!",
	"[Reprise] Hoje, vamos cozinhar um ovo mexido! Primeiro, separe 3 ovos de galinha.", "[Reprise] Em seguida coloque no fogo baixo e mexa, retirando e recolocando no fogo várias vezes até o ovo fica pronto."],
	["[Reprise] Ora, ora, se não é dia de mais um episódio de 'Cozinha Improvisada!'", "[Reprise] Hoje, aprenderemos salada Caesar! um tipo de salada com croutons de pão, frango desfiado e alface!",
	"Primeiramente, corte pedaços de pão amanhecido e frite. Cozinhe o frango e desfie. Corte as folhas do alface. Misture tudo e está pronto! Desejo uma boa semana a todos e até a próxima edição!"],
	["[Reprise] Bem vindos de volta! Hoje vamos aprender bolo de chocolate. É simples assim: misture ovos e açúcar; adicione o chocolate derretido e misture; por fim, mistura a farinha e asse. Está pronto! Até a próxima!"],
	["[Reprise] Bom dia, boa tarde, boa noite! Hoje vamos aprender uma receita simples e prática, que qualquer pessoa consegue fazer: bolo quatro quartos!",
	"[Reprise] Basta misturar 4 ingredientes em proporções iguais: manteiga, ovos, açúcar e farinha. Asse e se delicie!"],
]
ovo_mexido = false
bolo_chocolate = false
bolo_quatro_quartos = false
salada = false

sobrevivencia_id = 0
sobrevivencia = [
	["Nesse programa, possarei para vocês técnics de sobrevivência após o apocalipse.", 
	"Na edição de hoje, ensinarei algumas técnicas de reparo no seu abrigo. É simples: tome cuidado com as ventilações, sempre limpando quando precisar; use água sanitária para retirar mofo das paredes e corrija vazamentos ou rachaduras no chão e teto.",
	"Semana que vem tem mais. Até lá!"],
	["Num mundo conturbado como esse, é imprescindível saber se defender. Portanto, darei dicas sobre porte de armas de fogo.", " É simples: desative a trava de segurança e mire, com olhos fixos no alvo. Não tenha insegurança e não exite, mas também não seja confiante demais.",
	"procure mirar em partes não vitais e puxe o gatilho; lembre-se de abastecer-se de munições regularmente e pense que aqui é matar ou morrer.", "Boa noite e até mais."],
	["Boa noite: no dia de hoje falaremos sobre ferramentas de corte. Elas são suas maiores aliadas; machados, facas, facões, canivetes... cada uma tem sua função e podem ser usadas como armas ou ferramentas.",
	" Deixe elas sempre afiadas; para isso, basta água e uma pedra para amolar, e o procedimento é simples: esfregue a lâmina na pedra a um ãngulo de 45°, com movimentos circulares.",
	"Para usar e não se ferir, procure sempre portar e utilizar a arma num ângulo tambbém próximo aos 45°. Espero ter ajudado e até a vista."],
	["No episódio de hoje, trataremos sobre sobrevivência na mata. As 4 principais coisas são: água, alimento, abrigo e fogo. Sua prioridade é aquela que estará mais escassa em sua região. ",
	"Procure filtrar e aquecer a água de córregos para beber; monte armadilhas para pequenos animais e aprenda a diagnosticar se uma planta é venenosa ou não.",
	"Faça fogo com pederneiras ou fósforos (leve-os sempre consigo) e monte abrigo em alguma clareira ou caverna; senão, cubra-se com uma generosa camada de folhas e deleite-se.",
	"Boa noite."],
	["Mente forte vence – O desespero é o maior inimigo. Respire fundo, planeje e aja. Você é mais resistente do que imagina!"],
	["Silêncio é ouro – Evite gritar ou fazer barulho desnecessário. Sons atraem curiosos – e nem todos são amigos."],
	["[Reprise] Boa noite: no dia de hoje falaremos sobre ferramentas de corte. Elas são suas maiores aliadas; machados, facas, facões, canivetes... cada uma tem sua função e podem ser usadas como armas ou ferramentas.",
	"[Reprise] Deixe elas sempre afiadas; para isso, basta água e uma pedra para amolar, e o procedimento é simples: esfregue a lâmina na pedra a um ãngulo de 45°, com movimentos circulares.",
	"[Reprise] Para usar e não se ferir, procure sempre portar e utilizar a arma num ângulo tambbém próximo aos 45°. Espero ter ajudado e até a vista."],
	["Hoje falaremos sobre primeiros socorros. O básico é o XABCDE: comece verificando hemorragias; em seguida vias aéreas, respiração, circulação, disposição e, por fim, exposição. Boa noite."],
	["Defesa contra animais silvestres: não que tenham sobrado muitos mais, mas as dica de ouro é a seguinte: mantenha contato visual e retroceda lentamente; em alguns casos, se não funcionar, assuste o animal, tenatndo mostrar-se mais forte e alto. Boa noite."],
	["Nós salvam vidas – Domine nós como o parafuso e o prussik para escalar, prender armadilhas ou construir abrigos."],
	["Conheça plantas comestíveis: lembre-se que frutos coloridos demais, de odor forte e acre e que apresentam fiapos como nossos cabelos geralmente não devem ser consumidos."],
	["Armadilhas silenciosas – Aprenda a fazer armadilhas com galhos e cordas para capturar pequenos animais sem gastar energia."],
	["Água é vida – Encontre fontes limpas, como riachos, e ferva ou filtre antes de beber. Evite desidratação a todo custo!"],
	["Fogo salva – Aprenda a fazer fogo com pederneira, lupa ou graveto. Mantenha as chamas acesas para aquecer e afastar animais."],
]

jesus_id = 0
jesus = [
	["'O Senhor é meu pastor e nada me faltará' (Salmo 23:1) - assim diz a Bíblia e assim deve ser.",
	"Que o senhor os proteja e guarde. Amém."],
	["'Deus é amor' (1 João 4:8) – Seu amor é infinito e incondicional. Hoje, abra seu coração e deixe essa verdade guiar seus passos."],
	["'Tudo posso naquele que me fortalece' (Filipenses 4:13) – Nas dificuldades, lembre-se: Cristo é sua força. Confie e siga em frente!"],
	["'Buscai primeiro o Reino de Deus' (Mateus 6:33) – Coloque Deus em primeiro lugar, e Ele cuidará de todas as suas necessidades."],
	["'Amai-vos uns aos outros' (João 13:34) – O amor é o maior mandamento. Pratique-o hoje e sempre."],
	["'A oração do justo tem grande poder' (Tiago 5:16) – Não subestime a força da oração. Fale com Deus agora!"],
	["'Eu estou contigo todos os dias' (Mateus 28:20) – Você nunca está sozinho. Cristo caminha ao seu lado."],
	["'A paz esteja convosco' (João 20:19) – A verdadeira paz vem de Jesus. Receba essa graça hoje!"],
	["'A fé sem obras é morta' (Tiago 2:17) – Suas ações revelam sua fé. Seja luz no mundo!"],
	["'Onde está o teu tesouro, aí está o teu coração' (Mateus 6:21) – Invista no céu, onde nada se corrompe."],
	["'Eis que faço novas todas as coisas' (Apocalipse 21:5) – Com Cristo, há sempre um recomeço. Creia!"],
	["'Minha graça te basta' (2 Coríntios 12:9) – Na fraqueza, Deus nos fortalece. Confie nEle!"],
	["'Perdoai setenta vezes sete' (Mateus 18:22) – O perdão liberta. Deixe o ódio e viva em paz."],
	["'Quem crê em Mim terá a vida eterna' (João 3:16) – Jesus é o caminho. Creia e seja salvo!"],
]