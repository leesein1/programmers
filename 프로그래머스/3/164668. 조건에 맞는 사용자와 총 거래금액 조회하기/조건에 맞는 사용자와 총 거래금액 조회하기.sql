/*
    USED_GOODS_BOARD와 USED_GOODS_USER 테이블에서
    완료된 중고 거래의 총금액이 70만 원 이상인 사람의 
    회원 ID, 닉네임, 총거래금액을 조회하는 SQL문을 작성해주세요. 
    결과는 총거래금액을 기준으로 오름차순 정렬해주세요.
*/
SELECT b.user_id, b.NICKNAME, aa.total_sales FROM(
    SELECT a.writer_id, sum(price) total_sales FROM USED_GOODS_BOARD a
    WHERE a.status = 'DONE'
    GROUP BY a.writer_id
    HAVING sum(price)>= 700000
) aa
LEFT JOIN USED_GOODS_USER b ON aa.writer_id = b.user_id
ORDER BY aa.total_sales;