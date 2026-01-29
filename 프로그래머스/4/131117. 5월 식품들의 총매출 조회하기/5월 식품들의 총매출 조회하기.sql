/*
    FOOD_PRODUCT와 FOOD_ORDER 테이블에서 생산일자가 2022년 5월인 식품들의
    식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요.
    이때 결과는 총매출을 기준으로 내림차순 정렬해주시고
    총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.
*/

SELECT
aa.product_id,
bb.product_name,
( price * cnt ) AS TOTAL_SALES
FROM (
    SELECT a.product_id, SUM(a.amount) cnt FROM FOOD_ORDER a
    WHERE TO_CHAR(a.produce_date,'YYYY-MM') = '2022-05'
    GROUP BY a.product_id
) aa
JOIN FOOD_PRODUCT bb ON aa.product_id = bb.product_id
ORDER BY TOTAL_SALES DESC, product_id;

