/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_diario.dia < 30 {
	switch evento_hoje {
		case "baratas":
			if !instanciou_baratas {
				evento_baratas.b1 = instance_create_layer(553, 590, "Instances", obj_baratas, {})
				evento_baratas.b2 = instance_create_layer(680, 560, "Instances", obj_baratas, {})
				evento_baratas.b3 = instance_create_layer(681, 322, "Instances", obj_baratas, {})
				evento_baratas.b4 = instance_create_layer(914, 359, "Instances", obj_baratas, {})
				evento_baratas.b5 = instance_create_layer(1144, 345, "Instances", obj_baratas, {})
				instanciou_baratas = true
				dia_baratas = obj_diario.dia
				obj_personagem.atributos.sanidade -= 10
			}
			if obj_diario.dia != dia_baratas and !dia_baratas_aux  and morreu_inseticida < 5{
				instanciou_baratas = false
				dia_baratas_aux = true
			}
			break
		case "canos":
			break
		case "rachaduras":
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