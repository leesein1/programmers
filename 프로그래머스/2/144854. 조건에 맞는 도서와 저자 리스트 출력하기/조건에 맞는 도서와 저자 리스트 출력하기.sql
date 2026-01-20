/*

*/
select
    a.BOOK_ID,
    b.AUTHOR_NAME,
    to_char(a.PUBLISHED_DATE,'YYYY-MM-DD') PUBLISHED_DATE
from BOOK a
join AUTHOR b on a.AUTHOR_ID = b.AUTHOR_ID
where a.CATEGORY = '경제'
order by PUBLISHED_DATE asc;
