
create view frequently_reviewed as
select l.id, property_type, host_name, listing_id, reviews
from (
    select listing_id, count(*) as reviews
    from reviews
    group by listing_id
) t
inner join listings l
on t.listing_id=l.id
order by rank() over(order by reviews desc), property_type , host_name
limit 100
;
