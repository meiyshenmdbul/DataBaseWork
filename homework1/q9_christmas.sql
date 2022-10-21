select group_concat(pn, ', ') 
from
(
select distinct productname pn
from customer c, 'order' o, orderdetail od, product p
where c.companyname = 'Queen Cozinha' and c.id = o.customerid and o.orderdate < '2014-12-26' and o.orderdate > '2014-12-24' and o.id = od.orderid and od.productid = p.id
order by p.id
);
