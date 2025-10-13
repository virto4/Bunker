/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
interagir = true

humores = ["NEUTRO", "EXTASIADO", "COLÉRICO", "DEPRIMIDO", "APAVORADO"]

atributos = {
	saude: 100,
	fome: 100,
	sede: 100,
	sanidade: 100,
	humor: humores[0],
	sagacidade: 50,
	forca: 25,
	resistencia: 35,
	fortuna: 45,
}

mudou_humor = false

alimento = false
alimento_scale = 0
alpha_sim = 0
alpha_nao = 0
mouse_sim = false
mouse_nao = false
draw_set_font(fnt_dialogos)
largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")
sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]
alimentou = false
y_alimentou = y - sprite_height / 2 + 20
aumento_fome = 0

remedio = false
tomou_remedio = false
aumento_saude = 0

comecou_dia = false
dia_bunker = 0
terminou = 0
frames = 0
ipsilon = 0
tempo = 0

/* davi é um jovem que joga basquete, gosta de ler, meditar e é bastante introspectivo. 
durante toda sua vida, teve que lidar com os caprichos do pai, que o proibia de fazer um monte de coisas por conta de suas opiniões bastante controversas;
ele não tem muitos amigos, pois todos o julgam por conta de seu pai maluco.
No entanto, davi é um exemplo de humildade e se destaca em várias habilidades, tanto intelectuais, como emocionais e físicas
ele sofreu de muita ansiedade e depressao na época da morte de sua mãe, que orreu de tifo no início da sua adolescência
ele sempre culpou o pai por não ter levado a sério a doença da mãe, pelo menos, não tão a serio quanto todas suas outras paranoias.
agora, davi já está recuperado de sua depressão, pois aprendeu a focar em coisas que realmente importam e construiu diversos habitos saudaveis para enfrentar a dor da perda.

retratos: feliz, com raivo, triste, apavorado, neutro

*/
falas = [
	[{fala: "Poxa, pai, que coisa horrível... será que algum dia vamos sair daqui?", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}, 
	{fala: "Gostaria de dizer que sim, filho... mas nenhum de nós acredita nisso.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Vamos adicionar essa às palavras de sabedoria.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
//	[{fala: "Sabe a diferença entre uma privada e uma bicicleta?", retrato: spr_alface/*davi neutro*/, personagem: "Davi"},
//	{fala: "A bicicleta você senta pra correr, a privada você corre pra sentar.", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"},
//	{fala: "...", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
//	{fala: "Essa geração está perdida mesmo...", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Está um tédio aqui dentro... não tem livros, não tem TV nem ar puro... Deus! Era feliz e não sabia lá fora...", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Eaí, filho, tudo em cima?", retrato: spr_acucar/*roger feliz*/, personagem: "roger"}, {fala: "Bença, pai.", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"}],
	//5
	[{fala: "Vamos lá, troca de pensamentos: eu lhe dou um pensamento meu, e você me dá um seu.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Eu começo: queria poder deitar na relva e desfrutar um piquenique ar pôr do sol, em família, como nos velhos tempos.", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"},
	{fala: "Eu queria mesmo era experimentar pela última vez a torta de maçã da sua avó; com sorvete de creme ficava divina!", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Não consigo parar de pensar naquela torta de maça da vovó... Será que ela sobreviveu? Nem quero imaginar.", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Nunca pensei que sentiria tanta falta de fazer exercícios físicos!", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Agora você me fez lembrar do meu tempo de jogador de basquete. Será que algum dia vou voltar a jogar?", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Pai... você tem saudades da mamãe de vez em quando?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"},
	{fala: "Tenho filho... bastante, por quê?", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Nada não...", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
//	[{fala: "Pai: top 3 frutas, agora!", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"}, {fala: "Tomate, pera e maçã", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
//	{fala: "Tomate? E desde quando tomate é fruta?", retrato: spr_acucar/*Davi neutro*/, personagem: "Davi"}, {fala: "Desde que o mundo é mundo filho; vai dizer que nunca experimentou uma mordidona de tomate?", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
//	{fala: "Jesus...", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	//10
	[{fala: "Pai, você acha que ainda tem gente lá fora?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"},
	{fala: "Acho que sim, filho. Acho que tem muitas pessoas vagando por aí, mas não podemos ajudar nenhuma. Temos que nos preocupar com os nossos.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Tenho saudades da mamãe...", retrato: spr_acucar/*davi triste*/, personagem: "Davi"},
	{fala: "Filho, tente não falara muito disso, tá bom? Estamos bem melhor sem remoer mágoas do passado.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Pra você é fácil falar né? Já que foi você que não quis que ela fosse no médico porque 'os médicos não são confiáveis'!", retrato: spr_acucar/*Davi com raiva*/, personagem: "Davi"},
	{fala: "E vai dizer que eu estou errado? Essas vacinas aí estã cheias de micróbios, os hospitais são sujos e contaminados e nenhum médico poderia ter tratado sua mãe melhor do que eu tratei!", retrato: spr_acucar/*roger nervoso*/, personagem: "Roger"},
	{fala: "Nossa, pai... você é muito escroto! Você nem se importava com ela! Tratou-a como lixo a vida toda, você pensa que eu não ouvia suas brigas?", retrato: spr_acucar/*davi triste*/, personagem: "Davi"},
	{fala: "Vai meditar ou dormir, filho... você não está raciocinando direito...", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Filho, vai querer café da manhã", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "...", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Filho?... Está bem, então!. Pelo visto não quer conversar...", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Pai... você vai se desculpar?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Filho, não fiz nada de errado, e você saberia disso se me ouvisse de vez em quando.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Então diga, pai, diga o que você quer dizer.", retrato: spr_acucar/*davi raiva*/, personagem: "Davi"},
	{fala: "Davi, tudo que eu fiz foi para nos proteger, tá bom? A prova final disso é que estamos a salvo! E você quer reclamar ainda assim? Tudo bem, eu reconheço que não fui o mais afetuoso com você, mas esse aqui é o meu jeito de demonstrar a minha fé nessa família.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Bem, concordo com você. Eu não entendo sua forma de cuidar de nós, mas acho que vocÊ também não entende a minha. E eu entendo que talvez você não foi o culpado pela morte da mamãe, já que ela mesma não queria ir no médico, já que fazia tudo que vocÊ mandava...", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Agora quer café da manhã?", retrato: spr_acucar/*roger feliz*/, personagem: "Roger"}, {fala: "Pode ser, pai, obrigado.", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"}],
	//15
	[{fala: "Vamos revisar os estoques.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "De novo?", retrato: spr_acucar/*Davi neutro*/, personagem: "Davi"},
	{fala: "Segurança nunca é demais", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Você devia tatuar isso na testa.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Nossa, pai, não tem nada pra comer nessa casa!", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Poxa, pai, estou vivendo hoje só esperando o dia em que poderei comer a torta de maçã da vovó de novo. Essa esperança é a única que me mantém de pé", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"},
	{fala: "Você só pensa em comer também... puxou o lado da família da sua mãe.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Sabe o que eu queria comer agora?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Deixa eu adivinhar: a torta de maçã da vovó.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"},
	{fala: "Dessa vez não! Dessa vez é um copo de coca; tá maluco! Uma coquinha gelada... não tem pra ninguém.", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"}],
	[{fala: "Filho, me lembrei agora do seu primeiro jogo no time de basquete da escola. Você tinha 8 anos! Lembro até hoje da garra com que enfrentou os mais velhos.", retrato: spr_acucar/*roger triste*/, personagem: "Roger"},
	{fala: "Obrigada, pai. Às vezes me esqueço desse seu lado.", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"}],
	//20
	[{fala: "Você acredita em Deus, pai?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Acreditava", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Eu acredito, ainda. Quem fez isso não foi Deus, foram os humanos. Disso tenho certeza. Isso me ajuda a enfrentar tudo de cabeça erguida.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Você fica muito tempo calado, pai. O silêncio desse bunker pesa demais.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Como será que está o céu hoje? Queria poder vez de novo...", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Queria poder assistir um filme de novo; só mais uma vez...", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Pai, aonde você acha que vão os mortos?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Para lugar nenhum. A morte é o fim, ponto.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Com você é tudo preto no branco, né?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	//25
//	[{fala: "Pai, quem você acha que lançou as bombas?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Que sono... como é possível a gente não ter nada para fazer e ainda assim ficar tão cansado. A percepção de tempo muda completamente.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Filho, saiba que sempre que algo acontecer, pode contar comigo. Sou seu pai e te amo.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "A solidão me faz sentir tão depressivo... tenho saudade da escola, mesmo que também passasse o tempo todo sozinho.", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Obrigado por estar aqui, pai. Não sobreviveria 1 dia sem você!", retrato: spr_acucar/*davi feliz*/, personagem: "Davi"}],
	//30
	[{fala: "E as menininha, Davi? Tava interessado em alguma?", retrato: spr_acucar/*roger feliz*/, personagem: "Roger"}, {fala: "Não começa, pai.", retrato: spr_acucar/*davi nervoso*/, personagem: "Davi"}],
	[{fala: "Saudade do mundo... Saudade da vida... Que droga de bunker maldito!", retrato: spr_acucar/*davi nervoso*/, personagem: "Davi"}],
	[{fala: "Bom dia, pai.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Bom dia, filho.", retrato: spr_acucar/*roger feliz*/, personagem: "Roger"}],
	[{fala: "Davi... fica quieto, acho que tem alguma coisa se espreitando aqui dentro...", retrato: spr_acucar/*roger apavorado*/, personagem: "Roger"}, {fala: "!!!", retrato: spr_acucar/*davi apávorado*/, personagem: "Davi"},
	{fala: "AAAAAAHHHH!!!", retrato: spr_acucar/*roger apavorado*/, personagem: "Roger"}, {fala: "UMA BARATA ENORME! MATA ELA, FILHO!", retrato: spr_acucar, personagem: "Roger"}, {fala: "Ah, para, pai, só um insetosinho... eles devem ser mais limpos que nós a esse altura. Deixa que eu resolvo. ", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
//	[{fala: "Você é feliz, pai?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Depende... o que é felicidade para você?", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Para os gregos, felicidade é aquele momento que fale por si mesmo; o instante de vida que você gostaria que durasse mais.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}]
	//35
	[{fala: "Quer ouvir uma piada, pai?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Acho que fica pra próxima, filho.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Você acredita em Deus, pai?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Acreditava", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Eu acredito, ainda. Quem fez isso não foi Deus, foram os humanos. Disso tenho certeza. Isso me ajuda a enfrentar tudo de cabeça erguida.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Música favorita, pai?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "'In the Mood', Glenn Miller... Sua mãe e eu dançávamos essa direto na nossa época.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Poxa, pai... É como diz o outro: os tempos bons só são assim reconhecidos depois que passamos por eles...", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Bom dia, Davi! Como tem passado? Sei que estamos o tempo todo juntos aqui, mas raramente temos uma conversa mais profunda.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Sendo bem sincero, pai... me sinto mais deprimido agora que durante toda minha vida. Quando a mamãe morreu... pensei que o mundo tinha acabado; mas agora, olha que irônico: ele realmente acabou! HAHAHAHAHAHAHH!!", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	//40
	[{fala: "Você fica muito tempo calado, pai. O silêncio desse bunker pesa demais.", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{fala: "Como será que está o céu hoje? Queria poder vez de novo...", retrato: spr_acucar/*davi triste*/, personagem: "Davi"}],
	[{fala: "Queria poder assistir um filme de novo; só mais uma vez...", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}],
	[{fala: "Pai, aonde você acha que vão os mortos?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}, {fala: "Para lugar nenhum. A morte é o fim, ponto.", retrato: spr_acucar/*roger neutro*/, personagem: "Roger"}, {fala: "Com você é tudo preto no branco, né?", retrato: spr_acucar/*davi neutro*/, personagem: "Davi"}],
	[{ fala: "Hoje você acordou cedo.", retrato: spr_acucar, personagem: "Roger"}, {fala: "Já disse isso: é tão silencioso que incomoda!", retrato: spr_acucar, personagem: "Davi"}],
	//45
	[{fala: "Pai, se eu morrer antes de você...", retrato: spr_acucar, personagem: "Davi"}, {fala: "Não fala isso...", retrato: spr_acucar, personagem: "Roger"}, {fala: "... você me queimaria ou enterraria?", retrato: spr_acucar, personagem: "Davi"}, {fala: "Não quero pensar nisso, filho... mas acho mais correto enterrar do lado de fora. Lá no quintal, onde você brincava quando criança.", retrato: spr_acucar, personagem: "Roger"}],
	[{fala: "Pai, olha, você deveria começar a meditar, que nem eu!", retrato: spr_acucar, personagem: "Davi"}, {fala: "Não preciso dessas coisas...", retrato: spr_acucar, personagem: "Roger"}, {fala: "Mas tenta! Olha que me ajuda bastante!", retrato: spr_acucar, personagem: "Davi"}],
	//[{fala: "Pai, fala um cheiro bom.", retrato: spr_acucar, personagem: "Davi"},]
	[{fala: "Eu queria muito aprender a tocar violão... ", retrato: spr_acucar, personagem: "Davi"}, {fala: "E eu queria visitar a América do Sul... lá tem paixagens muito bonitas... Enfim, a gente não pode ter tudo, né?", retrato: spr_acucar, personagem: "Roger"}],
	[{fala: "Hoje faz 50 dias... parece uma vida!", retrato: spr_acucar, personagem: "Roger"}],
	//50
	[{fala: "Nunca vi o mar... Você já viu, pai?", retrato: spr_acucar, personagem: "Davi"}, {fala: "Já... e é lindo, acredite!", retrato: spr_acucar, personagem: "Roger"}],
	[{fala: "Temos que limpar melhor isso aqui. A ventilação já está entupindo de novo.", retrato: spr_acucar, personagem: "Roger"}, {fala: "Mas limpamos não tem nem 1 semana!", retrato: spr_acucar, personagem: "Davi"},{fala: "Uma semana foi a uma semana atrás, hoje é hoje.", retrato: spr_acucar, personagem: "Roger"}, {fala: "Mais uma para as palavras de sabedoria.", retrato: spr_acucar, personagem: "Davi"}],
	[{fala: "Pai... perdi.", retrato: spr_acucar, personagem: "Davi"}, {fala: "Perdeu o quê?", retrato: spr_acucar, personagem: "Roger"}, {fala: "Perdi. (O JOGO)", retrato: spr_acucar, personagem: "Davi"}],
	[{fala: "Vamos lá: um pensamento por outro. Eu começo. Estou pensando que deveria ter trazido uma cadeira mais confortável... essa cama já está com o formato da minha bunda.", retrato: spr_acucar, personagem: "Roger"}, {fala: "", retrato: spr_acucar, personagem: "Davi"},]
	
]
mostrar = false
aux = false
fala_dia = 0
char_index = 0
current_text = ""
type_speed = 0.06
fala_atual = 0