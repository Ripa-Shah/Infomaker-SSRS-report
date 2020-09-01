 SELECT DISTINCT items.letter_cde,   
         items.letter_style,   
         items.id_number,   
         name_format_suffix_view.last_suf_first_middle,   
         document_def.letter_type,   
         document_def.doc_desc,   
         items.action_code,   
         action.action_description,   
         new_merge_id_file.error_txt,   
         candidate.cur_yr,   
         candidate.cur_trm,   
         items.ITEM_DATE
    FROM items LEFT OUTER JOIN action ON items.action_code = action.action_code,   
         new_merge_id_file,   
         name_format_suffix_view,   
         document_def,   
         candidate  
   WHERE ( new_merge_id_file.id_num = items.id_number ) and  
         ( new_merge_id_file.group_number = items.group_number ) and  
         ( new_merge_id_file.subgroup_number = items.subgroup_number ) and  
         ( new_merge_id_file.group_sequence = items.group_sequence ) and  
         ( new_merge_id_file.id_num = name_format_suffix_view.id_num ) and  
         ( new_merge_id_file.letter_cde = document_def.letter_cde ) and  
         --( ( items.ITEM_DATE = getdate() ) AND  
         ( candidate.CUR_YR = '2016') AND  
         ( candidate.CUR_TRM = '30'
		  ) --)   
ORDER BY new_merge_id_file.error_txt ASC   
