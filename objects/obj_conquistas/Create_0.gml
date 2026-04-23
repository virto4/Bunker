/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
ganhou_conquista = false
batalhas = 0
programas_assistidos = 0
conversou = 0
persistent = true
carregar_conquistas()
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

function salvar_conquistas() {
	/*var json_string = json_encode(global.conquistas)
	var file = file_text_open_write("conquistas.sav")
	file_text_write_string(file, json_string)
	file_text_close(file)*/
	// Usando ini files - mais confiável
    ini_open("conquistas.ini")
    
    var names = variable_struct_get_names(global.conquistas)
    for (var i = 0; i < array_length(names); i++) {
        var name = names[i]
        ini_write_real("conquistas", name, global.conquistas[$ name])
    }
    
    ini_close()
}
function carregar_conquistas() {
	/* if file_exists("conquistas.sav") {
        var file = file_text_open_read("conquistas.sav")
        var json_string = file_text_read_string(file)
        file_text_close(file)
        
        // JSON decode automaticamente cria uma struct!
        global.conquistas = json_decode(json_string)
    } else {
        // Primeira execução - salva struct padrão
        salvar_conquistas()
    }*/
	if file_exists("conquistas.ini") {
        ini_open("conquistas.ini")
        
        var names = variable_struct_get_names(global.conquistas)
        for (var i = 0; i < array_length(names); i++) {
            var name = names[i]
            global.conquistas[$ name] = ini_read_real("conquistas", name, 0)
        }
        
        ini_close()
    } else {
        // Primeira vez - cria arquivo
        salvar_conquistas()
    }
}