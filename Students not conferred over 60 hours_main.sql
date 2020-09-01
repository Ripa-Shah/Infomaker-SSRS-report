 SELECT name_master.id_num,   
         name_master.first_name,   
         name_master.last_name,   
         address_master.phone_private,   
         address_master.phone,   
         address_master.addr_line_1,   
         address_master.addr_line_2,   
         address_master.city,   
         address_master.state,   
         address_master.zip  
    FROM address_master,   
         name_master  
   WHERE ( name_master.id_num = address_master.id_num ) and  
         ( ( name_master.id_num in (  SELECT degree_history.id_num  
                                        FROM degree_history  
                                       WHERE degree_history.dte_degr_conferred is NULL  )) AND  
         ( address_master.addr_cde = '*LHP' ) AND  
         ( name_master.id_num in (  SELECT student_crs_hist.id_num  
                                      FROM student_crs_hist  
                                  GROUP BY student_crs_hist.id_num  
                                    HAVING ( sum(hrs_earned) >= 60 )  )) )    
