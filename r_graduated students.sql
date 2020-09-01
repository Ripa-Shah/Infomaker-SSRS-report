select distinct(s.ID_NUM),
coalesce( convert( varchar(12),d.dte_degr_conferred, 100 ), 'blank') 'dte_degree_conferred',
d.MAJOR_1,m.MAJOR_MINOR_DESC,s.YR_CDE,s.TRM_CDE,a.ADDR_LINE_1,d.DIV_CDE
 from DEGREE_HISTORY d
left outer join STUD_TERM_SUM_DIV s
on s.ID_NUM=d.ID_NUM
left outer join MAJOR_MINOR_DEF m
on  d.MAJOR_1=m.MAJOR_CDE
left outer join ADDRESS_MASTER a
on a.ID_NUM=d.ID_NUM
where s.YR_CDE='2016'
and s.TRM_CDE='20'
and a.ADDR_CDE='*LHP'
and d.DIV_CDE='UG'
and d.MAJOR_1<>'NOND';

--select * from ADDRESS_MASTER;