/*
DESE would like you to determine in what cities additional public schools might be needed.
In 5.sql, write a SQL query to find cities with 3 or fewer public schools.
Your query should return the names of the cities and the number of public schools within them,
ordered from greatest number of public schools to least. If two cities have the same
number of public schools, order them alphabetically.


) tbl

*/

select city, schools
from
(
select s.city, count(s.id) as schools,
dense_rank () over (order by count(s.id) asc ) as rank
from districts d
inner join schools s
on d.id=s.district_id
where s.type='Public School'
and d.name not like '%(non-op)%'
group by s.city
) tbl
where rank <= 3
order by schools desc, city


