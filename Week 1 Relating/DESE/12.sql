/*

A parent asks you for advice on finding the best public school districts in Massachusetts.
In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures
and an above-average percentage of teachers rated “exemplary”.
Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary.
Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).
*/

select distinct d.name, e.per_pupil_expenditure, se.exemplary
from districts d
inner join schools s
on d.id=s.district_id
inner join Expenditures e
on d.id=e.district_id
inner join Staff_Evaluations se
on d.id=se.district_id
where d.name not like '%(non-op)%'
and s.type='Public School'
and e.per_pupil_expenditure > (select avg(per_pupil_expenditure) from Expenditures)
and se.exemplary > (select avg(exemplary) from Staff_Evaluations)
order by  se.exemplary desc, e.per_pupil_expenditure desc
