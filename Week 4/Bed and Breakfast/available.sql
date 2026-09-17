create view available as
select l.id, property_type, host_name, a.date
from availabilities a
inner join listings l
on a.listing_id=l.id
where available='TRUE'

