/*
    천재지변으로 인해 일부 데이터가 유실되었습니다. 
    입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을
    ID순으로 조회하는 SQL문을 작성해주세요.
*/

select a.ANIMAL_ID,a.NAME from ANIMAL_OUTS a 
left join ANIMAL_INS b on a.ANIMAL_ID = b.ANIMAL_ID and a.ANIMAL_TYPE = b.ANIMAL_TYPE
where b.ANIMAL_ID is null
order by a.ANIMAL_ID asc ;
