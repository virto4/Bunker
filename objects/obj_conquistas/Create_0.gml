/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
ganhou_conquista = false

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