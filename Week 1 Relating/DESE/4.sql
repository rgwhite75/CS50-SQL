/*

Some cities have more public schools than others.
In 4.sql, write a SQL query to find the 10 cities with the most public schools.
Your query should return the names of the cities and the number of public schools within them,
ordered from greatest number of public schools to least.
If two cities have the same number of public schools, order them alphabetically.


*/

/*
select s.city, count(name),
dense_rank () over (order by count(s.id) desc ) as rank
from schools s
where s.type='Public School'
group by s.city
order by count(*) desc, city asc
limit 10
*/


/*
select d.city, s.city, s.name
from districts d
inner join schools s
on d.id=s.district_id
where s.type='Public School'
and d.name not like '%(non-op)%'
and (d.city='Acton' OR s.city='Acton')
order by d.city, s.city
*/

/*
select city, schools
from
(
select s.city, count(distinct s.name) as schools,
dense_rank () over (order by count(s.name) desc ) as rank
from schools s
where s.type='Public School'
group by s.city
) tbl
where rank <= 10
order by schools desc, city asc
*/

SELECT "city", COUNT(*)
FROM schools
WHERE "type" = 'Public School'
GROUP BY "city"
ORDER BY COUNT(*) DESC, "city" LIMIT 10;


