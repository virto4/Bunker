/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _porta = instance_nearest(x, y, obj_porta);
if _porta != noone {
	if _porta.is_aberta == false {
	    _porta.sprite_index = spr_porta_aberta;
		_porta.is_aberta = true
	} else {
		
	    _porta.sprite_index = spr_porta_fechada;
	}
} 