/*
In 13.sql, write a SQL query to answer a question you have about the data! The query should:

    Involve at least one JOIN or subquery
*/

select distinct s.name, se.exemplary
from districts d
inner join schools s
on d.id=s.district_id
inner join Expenditures e
on d.id=e.district_id
inner join Staff_Evaluations se
on d.id=se.district_id
where d.name not like '%(non-op)%'
and se.exemplary < (select avg(exemplary) from Staff_Evaluations)

