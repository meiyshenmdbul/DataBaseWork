with top10(id, orderdate, n) as
(select id, orderdate, row_number() over (order by orderdate)
from 'order'
where 'order'.customerid = 'BLONP'
order by orderdate)
select id, orderdate, pd, round(julianday(orderdate) - julianday(pd), 2)
from
(select id, orderdate, lag(orderdate, 1, orderdate) over (order by n) pd
from top10
where top10.n <= 10);
