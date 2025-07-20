/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_diario.dia < 30 {
	switch evento_hoje {
		case "baratas":
			if !instanciou_baratas {
				instance_create_layer(553, 590, "Instances", obj_baratas, {})
				instance_create_layer(680, 560, "Instances", obj_baratas, {})
				instance_create_layer(681, 322, "Instances", obj_baratas, {})
				instance_create_layer(914, 359, "Instances", obj_baratas, {})
				instance_create_layer(1144, 345, "Instances", obj_baratas, {})
				instanciou_baratas = true
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