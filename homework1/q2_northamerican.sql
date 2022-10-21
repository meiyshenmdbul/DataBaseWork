select id, shipcountry, 
        (case 
	when shipcountry in( 'USA','Mexico','Canada') then 'NorthAmerica'
        else 'OtherPlace' 
        end)
from "order"
where id >= 15445
order by id
limit 20;
