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
		if place_meeting(x + velh * vel_diagonal, y + velv * vel_diagonal, obj_colidivel) {
			move_and_collide(velh * vel_diagonal * 0.6, velv * vel_diagonal * 0.6, obj_colidivel)
		} else {
			move_and_collide(velh * vel_diagonal, velv * vel_diagonal, obj_colidivel)
		}
	} else {
		move_and_collide(velh * vel, velv * vel, obj_colidivel)
	}

} else {
	var _gravidade = 0.5
	velv += _gravidade
	y += velv
	if posicao_pre_pulo == y {
		apertou_pulo = false
	}
}

if !apertou_pulo {
	depth = -y
}
//passando de cena
if room_get_name(room) == "rm_casa" {
	tempo_escrito = tempo_decorrido - current_time
	if tempo_decorrido < current_time {
		room_goto(rm_bunker)
	}
}