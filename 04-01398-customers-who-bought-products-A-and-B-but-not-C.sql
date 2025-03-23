-- 1398. Customers Who Bought Products A and B but Not C 

/*
Write an SQL query to report the customer_id and customer_name of customers who bought products "A", "B"
    but did not buy the product "C".
    since we want to recommend them buy this product.

Return the result table ordered by customer_id.


Result table:
+-------------+---------------+
| customer_id | customer_name |
+-------------+---------------+
| 3           | Elizabeth     |
+-------------+---------------+
Only the customer_id with id 3 bought the product A and B but not the product C.


*/

SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY 1, 2
HAVING SUM(Orders.product_name = 'A') > 0
  AND SUM(Orders.product_name = 'B') > 0
  AND SUM(Orders.product_name = 'C') = 0;
ORDER BY 1;