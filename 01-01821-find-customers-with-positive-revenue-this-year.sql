-- 1821. Find Customers With Positive Revenue this Year¶1821. Find Customers With Positive Revenue this Year

select customer_id
from customers
where year = '2021' and revenue > 0
