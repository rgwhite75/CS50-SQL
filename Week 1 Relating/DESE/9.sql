select name
from
(
select *,
dense_rank () over (order by sum(e.pupils) asc ) as rank
from districts d
left join Expenditures e
on d.id=e.district_id
where d.name not like '%(non-op)%'
group by d.city
) tbl
where rank=1