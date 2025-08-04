/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y

function andar(direcao) {
	switch direcao {
		case "cima":
			y -= 20 * delta_time / 1000000
			sprite_index = spr_meredith_up
			if image_xscale == -1 {
				image_xscale = 1
			}
			break
		case "baixo":
			y += 20 * delta_time / 1000000
			sprite_index = spr_meredith_down
			if image_xscale == -1 {
				image_xscale = 1
			}
			break
		case "esquerda":
			x -= 20 * delta_time / 1000000
			sprite_index = spr_meredith_right
			image_xscale = -1
			break
		case "direita":
			x += 20 * delta_time / 1000000
			sprite_index = spr_meredith_right
			if image_xscale == -1 {
				image_xscale = 1
			}
			break
	}
}
function lamber() {
	sprite_index = spr_meredith_idle
}

if !global.tem_tela_aberta {
	if current_time / 1000 > tempo {
		image_index += 1 
		tempo = current_time / 1000 + 0.2
	}
	if room == rm_bunker {
		if terminou == 0 {
			lamber()
			if frames == 0 {
				frames = 1
				tempo2 = current_time / 1000 + 10
			}
			if current_time / 1000 >= tempo2 {
				terminou = 1
				frames = 0
			}
		} else if terminou == 1 {
			andar("baixo")
			if frames == 0 {
				ipsilon = y
				frames = 1
			}
			if y >= 70 + ipsilon {
				frames = 0
				terminou = 2
			}
		} else if terminou == 2 {
			andar("esquerda")
			if frames == 0 {
				ipsilon = x
				frames = 1
			}
			if x <= ipsilon - 345 {
				frames = 0
				terminou = 3
			}
		} else if terminou == 3 {
			andar("cima")
			if frames == 0 {
				ipsilon = y
				frames = 1
			}
			if y <= ipsilon - 70 {
				frames = 0
				terminou = 4
			}
		} else if terminou == 4 {
			andar("esquerda")
			if frames == 0 {
				ipsilon = x
				frames = 1
			}
			if x <= ipsilon - 80 {
				frames = 0
				terminou = 5
			}
		} else if terminou == 5 {
			andar("cima")
			if frames == 0 {
				ipsilon = y
				frames = 1
			}
			if y <= ipsilon - 140 {
				frames = 0
				terminou = 7
			}
		} else if terminou == 7 {
			andar("direita")
			if frames == 0 {
				ipsilon = x
				frames = 1
			}
			if x >= 750 + ipsilon {
				frames = 0
				terminou = 8
			}
		} else if terminou == 8 {
			lamber()
			if frames == 0 {
				frames = 1
				tempo2 = current_time / 1000 + 10
			}
			if current_time / 1000 >= tempo2 {
				terminou = 9
				frames = 0
			}
		} else if terminou == 9 {
			andar("baixo")
			if frames == 0 {
				ipsilon = y
				frames = 1
			}
			if y >= 140 + ipsilon {
				frames = 0
				terminou = 10
			}
		} else if terminou == 10 {
			andar("esquerda")
			if frames == 0 {
				ipsilon = x
				frames = 1
			}
			if x <= ipsilon - 325 {
				frames = 0
				terminou = 0
			}
		}
	} else if room == rm_casa {
		if lambendo {
			sprite_index = spr_meredith_idle
			if current_time / 1000 >= tempo2 {
				lambendo = false
				andando = true
				tempo2 = current_time / 1000 + 10
				voltando = !voltando
			}
		} else if andando {
			sprite_index = spr_meredith_down
			if voltando {
				x -= 10 * delta_time / 1000000
			} else {
				x += 10 * delta_time / 1000000
			}
			if current_time / 1000 >= tempo2 {
				lambendo = true
				andando = false
				tempo2 = current_time / 1000 + 5
			}
		}
	}
}