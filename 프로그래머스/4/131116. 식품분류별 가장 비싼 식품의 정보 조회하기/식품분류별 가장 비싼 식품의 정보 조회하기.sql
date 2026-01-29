/*
    FOOD_PRODUCT 테이블에서 식품분류별로 가격이 제일 비싼 식품의
    분류, 가격, 이름을 조회하는 SQL문을 작성해주세요.
    이때 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜 주시고
    결과는 식품 가격을 기준으로 내림차순 정렬해주세요.
*/

SELECT CATEGORY, MAX_PRICE, PRODUCT_NAME FROM (
    SELECT 
        CATEGORY,
        PRICE AS MAX_PRICE,
        PRODUCT_NAME,
        ROW_NUMBER() OVER(PARTITION BY category ORDER BY PRICE DESC) rn
    FROM FOOD_PRODUCT
    WHERE category IN ('과자', '국', '김치', '식용유')
    ORDER BY PRICE DESC
) WHERE rn = 1
;