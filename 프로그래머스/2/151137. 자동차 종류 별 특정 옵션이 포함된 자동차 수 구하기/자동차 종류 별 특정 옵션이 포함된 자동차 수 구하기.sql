select car_type, count(*) CARS from CAR_RENTAL_COMPANY_CAR
where REGEXP_LIKE(OPTIONS, '통풍시트|가죽시트|열선시트')
group by car_type
order by CAR_TYPE asc;