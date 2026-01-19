select
    substr(PRODUCT_CODE, 0, 2) CATEGORY,
    count(*) PRODUCTS
from PRODUCT
group by substr(PRODUCT_CODE, 0, 2)
order by CATEGORY ;