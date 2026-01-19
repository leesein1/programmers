select 
    MEMBER_ID	,
    MEMBER_NAME,	
    GENDER,
    to_char(date_of_birth,'YYYY-MM-DD') DATE_OF_BIRTH
from MEMBER_PROFILE
where 1=1
and gender = 'W'
and tlno is not null
and to_char(date_of_birth,'YYYY-MM-DD') like '%-03-%'
order by MEMBER_ID asc;