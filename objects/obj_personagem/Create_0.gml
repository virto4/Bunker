/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
/*
sem amuletos; armas fazem o papel deles: aumentando a força e outros atrivutos
atributos são: força (regula o dano causado), resistência (regula o dano sofrida), fortuna (regula os drops),
sagacidade (regula a chance dde crítico ou de errar o golpe)
humor: extasiado (+força +resistencia -sagaz + fortuna), 
	deprimido (- força - fortuna + resisteia +sagaz)
	apavorado (+ forca + sagaz - todos), 
	colérico (+ força +fortuna - sagaz - resistencia)
outra coisa: CORES DOS DIÁLOGOS
personagens ou inimigos: azul (16637F)
itens: amarelo (B29711)
atrivbutos e humores: roxo (7F1434)

coisas para melhorar sanidade:
-conversa com davi=+5
-brincar com meredith=+5
-jogar cartas ou domino=+10
-vencer batalhas=+10
-ouvir radio=+5
*/
if room == rm_bunker {
	audio_stop_sound(snd_floresta)
}

doencas = {
	Gripe: [true, "Passa naturalmente em 4 dias ou imediatamente com aspirina."],
	Enxaqueca: [true, "Curada com aspirina."],
	Leptospirose: [true, "Curada com antibióticos."],
	Escorbuto: [true, "Curada com vitamina C (repolho tem muita vitamina C)."],
	Disenteria: [true, "Curada com antibiótico."],
}

vermelho = false
escrita = ""
instrucoes_fala = {
	Eventos: "Todo dia, alguma coisa nova acontece no Bunker. Esses acontecimentos são escritos no diário marrom no canto inferior esquerdo da sala. Virando as páginas do livro, você encontra instruções sobre o que fazer. Os eventos podem ser: reparos estruturais (problemas com a ventilação, infiltrações...), doenças (gripes, fraturas; resolvidas com remédios), inimigos (aparecem sempre an escada, que é a entrada do Bunker, e querem te matar ou saquear) e gerais (exploração do mapa, comerciantes...)",
	Atributos: "Saúde: piora em batalhas ou doenças; curada por habilidades na batalha ou remédios no Bunker. Sanidade: piora a cada dia e deve ser reposta com alguma das seguintes atividades: ouvir rádio, conversar com Davi, conversar com a gata, jogar cartas ou dominó ou vencer batalhas. Ela piora mais se Meredith ou Davi não estiverem no Bunker. Fome: você deve comer periodicamente. As comidas podem ser ingeridas sozinhas (algumas delas) ou devem ser cozinhadas, e, para isso, você deve adquirir a receita ao assistir o programa de rádio sobre cozinha; Sede: a sede não diminui no começo. Somente quando houver o evento dos canos que enferrujam é que você terá de repor os níveis de água dos personagens. Esses são os atributos principais. Há também os secundários: Força (dano causado), Reistência (limitação ao dano sofrido), Sagacidade (chance de crítico ou erro) e Fortuna (definição dos loots da batalha), que são utilizados na batalhas e podem ser alterados pelo Humor.",
	Dia_a_dia: "A cada dia que passa, você precisa realizar o seguinte ritual: abrir o diário para conferir os atributos na primeira página, e, em seguida, ver os eventos do dia e os que ainda não foram concluidos. Depois, resolva os eventos pendentes e controle os níveis dos atributos principais (Sede, Fome, Sanidade e Saúde) dos personagens para não morrer.",
	Batalhas: "Numa batalha, você precisa decidir uma arma e uma habilidade para cada jogador. A arma auxilia o dano que será causado, sendo a seguinte a ordem de eficiência das armas: 1 - metralhadora; 2 - pistola; 3 - machado; 4 - picareta. 5 - punhos. Já as habilidades podem servir para: dar um ataque, podendo ser simples ou causar dano extra; se curar; alterar seu humor. As habilidades são desevolvidas ao assistir o programa de rádio sobre sobrevivência.",
	Humores: "Extasiado: +força +resistência -sagacidade +fortuna); Deprimido: -força +resistência +sagacidade -fortuna; Apavorado: +força -resistência +sagacidade -fortuna; Colérico: +força - resistência -sagacidade +fortuna"
}

