SELECT 
   section_master.yr_cde, 
   section_master.trm_cde, 
   section_schedules.room_cde, 
   section_schedules.bldg_cde, 
   section_schedules.loc_cde, 
   section_schedules.crs_cde, 
   section_master.short_crs_title_1, 
   section_schedules.monday_cde, 
   section_schedules.tuesday_cde, 
   section_schedules.wednesday_cde, 
   section_schedules.thursday_cde, 
   section_schedules.friday_cde, 
   section_schedules.saturday_cde, 
   section_schedules.sunday_cde, 
   section_schedules.begin_tim, 
   section_schedules.end_tim, 
   section_schedules.days_tim_ovrid, 
   section_schedules.begin_dte, 
   section_schedules.end_dte, 
   section_schedules.comment_txt, 
   section_schedules.seq_num_2, 
   section_master.x_listed_parnt_crs,
   count(*) OVER (PARTITION BY section_schedules.CRS_CDE) AS [No of student]

   --(
   --   SELECT count(*)
   --   FROM STUDENT_CRS_HIST sch
   --   WHERE sch.YR_CDE = section_schedules.YR_CDE
   --      AND sch.TRM_CDE = section_schedules.TRM_CDE
   --      AND sch.CRS_CDE = section_schedules.CRS_CDE
   --) AS [No of student]
FROM section_master ,section_schedules,
STUDENT_CRS_HIST
where section_schedules.yr_cde =  section_master.yr_cde
AND section_schedules.trm_cde =  section_master.trm_cde
AND section_schedules.crs_cde =  section_master.crs_cde
AND SECTION_SCHEDULES.YR_CDE=STUDENT_CRS_HIST.YR_CDE
AND SECTION_SCHEDULES.TRM_CDE=STUDENT_CRS_HIST.TRM_CDE
AND SECTION_SCHEDULES.CRS_CDE=STUDENT_CRS_HIST.CRS_CDE
--and section_master.YR_CDE=2016 
--and section_master.TRM_CDE=10;