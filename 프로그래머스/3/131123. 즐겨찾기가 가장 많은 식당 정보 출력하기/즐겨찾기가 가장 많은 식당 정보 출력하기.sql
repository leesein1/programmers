/*
    REST_INFO 테이블에서 음식종류별로 즐겨찾기수가 가장 많은 식당의
    음식 종류, ID, 식당 이름, 즐겨찾기수를 조회하는 SQL문을 작성해주세요.
    이때 결과는 음식 종류를 기준으로 내림차순 정렬해주세요.
    
    아 FOOD_TYPE별로 찾아야하는구나
    FOOD_TYPE	,
    REST_ID	,
    REST_NAME	,
    FAVORITES
*/

select         
    aa.FOOD_TYPE,	
    aa.REST_ID,	
    aa.REST_NAME,	
    aa.FAVORITES 
from (
    select
        FOOD_TYPE,	
        REST_ID,	
        REST_NAME,	
        FAVORITES,
        row_number() over (partition by FOOD_TYPE order by FAVORITES desc) rn
    from REST_INFO 
) aa
where aa.rn = 1
order by aa.FOOD_TYPE desc
    
    
