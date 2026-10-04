/*
DESE is preparing a report on schools in the Cambridge school district.
In 7.sql, write a SQL query to find the names of schools (public or charter!) in the Cambridge school district.
Keep in mind that Cambridge, the city, contains a few school districts, but DESE is interested in the district whose name is “Cambridge.”
*/

select s.name
from districts d
inner join schools s
on d.id=s.district_id
where d.name = 'Cambridge'
and d.name not like '%(non-op)%'

