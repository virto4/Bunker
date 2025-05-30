/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if keyboard_check_pressed(vk_escape) {
	if clicou {
		clicou_esc = true
		clicou = false
	} else if clicou_esc {
		clicou = true
		clicou_esc = false
	}
}
draw_set_font(fnt_descricoes)
// draw_gui event
var txt_voltar = "voltar";
var tx_voltar = 1920 / 2 - 450;
var ty_voltar = 1080 / 2 + 350;

var txt_primeira = "primeira página"
var tx_primeira = 1920 / 2 - 300
var ty_primeira = 1080 / 2 + 350

var txt_avancar = "avançar"
var tx_avancar = 1920 / 2 + 420
var ty_avancar = 1080 / 2 + 350

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    if (mx > tx_voltar && mx < tx_voltar + string_width(txt_voltar) &&
        my > ty_voltar && my < ty_voltar + string_height(txt_voltar)) and pagina > 0 {
        pagina--
    } else if (mx > tx_avancar && mx < tx_avancar + string_width(txt_avancar) &&
        my > ty_avancar && my < ty_avancar + string_height(txt_avancar)) and pagina < dia - 1 {
		pagina++
	} else if (mx > tx_primeira && mx < tx_primeira + string_width(txt_primeira) &&
        my > ty_primeira && my < ty_primeira + string_height(txt_primeira)) and pagina > 0 {
		pagina = 0
	}
}

switch dia {
	case 1:
		ds_list_add(paginas_escritas, obj_personagem.atributos)
		ds_list_add(paginas_escritas, paginas.dia1)
		paginas.numero += 2
		break
	case 2:
		ds_list_add(paginas_escritas, paginas.dia2)
		paginas.numero++
		break
	case 3:
		ds_list_add(paginas_escritas, paginas.dia3)
		paginas.numero++
		break
	case 4:
		ds_list_add(paginas_escritas, paginas.dia4)
		paginas.numero++
		break
	case 5:
		ds_list_add(paginas_escritas, paginas.dia5)
		paginas.numero++
		break
	case 6:
		ds_list_add(paginas_escritas, paginas.dia6)
		paginas.numero++
		break
	case 7:
		ds_list_add(paginas_escritas, paginas.dia7)
		paginas.numero++
		break
	case 8:
		ds_list_add(paginas_escritas, paginas.dia8)
		paginas.numero++
		break
	case 9:
		ds_list_add(paginas_escritas, paginas.dia9)
		paginas.numero++
		break
	case 10:
		ds_list_add(paginas_escritas, paginas.dia10)
		paginas.numero++
		break
	case 11:
		ds_list_add(paginas_escritas, paginas.dia11)
		paginas.numero++
		break
	case 12:
		ds_list_add(paginas_escritas, paginas.dia12)
		paginas.numero++
		break
}