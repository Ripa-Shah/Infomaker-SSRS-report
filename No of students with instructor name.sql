SELECT 
   sm.yr_cde, 
   sm.trm_cde, 
   ss.room_cde, 
   ss.bldg_cde, 
   ss.loc_cde, 
   ss.crs_cde, 
   sm.short_crs_title_1, 
   ss.monday_cde, 
   ss.tuesday_cde, 
   ss.wednesday_cde, 
   ss.thursday_cde, 
   ss.friday_cde, 
   ss.saturday_cde, 
   ss.sunday_cde, 
   ss.begin_tim, 
   ss.end_tim, 
   ss.days_tim_ovrid, 
   ss.begin_dte, 
   ss.end_dte, 
   ss.comment_txt, 
   ss.seq_num_2,
   ss.CRS_COMP1,
   ss.CRS_COMP2,
   ss.CRS_COMP3,
   ss.CRS_COMP6,
   ss.COMMENT_TXT,
   sm.LEAD_INSTRUCTR_ID, 
   nm.FIRST_NAME+' '+
   nm.LAST_NAME as 'Instructor Name',
   sm.x_listed_parnt_crs,
   (
      SELECT count(*)
      FROM STUDENT_CRS_HIST sch
      WHERE sch.YR_CDE = ss.YR_CDE
         AND sch.TRM_CDE = ss.TRM_CDE
         AND sch.CRS_CDE = ss.CRS_CDE
   ) AS [No of student]

FROM section_master_v AS sm
   INNER JOIN SECTION_SCHEDULES_V AS ss ON ss.yr_cde = sm.yr_cde AND ss.trm_cde = sm.trm_cde AND ss.crs_cde = sm.crs_cde

   LEFt outer JOIN NAME_MASTER as nm on nm.ID_NUM=sm.LEAD_INSTRUCTR_ID and ss.TRM_CDE='20' and ss.YR_CDE='2016' and ss.COMMENT_TXT is not null;
  