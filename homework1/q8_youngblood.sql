select a.regiondescription, a.firstname, a.lastname, a.birthdate
from
(
select r.regiondescription, e.firstname, e.lastname, e.birthdate, 
row_number() over (partition by r.id order by e.birthdate desc) as n
from employee e, employeeterritory et, territory t, region r
where e.id = et.employeeid and et.territoryid = t.id and t.regionid = r.id
) as a
where a.n <= 1;
