-- 175. Combine Two Tables
/*

Write a solution to report the first name, last name, city, and state of each person in the Person table.
    If the address of a personId is not present in the Address table, report null instead.
Return the result table in any order.

Input: 
    Person table:
    +----------+----------+-----------+
    | personId | lastName | firstName |
    +----------+----------+-----------+
    | 1        | Wang     | Allen     |
    | 2        | Alice    | Bob       |
    +----------+----------+-----------+
    Address table:
    +-----------+----------+---------------+------------+
    | addressId | personId | city          | state      |
    +-----------+----------+---------------+------------+
    | 1         | 2        | New York City | New York   |
    | 2         | 3        | Leetcode      | California |
    +-----------+----------+---------------+------------+

Output: 
    +-----------+----------+---------------+----------+
    | firstName | lastName | city          | state    |
    +-----------+----------+---------------+----------+
    | Allen     | Wang     | Null          | Null     |
    | Bob       | Alice    | New York City | New York |
    +-----------+----------+---------------+----------+
*/

SELECT p.firstName, p.lastName, a.city, a.state
FROM person p
LEFT JOIN address a
    USING(personId);
    -- ON p.personid = a.personid;
