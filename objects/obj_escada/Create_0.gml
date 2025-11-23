/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
retrato_davi = spr_davi_down
retrato_roger = spr_roger_neutro
davi_subimage = 0
roger_subimage = 0
inimigo_subimage = 0
morte_subimage = 0
tempo_subimage = current_time * 1000 + 1

vida_davi_original = 0
vida_roger_original = 0
balas_pistola_original = 0
balas_metra_original = 0
municoes_original = 0
davi_morreu_definitivo = false


correr = false

curativo_roger = false
curativo_davi = false
mes = 0
vermelho = false
escrita = ""
instrucoes = false
etapa_instrucoes = false
alpha_instrucoes = 0
morte_davi = false
morte_roger = false
alpha_morte = 0
etapa1_morte = false
etapa2_morte = false
morte_davi_aux = true
tempo_morte = 0
cor_botao = c_white
tempo_over = false
tempo_over2 = false
tempo_over3 = false
aux1 = false
pode_comecar = true
pode_comecar2 = true
scale = 0
etapa2 = false
question = false
venceu = false

draw_set_font(fnt_dialogos)
largura_sim = string_width("Sim")
altura_sim = string_height("Sim")
largura_nao = string_width("Não")
altura_nao = string_height("Não")
sim = [[290, 930], [310 + largura_sim, 950 + altura_sim]]
nao = [[1610, 930], [1630 + largura_nao, 950 + altura_nao]]
mouse_aux1 = false
mouse_aux2 = false
escureceu = false
escureceu_aux = false
escureceu2 = false
escureceu3 = false

musica = -1
musicas = [
	snd_fantaisie_impromptu,
	snd_moonlight_sonata_third,
	snd_vivaldi_summer,
	snd_fantaisie_impromptu,
	snd_moonlight_sonata_third,
	snd_vivaldi_summer,
	snd_fantaisie_impromptu,
	snd_moonlight_sonata_third,
	snd_vivaldi_summer,
	snd_fantaisie_impromptu,
	snd_moonlight_sonata_third,
	snd_vivaldi_summer,
	snd_fantaisie_impromptu,
	snd_moonlight_sonata_third,
	snd_vivaldi_summer,
]

tocar = false
i_selecionado = 0
i_selecionado_novo = 0
aaa = false
bbb = false
i_selecionadob = 0
i_selecionado_novob = 0

clicou = false
nome_inimigo = "inimigo"
cor_atacar = #990A0E
cor_correr = #B2760B
cor_circulo1 = #2E7F0E
cor_circulo2 = #2E7F0E
selecionar_arma_roger = false
selecionar_arma_davi = false
selecionar_hab_roger = false
selecionar_hab_davi = false
arma_roger = noone
arma_davi = noone
arma_x_davi = 1
arma_x_roger = 1
cor_hab  = #43717F
cor_hab_1 = #43717F
hab_roger = false
hab_davi = false
cor_unidade = #43717F
habilidade_roger = ""
habilidade_davi = ""
mensagem = false
codigo = ""
tempo = 0
tempo_turno = 0
batalha = false
sua_vez = 0
executar = false
ataque_inimigo = false
_y = 0
alpha = 0
golpe_duplo = false
mensagem_turno = true
aux = false
tempo_aux = 0
derrotou = false
cor_circulo = #2E7F0E

seguir = false
loots = []
final = false

golpe_morte_tempo1 = false
golpe_morte_numero1 = 1
mestre_tempo1 = false
mestre_numero1 = 1

golpe_morte_tempo2 = false
golpe_morte_numero2 = 1
mestre_tempo2 = false
mestre_numero2 = 1
contagem = false

critico2 = false
errou2 = false
receptor = noone


obj = noone
dano = 0

x_inimigo = 960
y_inimigo = 540
largura_inimigo = 246

x_roger = 172
y_roger = 894
largura_roger = 246

x_davi = 1742
y_davi = 894 
largura_davi = 246

inimigo = {
	nome: "inimigo",
	total_vida: 200,
	vida: 200,
	forca: 40,
	resistencia: 30,
	sagacidade: 80,
	fugir: true,
	retrato: noone,
	morte: noone
}

armas = {
	"obj_metralhadora": 90,
	"obj_pistola": 80,
	"obj_machado": 75,
	"obj_picareta": 70,
	"obj_punhos": 50
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

largura_pistola = 0
largura_metra = 0
tiros_pistola = 10
tiros_metra = 8
atirou = false

davi_som = false
roger_som = false
inimigo_som = false

function iniciar_batalha() {
	audio_stop_all()
	musica++
	audio_play_sound(musicas[musica], 1, false)
	clicou = true
	global.tem_tela_aberta = true
	
	seguir = false
	largura_inimigo = (246 * inimigo.vida / inimigo.total_vida < 0) ? 0 : 246 * inimigo.vida / inimigo.total_vida


	largura_roger = (246 * obj_personagem.atributos.saude / 100 < 0) ? 0 : 246 * obj_personagem.atributos.saude / 100
	habilidade_roger = ""
	habilidade_davi = ""
	arma_davi = noone
	arma_roger = noone
	obj_personagem.mudou_humor = true
	obj_personagem.atributos.humor = obj_personagem.humores[0]
	retrato_roger = spr_roger_neutro
	
	if instance_exists(obj_davi) {
		largura_davi = (246 * obj_davi.atributos.saude / 100 < 0 ) ? 0 : 246 * obj_davi.atributos.saude / 100
		obj_davi.mudou_humor = true
		obj_davi.atributos.humor = obj_davi.humores[0]
		retrato_davi = spr_davi_down //mudar !!!!!!
	}
	
	golpe_morte_tempo1 = false
	golpe_morte_numero1 = 1
	mestre_tempo1 = false
	mestre_numero1 = 1

	golpe_morte_tempo2 = false
	golpe_morte_numero2 = 1
	mestre_tempo2 = false
	mestre_numero2 = 1
	contagem = false
	
	critico2 = false
	errou2 = false
	receptor = noone
	
	sua_vez = 0
	batalha = false
}