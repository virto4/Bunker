/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false
clicou_esc = false
dia = 1
pagina = 0
pagina_direita = 0
pagina_esquerda = 0
ultima_pag = 0
paginas_datas = ds_list_create()
dia2 = 16
mes = 7

image_index = 0
image_speed = 0

paginas = {
	numero: 120,
	atributos: "Meus atributos: ",
	atributos2: "Atributos de Davi: ",
	gripe: "Hoje amanheci meio gripado. Meus pulmões não são mais como antigamente... Se tiver uma aspirina aí vai ajudar.",
	enxaqueca: "Minha cabeça dói. Estou com uma enxaqueca das brabas. Preciso de aspirina.",
	baratas: "A casa está cheia de insetos nojentos! Preciso de inseticida, senão eles não vão embora. Posso até tentar matá-los com pisadas, mas eles se reproduzem antes e voltam mais fortes! Só a dedetização resolve.",
	canos: "A água está contaminada com radiação; Se continuarmos tomando dela vamos morrer cedo. De agora em diante, temos que tomar água de outras fontes.",
	coleta: "Hoje, se tivermos trajes contra a radiação e o mapa, podemos sair para coletar itens fora do Bunker. Isso pode ser arriscado, mas podemos conseguir itens importantes.",
	mala: "Apareceu esta mala na frente do bunker... será que abro? A mala está do lado de fora, basta ir até a escada.",
	capivara: "Tem alguém na porta... ",
	barata: "Tem alguém na porta...",
	leptospirose: "Tem ratos aqui no bunker; eles vem e vão pelas ventilações e ficam fazendo ruídos irrtantes de noite. Acho que eles me deixaram doente hoje: peguei leptospirose e mu sitno horrível. Preciso de antibióticos.",
	freddie: "Tem alguém na porta...",
	doenca_gata: "Meredith está doente. Não sei o que fazer. Será que dou algum remédio para ela? Pode ser uma boa ideia.",
	rachaduras: "Durante a noite parte do concreto cedeu... Devo concertar antes que a radiação entre. Para isso, preciso da caixa de ferramentas.",
	infiltracao: "Hoje de madrugada os canos romperam e vazaram água no piso. Tenho que abrir e concertar isso. Preciso da caixa de ferramentas.",
	cardume: "Tem alguém na porta...",
	saque: "Tem alguém na porta...",
	emma: "Tem alguém na porta...",
	comerciante: "Apareceu um homem na porta... Ele diz que está vendendo coisas, vai ver tem algo que presta.",
	disenteria: "Minha barriga está doendo tanto... preciso de antibióticos para não morrer desnutrido dessa diarreia.",
	escorbuto: "Estou me sentindo tão mal... acho que é falta de vitamina C; preciso urgentemente repor esses nutrientes! Já sei o que fazer: chucrute; uma salada de repolho vai resolver isso.",
	ventilacao: "Os dutos de ventilação estão muito sujos. Meu nariz está pedindo socorro. Preciso do espanador e da caixa de ferramentas.",
	mib: "Tem alguém na porta...",
	delinquentes: "Tem alguém na porta...",
	cogumelos: "Cresceram uns fungos estranhos aqui nas paredes do bunker... Acho que posso prová-los para ver o que acontece.",
}

tarefas = ds_list_create()
paginas_escritas = ds_list_create()
for(var i = 0; i <= paginas.numero; i++) {
	ds_list_add(paginas_escritas, "")
}

ds_list_add(paginas_datas, "")
ds_list_add(paginas_datas, "")
for (var i = 0; i < paginas.numero; i++) {
	ds_list_add(paginas_datas, string(dia2) + "/" + string(mes))
	dia2++
	if mes == 7 or mes == 8 or mes == 10 or mes == 12 {
		if dia2 > 31 {
			dia2 = 1
			mes++
		}
	} else {
		if dia2 > 30 {
			dia2 = 1
			mes++
		}
	}
}