instrucoes = false
y_alimentou2 = 0
sao = false
sao_aux = false
aumento_sanidade = 0

morte_davi = false
msg_davi = ""
etapa2_morte = false
alpha_morte = 0
aux1 = false
aux2 = false
tempo_over = 0
pode_comecarb = true
pode_comecarc = true
tempo_over2 = 0
tempo_over3 = 0
cor_botao = c_white

alpha_logo = 0
voltar_menu = false
indice_atual = 0
tempo_final = 0
type_speed = 0.06
current_text = ""
char_index = 0
ganhou_jogo = false
dias_bunker = 100
final_secreto = false
aux_final = true
escureceu_final = false
alpha_final = 0
scale_final = 0
pode_comecar_falas = false

falas_final = [
	"Durante a noite, funcionários do governo localizaram o Bunker e resgataram você.",
	"Em seguida, levaram você a um novo Bunker, porém um muito maior e melhor preparado para sobreviver ao evento.",
	"Lá, você conseguiu reestruturar sua vida na nova e caótica sociedade que se formou no ambiente. O restante de sua vida foi tranquilo e consistiu numa tentativa de superar a experiência grotesca da vida no seu bunker anterior."
]

falas_secreto = [
	"Quando derrotou os Homens de Preto, você coletou deles um item secreto. Hoje, você decidiu seguir as pistas deixadas por ele e partiu em uma jornada da qual nunca retornaria.",
	"Passaram-se horas de incessante caminhada até o local. Por fim, se tratava de um lugar abandonado e caótico, repleto de aparatos tecnológicos e caros. Tudo aparentava ser de caráter oficial e estava marcado com logos e emblemas do Governo dos EUA.",
	"Passeando pelas dependências do local, você encontra uma sala distante e acima das outras, nitidamente destacada por ser de maior importância. Você vai até ela e se depara com a porta escancarada devido ao desgaste dos materiais.",
	"A sala estava uma bagunça; parecia saqueada e tomada por vândalos e pelo tempo. Mesmo assim, o conteúdo dela era muito interessante.",
	"Arquivos, pastas, planos para algum evento importante. Em suma, a informação que os papéis confirmavam era insana: ",
	"Os EUA haviam planejado o ataque da bomba que causou a reação em cadeia e destruiu a atmosfera; eles planejaram e executaram isso; construíram Bunkers pelo país todo para poderem salvar seu povo e bancar os bonzinhos.",
	"De repente, passos ecoam pelo corredor. Mas você não os ouve. Está imerso nas informações descobertas e não repara quando figuras decentemente trajadas e nada amistosas olham pela porta, sacam armas e disparam, sem nem exitar.",
	"Você morre. Morre por ter descoberto a verdade. Morre, assim como todos que esse governo matou em nome da 'democracia', sempre favorecendo quem sempre foi favorito e exterminando seus opositores em práticas eugenistas.",
	"Você é somente mais um. Ninguém se lembrará de você e de sua família. Tudo foi em vão. Agora, só nos resta esquecer dessa história. Ou seremos os próximos."
]

falas_utilizadas = falas_final

global.tem_tela_aberta = false
tirar_jogo = false
jogo_scale = 0
tirar = false
valor_agua = 30 //quanta sede recupera 1 garrafa de agua
beber_agua = false
bebeu_agua = false
aumento_sede = 0
tutorial_scale = 0
tut_alpha = 1
tut_saindo = false

pode_tocar = false
auxua = false
pode_jogar = true //variavel para saber se o jogador pode jogar cacheta ou domino; o codiugo esta no obj coletavel,
//mas ele nao pode executar o create pois é um objeto que não está instanciaod no ambiemte

primeiro = false
segundo = false

timer = current_time / 1000 + 0.8

game_over = false
msg_game_over = ""
alpha_over = 0
inicio = false
tempo_over = 0
aux1 = true
bbb = false
tempo_over2 = 0
aux2 = true
tempo_over3 = 0
cor_botao = c_white

