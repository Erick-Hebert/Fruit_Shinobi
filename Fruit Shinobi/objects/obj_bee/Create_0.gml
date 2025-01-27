/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

pos = 1;

// Inherit the parent event
event_inherited();

sprites = [spr_bee_idle, spr_bee_idle, spr_bee_dmg, spr_bee_attack]

state_run = function() {
	check_img(1);	
	switch (pos) {		
		case 1:
			if (x != x_start or y != y_start + 100) {
				hspd = 2;
				vspd = 2;
			}
		break;		
	}	
}

state = state_run;