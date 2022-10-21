select s.productname, s.companyname, s.contactname
from 
(
select p.productname, c.companyname, c.contactname,o.orderdate, 
row_number() over (partition by p.productname order by o.orderdate) as n
from product p, orderdetail od, 'order' o, customer c
where p.discontinued = 1 and p.id = od.productid and od.orderid = o.id and o.customerid = c.id
) as s
where s.n <= 1
order by s.productname;
