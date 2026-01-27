/*
    CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 
    2022년 10월 16일에 대여 중인 자동차인 경우 '대여중' 이라고 표시하고,
    대여 중이지 않은 자동차인 경우 '대여 가능'을 표시하는 컬럼
    (컬럼명: AVAILABILITY)을 추가하여 
    자동차 ID와 AVAILABILITY 리스트를 출력하는 SQL문을 작성해주세요.
    이때 반납 날짜가 2022년 10월 16일인 경우에도 '대여중'으로 표시해주시고
    결과는 자동차 ID를 기준으로 내림차순 정렬해주세요.
    
    즉, 10월 16일 기준으로 빌려줄 수 있는지 없는지를 판단하는 문제
    
    1. 각 CAR_ID에 대해
    2. 2022-10-16을 포함하는 대여 이력이 하나라도 있는지 확인
    3. 있으면 '대여중', 없으면 '대여 가능'
*/

SELECT
    car_id,
    CASE
        WHEN MAX(
            CASE
                WHEN DATE '2022-10-16'
                     BETWEEN start_date AND end_date
                THEN 1
                ELSE 0
            END
        ) = 1
        THEN '대여중'
        ELSE '대여 가능'
    END AS availability
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY car_id
ORDER BY car_id DESC;

