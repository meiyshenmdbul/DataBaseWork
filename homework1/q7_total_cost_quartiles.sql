with cid_expenditure(Cname, Cid, exp) as
(
select distinct ifnull(c.companyname, 'MISSING_NAME'), customerid, round(sum(unitprice * quantity), 2) 
from 'order' o 
left outer join customer c on o.customerid = c.id 
join orderdetail od on o.id = od.orderid
group by o.customerid
),
sort_cid_expeenditure(Cname, Cid, exp, q) as
(
select Cname, Cid, exp, ntile(4) over (order by exp)
from cid_expenditure
)
select Cname, Cid, exp
from sort_cid_expeenditure sce
where sce.q = 1
order by exp;