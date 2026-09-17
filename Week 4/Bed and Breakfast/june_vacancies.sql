

create view june_vacancies as
select l.id, property_type, host_name, count(*) as days_vacant
from availabilities a
inner join listings l
on a.listing_id=l.id
where available='TRUE'
and date between '2023-06-01' and '2023-06-30'
group by l.id, property_type, host_name

