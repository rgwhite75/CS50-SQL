
with cte as (
    select to_user_id, count(picture) as count
    from messages
    where from_user_id = (
        select id
        from users
        where username = 'creativewisdom377'
    )
    group by to_user_id
    order by count desc
    limit 3
)
select to_user_id
from cte;

