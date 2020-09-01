select s.ID_NUM, rtrim(n.l) last_Name, rtrim(coalesce(nullif(n.preferred_Name,''),
n.first_Name)) first_Name
, ft.YR_CDE as FirstYear, ft.TRM_CDE as FirstTerm
, ft.DIV_CDE, coalesce(d.MAJOR_1,'') Major_1, coalesce(m.MAJOR_MINOR_DESC,'')
MAJOR_MINOR_DESC
,coalesce(a.ADDR_LINE_1,'') email, coalesce(d.ACTIVE,'N') ActiveDegree
, coalesce( convert( varchar(12),d.dte_degr_conferred, 100 ), '') 'dte_degree_conferred'
from student_master s --all students
CROSS APPLY (
select TOP 1 *
FROM STUD_TERM_SUM_DIV d
WHERE d.ID_NUM=s.ID_NUM and d.yr_cde <> '0000' 
--'0000' is part of how we code transfer work
ORDER BY yr_cde, trm_cde
) ft --first term they attended
left join degree_history d on d.id_num = s.id_Num and d.div_cde = ft.DIV_CDE 
--degree(s) that match the first term
and d.DEGR_CDE NOT LIKE 'A%' 
-- 'A%' degree codes are associates degrees, which are mixed
--into the same division code :/
--A student who transfers away and meets the assoc reqs have a bachelors changed to an
--associates and the associates conferred
--or they may have a separate row. Either way, in terms of conferred bachelors, they
--didn't finish with us and I don't want this record here
inner join STUDENT_DIV_MAST sd on sd.id_num = s.id_num and sd.DIV_CDE = ft.DIV_CDE and
sd.FIRST_TIME_POST_SECONDARY = 'Y' 
--limit to FTIACs
inner join name_master n on n.id_Num = s.id_num
left outer join MAJOR_MINOR_DEF m on d.MAJOR_1=m.MAJOR_CDE
left outer join ADDRESS_MASTER a on a.ID_NUM=d.ID_NUM and a.ADDR_CDE = '*EML'
where ft.YR_CDE='2013' --look 4 years back
and ft.TRM_CDE='10' --1 is our fall term
and ft.DIV_CDE='UG'