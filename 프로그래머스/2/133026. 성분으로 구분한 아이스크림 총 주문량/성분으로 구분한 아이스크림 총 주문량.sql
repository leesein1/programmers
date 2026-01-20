select 
b.ingredient_type, 
sum(a.total_order) TOTAL_ORDER
from FIRST_HALF a
join ICECREAM_INFO  b on a.flavor = b.flavor
group by ingredient_type
order by total_order asc;
