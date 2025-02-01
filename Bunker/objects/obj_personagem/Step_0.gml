/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _esquerda, _direita, _cima, _baixo, _pulo

_esquerda = keyboard_check(inputs.esquerda)
_direita = keyboard_check(inputs.direita)
_cima = keyboard_check(inputs.cima)
_baixo = keyboard_check(inputs.baixo)
_pulo = keyboard_check_pressed(inputs.pulo)

if _pulo and !apertou_pulo {
	velv = -7
	posicao_pre_pulo = y
	apertou_pulo = true
}

if !apertou_pulo {
	velh = _direita - _esquerda
	velv = _baixo - _cima
	
	var _colisao = instance_place(x + velh, y, all)
	if _colisao {
		if velh > 0 {
			x = _colisao.bbox_left + (x - bbox_right)
		}
		if velh < 0 {
			x = _colisao.bbox_right + (x - bbox_left)
		}
		velh = 0
	}
	
	_colisao = instance_place(x, y + velv, all)
	if _colisao {
		if velv > 0 {
			y = _colisao.bbox_top + (y - bbox_bottom)
		}
		if velv < 0 {
			y = _colisao.bbox_bottom + (y - bbox_top)
		}
		velv = 0
	}
	
	if velh != 0 and velv != 0 {
		if place_meeting(x, y, all) {
			x += velh * vel_diagonal * 0.5
			y += velv * vel_diagonal * 0.5
		} else {	
			x += velh * vel_diagonal
			y += velv * vel_diagonal
		}
	} else {
		x += velh * vel
		y += velv * vel
	}
} else {
	var _gravidade = 0.5
	velv += _gravidade
	y += velv
	if posicao_pre_pulo == y {
		apertou_pulo = false
	}
}