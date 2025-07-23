/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_diario.dia < 30 {
	switch evento_hoje {
		case "baratas":
			evento_baratas = true
			break
		case "canos":
			break
		case "rachaduras":
			evento_rachaduras =  true
			break
		case "infiltracao":
			break
		case "termostato":
			break
		case "chuva acida":
			break
		case "ventilacao":
			break
		case "mofo":
			break
		case "radiacao":
			break
	}
} 
if evento_baratas {
	if !instanciou_baratas {
		instance_create_layer(553, 590, "Instances", obj_baratas, {})
		instance_create_layer(680, 560, "Instances", obj_baratas, {})
		instance_create_layer(681, 322, "Instances", obj_baratas, {})
		instance_create_layer(914, 359, "Instances", obj_baratas, {})
		instance_create_layer(1144, 345, "Instances", obj_baratas, {})
		instanciou_baratas = true
		dia_baratas = obj_diario.dia
		obj_personagem.atributos.sanidade -= 10
	}
	if obj_diario.dia != dia_baratas and !dia_baratas_aux  and morreu_inseticida < 5 {
		instanciou_baratas = false
		dia_baratas_aux = true
		evento_baratas = false
	}
}

if evento_rachaduras {
	if !instanciou_rachaduras {
		var posicoes = embaralhar([[518, 524], [1073, 342], [1155, 390], [311, 347]])
		var instanciar = irandom_range(1, array_length(posicoes))
		for (var i = 0; i < instanciar; i++) {
			instance_create_layer(posicoes[i][0], posicoes[i][1], "Instances", obj_rachadura, {})
		}
		instanciou_rachaduras = true
	}
	if !instance_exists(obj_rachadura) {
		evento_rachaduras = false
	}
}