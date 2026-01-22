/*
FOOD_ORDER 테이블에서 2022년 5월 1일을 기준으로
주문 ID, 제품 ID, 출고일자, 출고여부를 조회하는 SQL문을 작성해주세요.
출고여부는 2022년 5월 1일까지 출고완료로
이 후 날짜는 출고 대기로 미정이면 출고미정으로 출력해주시고, 
결과는 주문 ID를 기준으로 오름차순 정렬해주세요.
*/

select 
    a.ORDER_ID,
    a.PRODUCT_ID,
    to_char(a.OUT_DATE, 'YYYY-MM-DD') OUT_DATE,
    case
        when a.OUT_DATE < to_date('2022-05-02','YYYY-MM-DD') then '출고완료'
        when a.OUT_DATE > to_date('2022-05-02','YYYY-MM-DD') then '출고대기'
        when a.OUT_DATE is null then '출고미정'
    end 출고여부
from FOOD_ORDER a
order by a.ORDER_ID;