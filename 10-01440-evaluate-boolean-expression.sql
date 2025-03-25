-- 1440. Evaluate Boolean Expression

/*

Write an SQL query to evaluate the boolean expressions in Expressions table.
Return the result table in any order.

Variables table:
    +------+-------+
    | name | value |
    +------+-------+
    | x    | 66    |
    | y    | 77    |
    +------+-------+

Expressions table:
    +--------------+----------+---------------+
    | left_operand | operator | right_operand |
    +--------------+----------+---------------+
    | x            | >        | y             |
    | x            | <        | y             |
    | x            | =        | y             |
    | y            | >        | x             |
    | y            | <        | x             |
    | x            | =        | x             |
    +--------------+----------+---------------+

Result table:
    +--------------+----------+---------------+-------+
    | left_operand | operator | right_operand | value |
    +--------------+----------+---------------+-------+
    | x            | >        | y             | false |
    | x            | <        | y             | true  |
    | x            | =        | y             | false |
    | y            | >        | x             | true  |
    | y            | <        | x             | false |
    | x            | =        | x             | true  |
    +--------------+----------+---------------+-------+
As shown, you need find the value of each boolean exprssion in the table using the variables table.

*/


-- create 2 variable tables : l for left operand & r for right operand
-- use join to join it to the main table
-- write case statements using l.value and r.value

SELECT e.left_operand, e.operator, e.right_operand, CASE
    WHEN e.operator = '<' AND l.value < r.value THEN 'true'
    WHEN e.operator = '>' AND l.value > r.value THEN 'true'
    WHEN e.operator = '=' AND l.value = r.value THEN 'true'
    ELSE 'false' END AS value
FROM expression e
JOIN variables l
    ON l.name = e.left_operand
JOIN variables r
    ON r.name = e.right_operand;
