//função para realizar a quebra de linha corretamente
function scr_set_defaults_for_text() {
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	//variaveis para cada letra/caractere
	for (var c = 0; c < 500; c++)
	{
		col_1[c, page_number] = c_white;
		col_2[c, page_number] = c_white;
		col_3[c, page_number] = c_white;
		col_4[c, page_number] = c_white;
		
		float_text[c, page_number] = 0;
		float_dir[c, page_number] = c*20;
		
		shake_text[c, page_number] = 0;
		shake_dir[c, page_number] = irandom(360);
		shake_timer[c, page_number] = irandom(4);
	}
	
	//função para definir o icone do personagem quando se interage com alguém
	txtb_spr[page_number] = spr_textbox;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	snd[page_number] = voz_player_single_v2;
}

//-------------------VFX dos textos-------------------\\
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_text_color(_start, _end, _col1, _col2, _col3, _col4){

	for (var c = _start; c  <= _end; c++)
	{
	col_1[c, page_number-1] = _col1;
	col_2[c, page_number-1] = _col2;
	col_3[c, page_number-1] = _col3;
	col_4[c, page_number-1] = _col4;	
	}
	
}

/// @param 1st_char
/// @param last_char

function scr_text_float(_start,_end){
	
	for (var c = _start; c <= _end; c++)
	{
	float_text[c,page_number-1] = true;	
	}
	
}

/// @param 1st_char
/// @param last_char

function scr_text_shake(_start,_end){
	
	for (var c = _start; c <= _end; c++)
	{
	shake_text[c,page_number-1] = true;	
	}
	
}

/// @parametro texto
/// @parametro [carinhas]
function scr_text(_text){
	
	scr_set_defaults_for_text();
	
	text[page_number] = _text;
	
	//da informação ao icone 
	if argument_count > 1 {
	   switch(argument[1])
	   {
          //player		  
		  case "player":
		   speaker_sprite[page_number] = sRetratoPlayer;
		   txtb_spr[page_number] = spr_textbox_bardin;
		   snd[page_number] = voz_player_single_v2;
		   break;
		   
		   //lenny
		   case "lenny":
		   speaker_sprite[page_number] = spr_lenny_spk;
		   txtb_spr[page_number] = spr_textbox_black;
		   speaker_side[page_number] = -1;
		   break;
		   
		    //Roccy
		   case "roccy":
		   speaker_sprite[page_number] = spr_roccy_spk;
		   txtb_spr[page_number] = spr_textbox_pink;
		   speaker_side[page_number] = -1;
		   break;
		   
		   //roupa
		   case "roupa":
		   txtb_spr[page_number] = spr_textbox_black_red;
		   break;
		   
		   //bob
		   case "bob":
		   speaker_sprite[page_number] = sRetratoBob;
		   txtb_spr[page_number] = spr_textbox;
		   speaker_side[page_number] = -1;
		   snd[page_number] = Retro_Single_v4_wav;
		   break;
		   
		   case "galen":
		   speaker_sprite[page_number] = spr_devota_talk;
		   txtb_spr[page_number] = spr_textbox_purple;
		   speaker_side[page_number] = -1;
		   break;
		   
		   case "zolin":
		   speaker_sprite[page_number] = spr_zolin_talk;
		   txtb_spr[page_number] = spr_textbox_gray;
		   speaker_side[page_number] = -1;
		   break;
		  
		   //narrador
		   case "narrador":
		   txtb_spr[page_number] = spr_textbox_black;
		   break;
		   
		   case "athos":
		   txtb_spr[page_number] = spr_textbox_yellow;
		   break;
		   
		    case "athos2":
		   txtb_spr[page_number] = spr_textbox_gray;
		   break;
		   
		    case "turtle":
		   txtb_spr[page_number] = spr_textbox_blue;
		   break;
		   
		   
	   }
	}
	
	//lado do personagem está ligado
	if argument_count > 2 {
		speaker_side[page_number] = argument[2];
	}
	
	page_number++;

}

///@parametro opções
///@parametro link_id
function scr_option(_option, _link_id) {
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
	
}


/// @parametro text_id
function create_textbox(_text_id) {
	
	
with (instance_create_depth(0, 0, -9999, obj_textbox))
	 {
	  scr_game_text(_text_id);
	 } 

}