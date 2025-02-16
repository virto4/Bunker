/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _cima, _baixo, _pulo, _esquerda, _direita
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

if place_meeting(x + vel * velh, y + vel * velv, obj_porta_aux) {
	colidiu_porta_aux = true
} else {
	colidiu_porta_aux = false
}

if !apertou_pulo {
	velv = _baixo - _cima
	velh = _direita - _esquerda
	
	if velh != 0 and velv != 0 {
		if place_meeting(x + velh * vel_diagonal, y + velv * vel_diagonal, objetos_colidiveis) {
			move_and_collide(velh * vel_diagonal * 0.6, velv * vel_diagonal * 0.6, objetos_colidiveis)
		} else {
			move_and_collide(velh * vel_diagonal, velv * vel_diagonal, objetos_colidiveis)
		}
	} else {
		move_and_collide(velh * vel, velv * vel, objetos_colidiveis)
	}

} else {
	var _gravidade = 0.5
	velv += _gravidade
	y += velv
	if posicao_pre_pulo == y {
		apertou_pulo = false
	}
}