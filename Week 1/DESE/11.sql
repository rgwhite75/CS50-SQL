/*
Is there a relationship between school expenditures and graduation rates?
In 11.sql, write a SQL query to display the names of schools, their per-pupil expenditure,
and their graduation rate. Sort the schools from greatest per-pupil expenditure to least.
If two schools have the same per-pupil expenditure, sort by school name.

    You should assume a school spends the same amount per-pupil their district as a whole spends.
*/

select distinct s.name, e.per_pupil_expenditure, graduated
from districts d
inner join schools s
on d.id=s.district_id
inner join Expenditures e
on d.id=e.district_id
inner join Graduation_Rates gr
on s.id=gr.school_id
where d.name not like '%(non-op)%'
order by per_pupil_expenditure desc, s.name

