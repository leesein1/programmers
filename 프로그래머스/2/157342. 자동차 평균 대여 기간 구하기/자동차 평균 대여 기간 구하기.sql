select CAR_ID, to_char(round(avg(DURATION), 1), 'fm9999.0') as AVERAGE_DURATION
from (select CAR_ID, (END_DATE - START_DATE + 1) as DURATION
      from CAR_RENTAL_COMPANY_RENTAL_HISTORY)
group by CAR_ID
having round(avg(DURATION), 1) >= 7
order by round(avg(DURATION), 1) desc, CAR_ID desc;