select categoryname, count(*), round(avg(product.unitprice), 2), min(product.unitprice), max(product.unitprice), sum(product.unitsonorder)
from product, category
where category.id = product.categoryid 
group by categoryname
having count(category.id) > 10
order by category.id;
