/*
    아직 입양을 못 간 동물 중,
    가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요.
    이때 결과는 보호 시작일 순으로 조회해야 합니다.
*/
select     
    aa.NAME, 
    aa.DATETIME
from(
    select 
        a.NAME, 
        a.DATETIME,
        row_number() over(order by a.DATETIME asc) as rn
    from ANIMAL_INS a
    left join ANIMAL_OUTS b on a.ANIMAL_ID = b.ANIMAL_ID
    where 1=1 
    and b.ANIMAL_ID is null

) aa
where aa.rn <= 3
;