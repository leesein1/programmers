WITH TB_A AS (
    SELECT DISTINCT cart_id
    FROM CART_PRODUCTS
    WHERE name = 'Milk'
),
TB_B AS (
    SELECT DISTINCT cart_id
    FROM CART_PRODUCTS
    WHERE name = 'Yogurt'
)
SELECT aa.cart_id
FROM TB_A aa
JOIN TB_B bb
  ON aa.cart_id = bb.cart_id
ORDER BY aa.cart_id;