passagem_dia = false
alpha_dia = 0
escureceu = false
animacao_dia = false
time = false
time2 = 0
time3 = 0
clareou = false
aaa = false
mudou_data = false

scale_direita = 0
tirar_direita = false

humores = ["NEUTRO", "EXTASIADO", "COLÉRICO", "DEPRIMIDO", "APAVORADO"]

atributos = {
	saude: 100,
	fome: 100,
	sede: 100,
	sanidade: 100,
	humor: humores[0],
	sagacidade: 30,
	forca: 30,
	resistencia: 30,
	fortuna: 30,
}

forca_padrao = atributos.forca
fortuna_padrao = atributos.fortuna
resistencia_padrao = atributos.resistencia
sagacidade_padrao = atributos.sagacidade

mudou_humor = false

d = 1

itens_iguais = ds_list_create()

mudar_bunker = 0
alpha2 = 0
if room == rm_bunker {
	pode_comecar = true
	mudar_bunker = true
	alpha2 = 1
} else if room == rm_casa {
	mudar_bunker = false
	alpha2 = 0
	pode_comecar = false
}

desenhar = false
desenhar2 = false
segunda_vez = false
px = 0
py = 0
item_segurado = 0
item_selecionado = noone

tempo = false
tempo2 = 0
aux_item = 0

velh				= 0
velv				= 0
vel					= 300
vel_diagonal		= 212
apertou_pulo		= false
posicao_pre_pulo	= 0
colidiu_porta_aux	= false
slot_selecionado	= 5
slot1=noone
slot2=noone
slot3=noone
slot4=noone
slot5=noone
slot1_novo = false
slot2_novo = false
slot3_novo = false
slot4_novo = false
slot5_novo = false
slot1_n = 0
slot2_n = 0
slot3_n = 0
slot4_n = 0
slot5_n = 0
numero_n = 1

global.tem_tela_aberta = false

itens_nao_consumiveis = [obj_radio, obj_machado, obj_metralhadora, obj_pistola,
						obj_picareta, obj_tv, obj_domino, obj_contador_geiger, obj_baralho,
						obj_inseticida, obj_ferramentas, obj_espanador, obj_meredith, obj_davi, 
						obj_mapa, obj_traje_davi, obj_traje_roger]
is_consumivel = true //variavel auxiliar para obj_coletavel
obj_anterior = noone //auxilia na geracao do sprite azulxznho
item_devolvido = false //o obj coletavel estpa por baixo deste aqui. ao clicar para devolver, ele entende que quero pegar outro também. Para saber se o clique é para pegar ou devolver, vemos essa variavel

//isso aqui é para o obj_coletavel, que, como não tem instancia dele na room, não é executado o create
slots_disponiveis = false
tempo_slot = false

alpha = 1
mudar_volume = false
volume_x = 960
clicou_volume = false
mudar_fov = false
fov_x = 960
clicou_fov = false
view_width_base = camera_get_view_width(view_camera[0]);
view_height_base = camera_get_view_height(view_camera[0]);

qtde_itens1 = {
	"obj_mapa": 0,
	"obj_traje_davi": 0,
	"obj_traje_roger": 0,
    "obj_acucar": 0,
    "obj_agua": 0,
    "obj_alface": 0,
    "obj_arroz": 0,
    "obj_batata": 0,
    "obj_cerveja": 0,
    "obj_chocolate": 0,
    "obj_farinha": 0,
    "obj_frango": 0,
    "obj_ovo": 0,
    "obj_repolho": 0,
    "obj_machado": 0,
    "obj_metralhadora": 0,
    "obj_municao": 0,
    "obj_picareta": 0,
    "obj_pistola": 0,
    "obj_analgesico": 0,
    "obj_ansiolitico": 0,
    "obj_antibiotico": 0,
    "obj_aspirina": 0,
    "obj_curativo": 0,
    "obj_baralho": 0,
    "obj_contador_geiger": 0,
    "obj_domino": 0,
    "obj_saco_lixo": 0,
    "obj_tv": 0,
	"obj_radio": 0,
	"obj_pilha": 0,
	"obj_inseticida": 0,
	"obj_ferramentas": 0,
	"obj_arroz_frango": 0, 
	"obj_bolo_chocolate": 0,
	"obj_bolo_quatro_quartos": 0, 
	"obj_chucrute": 0,
	"obj_escondidinho": 0,
	"obj_ovo_mexido": 0,
	"obj_salada": 0,
	"obj_cookie": 0,
	"obj_agua_sanitaria": 0,
	"obj_espanador": 0,
	"obj_meredith": 0,
	"obj_davi": 0
}

