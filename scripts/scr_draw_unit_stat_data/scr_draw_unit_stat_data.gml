// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_unit_stat_data(manage=false){
	var xx=__view_get( e__VW.XView, 0 )+0;
	var yy=__view_get( e__VW.YView, 0 )+0;
	var stat_tool_tips = [];
	var stat_tool_tip_text = "";

	var data_block = {
		x1: xx + 1008,
		y1: yy + 520,
		w: 569,
		h: 303,
	};
	data_block.x2 = data_block.x1 + data_block.w;
	data_block.y2 = data_block.y1 + data_block.h;
	data_block.x_mid = (data_block.x1 + data_block.x2) / 2;
	data_block.y_mid = (data_block.y1 + data_block.y2) / 2;

	var attribute_box = {
		x1: data_block.x1 + 84,
		y1: data_block.y1 + 8,
		w: 32,
		h: 48,
	};
	attribute_box.x2 = attribute_box.x1 + attribute_box.w;
	attribute_box.y2 = attribute_box.y1 + attribute_box.h;
	attribute_box.x_mid = (attribute_box.x1 + attribute_box.x2) / 2;
	attribute_box.y_mid = (attribute_box.y1 + attribute_box.y2) / 2;

	stat_display_list = [
		[string(dexterity),
		"Measure of how quick and nimble unit is as well as their base ability to manipulate and do tasks with their hands.##Influences Ranged Attack",
		#306535,
		spr_dexterity_icon,
		"Dexterity",
		"DEX",
		"dexterity"],	

		[string(strength),
		"How strong a unit. Strong units can wield heavier equipment without penalties and are more deadly in close combat.##Influences Melee Attack#Influences Melee Burden Cap#Influences Ranged Burden Cap",
		#1A3B3B,
		spr_strength_icon,
		"Strength",
		"STR",
		"strength"],

		[string(constitution),
		"Unit's general toughness and resistance to damage.##Influences Health#Influences Damage Resistance",
		#9B403E,
		spr_constitution_icon,
		"Constitution", "CON",
		"constitution"],

		[string(intelligence),
		"Measure of learnt knowledge and specialist skill aptitude.",
		#2F3B6B,
		spr_intelligence_icon,
		"Intelligence", "INT","intelligence"],

		[string(wisdom),
		"Unit's perception and street smarts including certain types of battlefield knowledge.",
		#54540B,
		spr_wisdom_icon,
		"Wisdom", "WIS", "wisdom"],

		[string(piety),
		"Unit's faith in their given religion or general aptitude towards faith.",
		#6A411C,
		spr_faith_icon,
		"Piety", "PTY", "piety"],

		[string(weapon_skill),
		"General skill with close combat weaponry.##Influences Melee Attack#Influences Melee Burden Cap",
		#87753C,
		spr_weapon_skill_icon,
		"Weapon Skill", "WS", "weapon_skill"],

		[string(ballistic_skill),
		"General skill with ballistic and ranged weaponry.##Influences Ranged Attack#Influences Ranged Burden Cap",
		#743D57,
		spr_ballistic_skill_icon,
		"Ballistic Skill",
		"BS", "ballistic_skill"],

		[string(luck),
		"...Luck...",
		#05451E,
		spr_luck_icon,
		"Luck",
		"LCK", "luck"],

		[string(technology),
		"Skill and understanding of technology and various technical thingies.",
		#4F0105,
		spr_technology_icon,
		"Technology",
		"TEC", "technology"],

		[string(charisma),
		"General likeability and ability to interact with people.",
		#3A0339,
		spr_charisma_icon,
		"Charisma",
		"CHA", "charisma"],			    					    					    					    			
	]
	// draw_set_color(c_gray);
	// draw_rectangle(stat_block.x1,stat_block.y1, stat_block.x1 + (36*array_length(stat_display_list)), stat_block.y1+48+8, 0)
	// draw_set_color(c_black);
	// draw_rectangle(stat_block.x1,stat_block.y1, stat_block.x1 + (4*array_length(stat_display_list)), stat_block.y1+48+4, 1)
	var viewing_stat,icon_colour;
	for (i=0; i<array_length(stat_display_list);i++){
		if (point_in_rectangle(mouse_x, mouse_y, attribute_box.x1,attribute_box.y1,attribute_box.x2,attribute_box.y2)){
			viewing_stat=true;
		}else{
			viewing_stat=false;
		}
		if (viewing_stat){
			icon_colour = c_white;
			draw_set_color(stat_display_list[i][2]);
			draw_rectangle(attribute_box.x1,attribute_box.y1,attribute_box.x2,attribute_box.y2, 0);
		}else{
			icon_colour = c_gray;
		}
		//draw_rectangle(stat_square.x1-1,stat_square.y1-1,stat_square.x1+33,stat_square.y1+49, 1);
		draw_set_color(c_gray);
		draw_rectangle(attribute_box.x1,attribute_box.y1,attribute_box.x2,attribute_box.y2, 1);
		draw_sprite_ext(stat_display_list[i][3],0, attribute_box.x1,attribute_box.y1, 0.5, 0.5, 0, icon_colour, 1);
		draw_set_color(#50a076);
		draw_set_halign(fa_center);
		draw_text((attribute_box.x1+attribute_box.x2)/2, attribute_box.y1+32, stat_display_list[i][0])
		draw_set_halign(fa_left);
		if (manage){
			if point_and_click([attribute_box.x1, attribute_box.y1, attribute_box.x2, attribute_box.y1+45]){
				filter_and_sort_company("stat", stat_display_list[i][6]);
				unit_text = false;
			}
		}
		array_push(stat_tool_tips,[attribute_box.x1, attribute_box.y1, attribute_box.x2, attribute_box.y2,stat_display_list[i][1] + $"Click to order by highest {stat_display_list[i][4]}", $"{stat_display_list[i][4]} ({stat_display_list[i][5]})"]);
		attribute_box.x1+=36;
		attribute_box.x2+=36;
	}

	// var data_block.x_mid = stats_block.x1+((attribute_box.x1 - stats_block.x1)/2);
	// var data_block.y_mid = attribute_box.y2+4;

	// draw_set_color(c_gray);
	// draw_rectangle(data_block.x_mid-70,data_block.y_mid, data_block.x_mid+67, data_block.y_mid+70, 0);
	// draw_set_color(c_black);
	// draw_rectangle(data_block.x_mid-66,data_block.y_mid+1, data_block.x_mid-1, data_block.y_mid+65, 1);
	// draw_rectangle(data_block.x_mid-66,data_block.y_mid,data_block.x_mid-1,data_block.y_mid+64, 0);

	// var psy_box = {
	// 	x1: attribute_box.x2-36,
	// 	y1: attribute_box.y1,
	// 	w: attribute_box.w,
	// 	h: attribute_box.h,
	// }
	// psy_box.x2 = psy_box.x1 + psy_box.w;
	// psy_box.y2 = psy_box.y1 + psy_box.h;
	// psy_box.x_mid = (psy_box.x1 + psy_box.x2) / 2;
	// psy_box.y_mid = (psy_box.y1 + psy_box.y2) / 2;
	// draw_set_color(c_gray);
	// draw_rectangle(psy_box.x1,psy_box.y1,psy_box.x2,psy_box.y2, 1);
	// draw_set_color(c_white);
	// draw_sprite_stretched(spr_warp_level_icon, 2, psy_box.x1, psy_box.y1, psy_box.w, psy_box.h);
	// draw_set_halign(fa_center);
	// draw_set_valign(fa_middle);
	// draw_text(psy_box.x_mid, psy_box.y_mid+3, $"{psionic}")
	// var assignment_description = "The Imperium measures and records the psionic activity and power level of psychic individuals through a rating system called The Assignment. Comprised of a twenty-four point scale, The Assignment simplifies the comparison of psykers to aid Imperial authorities in recognizing possible threats.";
	// array_push(stat_tool_tips, [psy_box.x1, psy_box.y1, psy_box.x2, psy_box.y2, assignment_description, "The Assignment"]);

	// var forge_box = {
	// 	x1: attribute_box.x2,
	// 	y1: attribute_box.y1,
	// 	w: attribute_box.w,
	// 	h: attribute_box.h,
	// }
	// forge_box.x2 = forge_box.x1 + forge_box.w;
	// forge_box.y2 = forge_box.y1 + forge_box.h;
	// forge_box.x_mid = (forge_box.x1 + forge_box.x2) / 2;
	// forge_box.y_mid = (forge_box.y1 + forge_box.y2) / 2;
	// //draw_rectangle(data_block.x_mid+1,data_block.y_mid+2,data_block.x_mid+1,data_block.y_mid+34, 0);
	// var is_forge = IsSpecialist("forge");
	// if (is_forge){
	// 	draw_set_color(c_gray);
	// 	draw_rectangle(forge_box.x1,forge_box.y1,forge_box.x2,forge_box.y2, 1);
	// 	draw_set_color(c_white);
	// 	draw_sprite_stretched(spr_forge_points_icon, 1, forge_box.x1-6, forge_box.y1-4, forge_box.w+12, forge_box.h+8);
	// 	draw_set_halign(fa_center);
	// 	draw_set_valign(fa_middle);
	// 	draw_text(forge_box.x_mid, forge_box.y_mid, $"{forge_point_generation()[0]}");
	// 	var forge_description = "";
	// 	array_push(stat_tool_tips, [forge_box.x1,forge_box.y1,forge_box.x2,forge_box.y2, $"{forge_point_generation()}", "Craftsmanship"]);
	// }

	//var warp_box_size = tooltip_draw(stat_square.x1,stat_square.y1+56,$"Warp Level:{psionic}");
	//draw_set_color(c_red);
	//if (IsSpecialist("forge")){
	//	tooltip_draw(stat_square.x1,stat_square.y1+45+warp_box_size[1],$"Forge Points:{forge_point_generation()}");
	//}
	// draw_line(stat_block.x1, yy+519, stat_block.x1, yy+957);	
	// draw_line(stat_square.x1, yy+519, stat_square.x1, yy+957);

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(#50a076);

		if (!obj_controller.view_squad && obj_controller.managing >0 && obj_controller.unit_text){
			var unit_data_string = unit_profile_text();
			tooltip_draw(unit_data_string, 925, [xx+23,yy+141],,,,,true);
		}

		var data_lines = [];
		var data_entry = {};
		data_entry.text = $"Loyalty: {loyalty}\n";
		data_entry.tooltip = "This is a description for Loyalty";
		array_push(data_lines, data_entry);
		
		data_entry = {};
		data_entry.text = $"Corruption: {corruption}\n";
		data_entry.tooltip = "This is a description for Corruption";
		array_push(data_lines, data_entry);
		
		data_entry = {};
		data_entry.text = $"Assignment: {global.phy_levels[psionic]} ({psionic})\n";
		data_entry.tooltip = "The Imperium measures and records the psionic activity and power level of psychic individuals through a rating system called The Assignment. Comprised of a twenty-four point scale, The Assignment simplifies the comparison of psykers to aid Imperial authorities in recognizing possible threats.";
		array_push(data_lines, data_entry);
		
		var is_forge = IsSpecialist("forge");
		if (is_forge){
			data_entry = {};
			data_entry.text = $"Forge Production: {forge_point_generation()[0]}\n";
			data_entry.tooltip = "This is a description for Forge Production";
			array_push(data_lines, data_entry);
		}
		
		for (var i = 0; i < array_length(data_lines); i++) {
			draw_text(data_block.x1+16, attribute_box.y2+16+(i*24), data_lines[i].text); // Adjust the y-coordinate for the new line
			array_push(stat_tool_tips, [data_block.x1+16, attribute_box.y2+16+(i*24), data_block.x1+16+string_width(data_lines[i].text), attribute_box.y2+16+(i*24)+string_height(data_lines[i].text), data_lines[i].tooltip, ""]);
		}

		var traits_text = "";
		if array_length(traits) != 0{
			for (i=0;i<array_length(traits);i++){
				traits_text += global.trait_list[$ traits[i]].display_name;
				traits_text +="\n";
			}
		}
		else{
			traits_text = "No Traits\n"
		}
		draw_set_halign(fa_right);
		draw_text(data_block.x2-16, attribute_box.y2+16, traits_text);
		draw_set_halign(fa_left);

		for (i=0;i<array_length(stat_tool_tips);i++){
			if (point_in_rectangle(mouse_x, mouse_y, stat_tool_tips[i][0], stat_tool_tips[i][1], stat_tool_tips[i][2], stat_tool_tips[i][3])){
				tooltip_draw(stat_tool_tips[i][4], 300, [stat_tool_tips[i][0], stat_tool_tips[i][3]],,,stat_tool_tips[i][5]);
			}
		}
}