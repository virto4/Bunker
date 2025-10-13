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

/* davi é um jovem que joga futebol americano, gosta de ler, meditar e é bastante introspectivo. 
durante toda sua vida, teve que lidar com os caprichos do pai, que o proibia de fazer um monte de coisas por conta de suas opiniões bastante controversas;
ele não tem muitos amigos, pois todos o julgam por conta de seu pai maluco.
No entanto, davi é um exemplo de humildade e se destaca em várias habilidades, tanto intelectuais, como emocionais e físicas
ele sofreu de muita ansiedade e depressao na época da morte de sua mãe, que orreu de tifo no início da sua adolescência
ele sempre culpou o pai por não ter levado a sério a doença da mãe, pelo menos, não tão a serio quanto todas suas outras paranoias.
agora, davi já está recuperado de sua depressão, pois aprendeu a focar em coisas que realmente importam e construiu diversos habitos saudaveis para enfrentar a dor da perda.

retratos: feliz, com raivo, triste, apavorado, neutro

*/
falas = [
	[{fala: "Poxa, pai, que coisa horrível... será que algum dia vamos sair daqui?", retrato: spr_acucar/*davi triste*/}, {fala: "", retrato: spr_acucar/*roger neutro*/}],
	[{fala: "aaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaa", retrato: spr_alface}]
]
mostrar = false
aux = false
fala_dia = 0
char_index = 0
current_text = ""
type_speed = 0.06
fala_atual = 0