habilidades = [
	["Sniper", "Armas de fogo dão mais dano."],//0
	["Ferramenteiro", "Obtém mais eficiência em armas brancas."],//1
	["Golpe da morte", "Dá 2 ataques pelo preço de um"],//2
	["Estoicismo", "Remove suas emoções."],//3
	["Pensamentos intrusivos", "Fica deprimido."],//4
	["Pensamentos intrusivos 2", "Fica coolérico."],//5
	["Curandeiro aprendiz", "Cura 1/3 de toda a saúde do personagem"],//6
	["Curandeiro mestre", "Cura toda a saúde de um personagem"],//7
	["Parque de diversões", "Fica extasiado"],//8
	["Concentração", "Resistência e força são melhoradas um pouco."],//9
	["Ataque", "Um ataque padrão. Nada de mais"],//10
]

habilidades_adquiridas =[habilidades[3], habilidades[4], habilidades[5], habilidades[8], habilidades[6], habilidades[9], habilidades[10]]

inputs = {
	esquerda	: ord("A"),
	direita		: ord("D"),
	cima		: ord("W"),
	baixo		: ord("S"),
	pulo		: vk_space,
}

opcoes = false

armas_pegas = []

tutorial_ask = false
tutorial = false
coleta = false
informacao = false
rolar_hotbar = false
porta = false
deposito = false
geladeira = false
tut_mensagem = ""

direita_coletavel = false
objeto = noone

