/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if room_get_name(room) == "rm_casa" {
	draw_set_font(fnt_principal)
	draw_text(room_width / 2, 60, tempo_escrito div 1000)//div é o comando para divisap inteira
}

draw_sprite_ext(spr_hotbar, 0, 960, 1020, 3, 3, 0, c_white, 1)

var _slotx1=768
var _slotx2=864
var _slotx3=960
var _slotx4=1056
var _slotx5=1152

switch (slot_selecionado) {
	case 1:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx1, 1020, 3, 3, 0, c_white, 1)	
		break
	case 2:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx2, 1020, 3, 3, 0, c_white, 1)
		break
	case 3:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx3, 1020, 3, 3, 0, c_white, 1)
		break
	case 4:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx4, 1020, 3, 3, 0, c_white, 1)
		break
	case 5:
		draw_sprite_ext(spr_slot_selecionado, 0, _slotx5, 1020, 3, 3, 0, c_white, 1)
		break
}

if slot1 != noone {
	draw_sprite_ext(object_get_sprite(slot1), 0, _slotx1, 1020, 2, 2, 0, c_white, 1)
}
if slot2 != noone {
	draw_sprite_ext(object_get_sprite(slot2), 0, _slotx2, 1020, 2, 2, 0, c_white, 1)
}
if slot3 != noone {
	draw_sprite_ext(object_get_sprite(slot3), 0, _slotx3, 1020, 2, 2, 0, c_white, 1)
}
if slot4 != noone {
	draw_sprite_ext(object_get_sprite(slot4), 0, _slotx4, 1020, 2, 2, 0, c_white, 1)	
}
if slot5 != noone {
	draw_sprite_ext(object_get_sprite(slot5), 0, _slotx5, 1020, 2, 2, 0, c_white, 1)	
}