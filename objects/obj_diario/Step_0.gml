/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if keyboard_check_pressed(vk_escape) {
	if clicou {
		clicou = false
		global.tem_tela_aberta = false
	}
}
draw_set_font(fnt_kiwisoda)
// draw_gui event
var txt_voltar = "voltar";
var tx_voltar = 1920 / 2 - 450;
var ty_voltar = 1080 / 2 + 350;

var txt_primeira = "primeira página"
var tx_primeira = 1920 / 2 - 300
var ty_primeira = 1080 / 2 + 350

var txt_avancar = "avançar"
var tx_avancar = 1920 / 2 + 400
var ty_avancar = 1080 / 2 + 350

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    if (mx > tx_voltar && mx < tx_voltar + string_width(txt_voltar) &&
        my > ty_voltar && my < ty_voltar + string_height(txt_voltar)) and pagina > 0 {
        pagina--
    } else if (mx > tx_avancar && mx < tx_avancar + string_width(txt_avancar) &&
        my > ty_avancar && my < ty_avancar + string_height(txt_avancar)) and pagina < paginas.numero{
		pagina++
	} else if (mx > tx_primeira && mx < tx_primeira + string_width(txt_primeira) &&
        my > ty_primeira && my < ty_primeira + string_height(txt_primeira)) and pagina > 0 {
		pagina = 0
	}
}

switch dia {
	case 1:
		ds_list_replace(paginas_escritas, 0, obj_personagem.atributos)
		ds_list_replace(paginas_escritas, 1, paginas.dia1)
		break
	case 2:
		ds_list_replace(paginas_escritas, 2, paginas.dia2)
		break
	case 3:
		ds_list_replace(paginas_escritas, 3, paginas.dia3)
		break
	case 4:
		ds_list_replace(paginas_escritas, 4, paginas.dia4)
		break
	case 5:
		ds_list_replace(paginas_escritas, 5, paginas.dia5)
		break
	case 6:
		ds_list_replace(paginas_escritas, 6, paginas.dia6)
		break
	case 7:
		ds_list_replace(paginas_escritas, 7, paginas.dia7)
		break
	case 8:
		ds_list_replace(paginas_escritas, 8, paginas.dia8)
		break
	case 9:
		ds_list_replace(paginas_escritas, 9, paginas.dia9)
		break
	case 10:
		ds_list_replace(paginas_escritas, 10, paginas.dia10)
		break
	case 11:
		ds_list_replace(paginas_escritas, 11, paginas.dia11)
		break
	case 12:
		ds_list_replace(paginas_escritas, 12, paginas.dia12)
		break
}