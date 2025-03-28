-- 1407. Top Travellers

/*
Write a solution to report the distance traveled by each user.

Return the result table ordered by travelled_distance in descending order,
    if two or more users traveled the same distance, order them by their name in ascending order.

Input: 

Users table:
    +------+-----------+
    | id   | name      |
    +------+-----------+
    | 1    | Alice     |
    | 2    | Bob       |
    | 3    | Alex      |
    | 4    | Donald    |
    | 7    | Lee       |
    | 13   | Jonathan  |
    | 19   | Elvis     |
    +------+-----------+

Rides table:
    +------+----------+----------+
    | id   | user_id  | distance |
    +------+----------+----------+
    | 1    | 1        | 120      |
    | 2    | 2        | 317      |
    | 3    | 3        | 222      |
    | 4    | 7        | 100      |
    | 5    | 13       | 312      |
    | 6    | 19       | 50       |
    | 7    | 7        | 120      |
    | 8    | 19       | 400      |
    | 9    | 7        | 230      |
    +------+----------+----------+


Output: 
    +----------+--------------------+
    | name     | travelled_distance |
    +----------+--------------------+
    | Elvis    | 450                |
    | Lee      | 450                |
    | Bob      | 317                |
    | Jonathan | 312                |
    | Alex     | 222                |
    | Alice    | 120                |
    | Donald   | 0                  |
    +----------+--------------------+

Explanation: 
    Elvis and Lee traveled 450 miles, Elvis is the top traveler as his name is alphabetically smaller than Lee.
    Bob, Jonathan, Alex, and Alice have only one ride and we just order them by the total distances of the ride.
    Donald did not have any rides, the distance traveled by him is 0.

*/


SELECT u.name, COALESCE(SUM(r.distance), 0) AS travelled_distance
FROM users AS u
LEFT JOIN rides AS r
    ON u.id = r.user_id
GROUP BY 1, u.id
ORDER BY 2 DESC, 1 ASC;