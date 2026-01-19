select NAME, count(*) as count from ANIMAL_INS
where NAME is not null
group by NAME
having count(*) >= 2
order by NAME asc;