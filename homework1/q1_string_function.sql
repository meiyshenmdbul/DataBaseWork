select distinct shipname, substr(shipname, 1, instr(shipname, '-') - 1)
from "order"
where shipname like '%-%'
order by shipname;

