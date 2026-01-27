/*
    CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 
    2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' 이라고 표시하고,
    대여 중이지 않은 자동차인 경우 '대여 가능'을 표시하는 컬럼
    (컬럼명: AVAILABILITY)을 추가하여 
    자동차 ID와 AVAILABILITY 리스트를 출력하는 SQL문을 작성해주세요.
    이때 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시해주시고
    결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.
    
    지금 문제가 2022-10-16일이 start_date 혹은 between에 들어가는게 있는 car_id를 찾음
    
    차량을 1대씩만 뽑아놓고(DISTINCT)
    그 차가 2022-10-16에 빌려져 있었던 기록이 하나라도 있으면(EXISTS)
    ‘대여중’, 아니면 ‘대여 가능’으로 표시한다.
*/

SELECT
    c.car_id,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
            WHERE h.car_id = c.car_id
              AND DATE '2022-10-16' BETWEEN h.start_date AND h.end_date
        )
        THEN '대여중'
        ELSE '대여 가능'
    END AS availability
FROM (SELECT DISTINCT car_id FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY) c
ORDER BY c.car_id DESC;