if room_get_name(room) == "rm_casa" {
	tempo_decorrido = 0
	tempo_espera = 0
	tempo_escrito = tempo_espera - tempo_decorrido
	tutorial_ask = true
	global.tem_tela_aberta = true
} else if room_get_name(room) == "rm_bunker" and ds_list_size(global.itens_pegos) > 0 {
	for (i = 0; i < ds_list_size(global.itens_pegos); i++) {
		switch (ds_list_find_value(global.itens_pegos, i)) {
			case obj_espanador:
				mudar_fase("obj_espanador", obj_espanador)
				break
			case obj_davi:
				mudar_fase("obj_davi", obj_davi)
				break
			case obj_municao:
				mudar_fase("obj_municao", obj_municao);
				break
			case obj_cerveja:
				mudar_fase("obj_cerveja", obj_cerveja)
				obj_freezer.quantidades[8][1] += 1
				break
			case obj_agua:
				mudar_fase("obj_agua", obj_agua)
				obj_freezer.quantidades[1][1] += 1
				break
			case obj_radio:
				mudar_fase("obj_radio", obj_radio);
				break;
			case obj_pilha:
				mudar_fase("obj_pilha", obj_pilha);
				break;
			case obj_acucar:
				mudar_fase("obj_acucar", obj_acucar);
				obj_freezer.quantidades[0][1] += 1
				break;
			case obj_alface:
				mudar_fase("obj_alface", obj_alface);
				obj_freezer.quantidades[2][1] += 1
				break;
			case obj_arroz:
				mudar_fase("obj_arroz", obj_arroz);
				obj_freezer.quantidades[3][1] += 1
				break;
			case obj_batata:
				mudar_fase("obj_batata", obj_batata);
				obj_freezer.quantidades[5][1] += 1
				break;
			case obj_chocolate:
				mudar_fase("obj_chocolate", obj_chocolate);
				obj_freezer.quantidades[9][1] += 1
				break;
			case obj_farinha:
				mudar_fase("obj_farinha", obj_farinha);
				obj_freezer.quantidades[13][1] += 1
				break;
			case obj_frango:
				mudar_fase("obj_frango", obj_frango);
				obj_freezer.quantidades[14][1] += 1
				break;
			case obj_ovo:
				mudar_fase("obj_ovo", obj_ovo);
				obj_freezer.quantidades[15][1] += 1
				break;
			case obj_repolho:
				mudar_fase("obj_repolho", obj_repolho);
				obj_freezer.quantidades[17][1] += 1
				break;
			case obj_machado:
				array_push(armas_pegas, obj_machado)
				mudar_fase("obj_machado", obj_machado);
				break;
			case obj_metralhadora:
				array_push(armas_pegas, obj_metralhadora)
				mudar_fase("obj_metralhadora", obj_metralhadora);
				break;
			case obj_picareta:
				array_push(armas_pegas, obj_picareta)
				mudar_fase("obj_picareta", obj_picareta);
				break;
			case obj_pistola:
				array_push(armas_pegas, obj_pistola)
				mudar_fase("obj_pistola", obj_pistola);
				break;
			case obj_analgesico:
				mudar_fase("obj_analgesico", obj_analgesico);
				break;
			case obj_ansiolitico:
				mudar_fase("obj_ansiolitico", obj_ansiolitico);
				break;
			case obj_antibiotico:
				mudar_fase("obj_antibiotico", obj_antibiotico);
				break;
			case obj_aspirina:
				mudar_fase("obj_aspirina", obj_aspirina);
				break;
			case obj_curativo:
				mudar_fase("obj_curativo", obj_curativo);
				break;
			case obj_baralho:
				mudar_fase("obj_baralho", obj_baralho);
				break;
			case obj_contador_geiger:
				mudar_fase("obj_contador_geiger", obj_contador_geiger);
				break;
			case obj_domino:
				mudar_fase("obj_domino", obj_domino);
				break;
			case obj_saco_lixo:
				mudar_fase("obj_saco_lixo", obj_saco_lixo);
				break;
			case obj_tv:
				mudar_fase("obj_tv", obj_tv);
				break;
			case obj_inseticida:
				mudar_fase("obj_inseticida", obj_inseticida);
				break;
			case obj_ferramentas:
				mudar_fase("obj_ferramentas", obj_ferramentas);
				break;
			case obj_agua_sanitaria:
			mudar_fase("obj_agua_sanitaria", obj_agua_sanitaria)
				break
			case obj_meredith:
				mudar_fase("obj_meredith", obj_meredith)
				break
			case obj_traje_davi:
				mudar_fase("obj_traje_davi", obj_traje_davi)
				break
			case obj_traje_roger:
				mudar_fase("obj_traje_roger", obj_traje_roger)
				break
			case obj_mapa:
				mudar_fase("obj_mapa", obj_mapa)
				break
		}
	}

	function mudar_fase(nome_obj, index_obj) {
		var is_alimento = false
		for (var i = 0; i < array_length(global.alimentos); i++) {
			if index_obj = global.alimentos[i] {
				is_alimento = true
				break
			}
		}
		if is_alimento {
			variable_struct_set(qtde_itens1, nome_obj, variable_struct_get(qtde_itens1, nome_obj) + 1)
		} else {
			if variable_struct_get(qtde_itens1, nome_obj) == 0 { //pega o valor de tde_itens chamado obj
				var pos = variable_struct_get(global.posicoes, nome_obj)
				var ax = variable_struct_get(pos, "x")
				var ay = variable_struct_get(pos, "y")
				inst = instance_create_layer(ax, ay, layer_get_id("Instances"), index_obj, {})
				variable_struct_set(qtde_itens1, nome_obj, variable_struct_get(qtde_itens1, nome_obj) + 1)
			} else { //se pegou mais de uma municao, no obj_municao estara dizendo quantas ela tem
				//variable_instance_set(obj, "qtde_itens", variable_instance_get(obj, "qtde_itens") + 1)
				variable_instance_set(instance_find(index_obj, 0), "qtde_itens", variable_instance_get(instance_find(index_obj, 0), "qtde_itens") + 1)
				variable_struct_set(qtde_itens1, nome_obj, variable_struct_get(qtde_itens1, nome_obj) + 1)
			}
		}
	}
}

