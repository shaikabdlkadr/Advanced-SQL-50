-- 183. Customers Who Never Order

-- pick id from Orders, and do not select those ids

WITH not_order AS (
    SELECT DISTINCT customerid
    FROM orders
)

select name as customers
from customers
where id not in not_order

-- OR

SELECT c.name AS Customers
FROM customers c
LEFT JOIN orders o
    ON c.id = o.customerid
WHERE o.id is NULL
