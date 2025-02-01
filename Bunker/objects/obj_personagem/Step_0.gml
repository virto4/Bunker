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

	if velh != 0 and velv != 0 {    
		if place_meeting(x + velh * vel_diagonal, y + velv * vel_diagonal, all) {
			move_and_collide(velh * vel_diagonal * 0.5, velv * vel_diagonal * 0.5, all)
		} else {
			move_and_collide(velh * vel_diagonal, velv * vel_diagonal, all)			
		}
	} else {
		move_and_collide(velh * vel, velv * vel, all)
	}
} else {
	var _gravidade = 0.5
	velv += _gravidade
	y += velv
	if posicao_pre_pulo == y {
		apertou_pulo = false
	}
}