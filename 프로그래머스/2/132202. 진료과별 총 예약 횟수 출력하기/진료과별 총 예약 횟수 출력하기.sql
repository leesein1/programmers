
/*
    2022년 5월에 예약한 환자 수를 진료과코드 별로 조회하는 SQL
    MCDP_CD = 진료과 번호
    
*/
select 
    a.MCDP_CD "진료과코드",
    count(*) "5월예약건수"
from APPOINTMENT a
where to_char(APNT_YMD,'yyyy-mm') = '2022-05'
group by MCDP_CD
order by "5월예약건수"asc, MCDP_CD asc;