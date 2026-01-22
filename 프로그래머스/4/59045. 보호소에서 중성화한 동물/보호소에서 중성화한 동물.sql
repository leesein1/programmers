/*
    보호소에서 중성화 수술을 거친 동물 정보를 알아보려 합니다. 
    보호소에 들어올 당시에는 중성화되지 않았지만, 
    보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종,
    이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성해주세요
    
    SEX_UPON_OUTCOME in ('Spayed Female', 'Neutered Male')
    

*/

select 
    a.ANIMAL_ID	,
    a.ANIMAL_TYPE,
    a.NAME
from ANIMAL_INS a
join ANIMAL_OUTS b on a.ANIMAL_ID = b.ANIMAL_ID
where 1=1
and a.SEX_UPON_INTAKE not in ('Spayed Female', 'Neutered Male') -- 들어올때는 X 
and b.SEX_UPON_OUTCOME in ('Spayed Female', 'Neutered Male') -- 나갈때는 O
order by ANIMAL_ID ;