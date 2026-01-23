/*
    CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블에서 
    대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 
    총 대여 횟수가 5회 이상인 자동차들에 대해서
    해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 
    출력하는 SQL문을 작성해주세요. 
    결과는 월을 기준으로 오름차순 정렬하고, 월이 같다면 
    자동차 ID를 기준으로 내림차순 정렬해주세요. '
    특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외해주세요.
*/

SELECT  TO_NUMBER(TO_CHAR(START_DATE, 'MM')) AS MONTH
        , CAR_ID
        , COUNT(*) AS RECO
FROM (
    SELECT  H.*
            , COUNT(*) OVER(PARTITION BY CAR_ID) AS TOTAL_CNT
    FROM   CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    WHERE START_DATE >= TO_DATE('2022-08', 'YYYY-MM') 
      AND START_DATE < TO_DATE('2022-11', 'YYYY-MM')
)
WHERE TOTAL_CNT >= 5
GROUP BY TO_CHAR(START_DATE, 'MM'), CAR_ID
HAVING COUNT(*) > 0
ORDER BY MONTH ASC, CAR_ID DESC