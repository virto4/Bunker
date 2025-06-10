/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
clicou = false
clicou_esc = false
dia = 1
pagina = 0
pagina_direita = 0
pagina_esquerda = 0

paginas = {
	numero: 200,
	atributos: "Meus atributos: ",
	dia1: "p1",
	dia2: "ainda estamos aqui p2",
	dia3: "ainda aqui p3",
	dia4: "não morri p4",
	dia5: "aconteceu p5",
	dia6: "ainda estamos aqui p6",
	dia7: "ainda aqui p7",
	dia8: "não morri p8",
	dia9: "aconteceu p9",
	dia10: "ainda estamos aqui p10",
	dia11: "ainda aqui",
	dia12: "não morri"
}

tarefas = ds_list_create()
paginas_escritas = ds_list_create()
for(i = 0; i <= paginas.numero; i++) {
	ds_list_add(paginas_escritas, "")
}