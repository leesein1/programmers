select ANIMAL_TYPE, count(*) as count from ANIMAL_INS 
where ANIMAL_TYPE in ('Cat','Dog')
group by ANIMAL_TYPE
order by animal_type asc