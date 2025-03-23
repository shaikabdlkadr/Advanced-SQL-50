-- 1873. Calculate Special Bonus


-- simple CASE statement

SELECT employee_id, (CASE
    WHEN employee_id % 2 = 1 AND name NOT LIKE 'M%' then salary
    ELSE 0
    END) AS bonus
FROM employees
ORDER BY 1 ASC;
