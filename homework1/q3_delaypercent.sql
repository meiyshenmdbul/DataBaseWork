select companyname, 
round(count(case when shippeddate > requireddate then true else null end) * 100.0 / count(*), 2) as percentage
from 'order', shipper
where 'order'.shipvia = shipper.id
group by shipper.id
order by percentage desc;
