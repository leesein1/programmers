-- 코드를 입력하세요
SELECT
    ANIMAL_ID,	
    NAME,
    to_char(datetime,'YYYY-MM-DD') 날짜
from ANIMAL_INS
order by ANIMAL_ID ;