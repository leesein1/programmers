SELECT  TO_NUMBER(TO_CHAR(h.start_date,'MM')) AS month,
        h.car_id,
        COUNT(*) AS records
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
WHERE h.start_date >= DATE '2022-08-01'
  AND h.start_date <  DATE '2022-11-01'
  AND h.car_id IN (
      SELECT car_id
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
      WHERE start_date >= DATE '2022-08-01'
        AND start_date <  DATE '2022-11-01'
      GROUP BY car_id
      HAVING COUNT(*) >= 5
  )
GROUP BY TO_CHAR(h.start_date,'MM'), h.car_id
ORDER BY month ASC, h.car_id DESC;