if room == rm_bunker {
	if instance_exists(obj_davi) {
		obj_davi.interagir = true
	}
	if instance_exists(obj_meredith) {
		obj_meredith.interagir = true
	}
}

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


function casa(slot, slot_novo, slot_n) {
	if !audio_is_playing(snd_menu_out) {
		audio_play_sound(snd_menu_out, 1, false)
	}
	if slot != noone {
		var is_consumivel = false
		for (var i = 0; i < array_length(itens_nao_consumiveis); i++) {
			if slot == itens_nao_consumiveis[i] {
				is_consumivel = true
				break
			}
		}
		var is_alimento = false;
		for (var i = 0; i < array_length(global.alimentos); i++) {
			if slot == global.alimentos[i] {
				is_alimento = true
				break
			}
		}
		var is_ferramenta = false
		for (var i = 0; i < array_length(global.ferramentas); i++) {
			if slot == global.ferramentas[i] {
				is_ferramenta = true
				break
			}
		}
		if is_consumivel { //se NAO for consumivel, aqui eu me confundi na nomenclatura da variavel
			if room == rm_bunker {
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == slot {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), slot, {})
						break
					}
				}
			} else {
				for (var i = 0; i < array_length(global.casa); i++) {
					if asset_get_index(global.casa[i][0]) == slot {
						var ax = global.casa[i][1]
						var ay = global.casa[i][2]
						px = ax
						py = ay
						instance_create_layer(ax, ay, layer_get_id("Instances"), slot, {})
					}
				}
			}
			if !desenhar {
				desenhar = true
				item_segurado = slot
			}
		} else {
			if is_alimento and room == rm_bunker {
				for (var i = 0; i < array_length(obj_freezer.quantidades); i++) {
					if obj_freezer.quantidades[i][0] = slot {
						obj_freezer.quantidades[i][1] += 1
						break
					}
				}
			} else if is_ferramenta and room == rm_bunker {
				if item_selecionado == obj_martelo {
					obj_ferramentas.martelo = false
					obj_ferramentas.martelo_cor = c_white
				} else if item_selecionado == obj_fita_isolante {
					obj_ferramentas.fita = false
					obj_ferramentas.fita_cor = c_white
				} else if item_selecionado == obj_chave_fenda {
					obj_ferramentas.chave = false
					obj_ferramentas.chave_cor = c_white
				} else {
					obj_ferramentas.argamassa = false
					obj_ferramentas.argamassa_cor = c_white
				}
			} else if !instance_exists(slot) and room == rm_bunker {
				var posicoes = variable_struct_get_names(global.posicoes)
				for (var i = 0; i < array_length(posicoes); i++) {
					if asset_get_index(posicoes[i]) == slot {
						var struct = variable_struct_get(global.posicoes, posicoes[i])
						var ax = variable_struct_get(struct, "x")
						var ay = variable_struct_get(struct, "y")
						instance_create_layer(ax, ay, layer_get_id("Instances"), slot, {})
						break
					}
				}
			} else if room == rm_bunker {
				slot.qtde_itens++
			}
			if !is_alimento and !is_ferramenta {
				if !desenhar2 {
					desenhar2 = true
				}
				item_segurado = slot
			}
		}
		if slot1_n == slot_n {
			slot1 = noone
			slot1_novo = false
		} 
		if slot2_n == slot_n {
			slot2 = noone
			slot2_novo = false
		} 
		if slot3_n == slot_n {
			slot3 = noone
			slot3_novo = false
		} 
		if slot4_n == slot_n {
			slot4 = noone
			slot4_novo = false
		} 
		if slot5_n == slot_n {
			slot5 = noone
			slot5_novo = false
		}
	}
}