-- 1607. Sellers With No Sales 

/*
Write an SQL query to report the names of all sellers who did not make any sales in 2020.
Return the result table ordered by seller_name in ascending order.

Customer table:
    +--------------+---------------+
    | customer_id  | customer_name |
    +--------------+---------------+
    | 101          | Alice         |
    | 102          | Bob           |
    | 103          | Charlie       |
    +--------------+---------------+

Orders table:
    +-------------+------------+--------------+-------------+-------------+
    | order_id    | sale_date  | order_cost   | customer_id | seller_id   |
    +-------------+------------+--------------+-------------+-------------+
    | 1           | 2020-03-01 | 1500         | 101         | 1           |
    | 2           | 2020-05-25 | 2400         | 102         | 2           |
    | 3           | 2019-05-25 | 800          | 101         | 3           |
    | 4           | 2020-09-13 | 1000         | 103         | 2           |
    | 5           | 2019-02-11 | 700          | 101         | 2           |
    +-------------+------------+--------------+-------------+-------------+

Seller table:
    +-------------+-------------+
    | seller_id   | seller_name |
    +-------------+-------------+
    | 1           | Daniel      |
    | 2           | Elizabeth   |
    | 3           | Frank       |
    +-------------+-------------+

Result table:
    +-------------+
    | seller_name |
    +-------------+
    | Frank       |
    +-------------+

Daniel made 1 sale in March 2020.
Elizabeth made 2 sales in 2020 and 1 sale in 2019.
Frank made 1 sale in 2019 but no sales in 2020.

*/

SELECT seller_name
FROM seller s
WHERE seller_id NOT IN 
    (SELECT seller_id 
    FROM Orders
    WHERE sale_date LIKE '2020%')
ORDER BY 1;

-- using JOIN with conditions
  
SELECT s.seller_name
FROM seller s
LEFT JOIN orders o
    ON o.seller_id = s.seller_id
    AND o.sale_date LIKE '2020%' 
WHERE o.seller_id IS NULL
ORDER BY 1;

