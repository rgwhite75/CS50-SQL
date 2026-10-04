
select username
from users u
join (
    select to_user_id, count(to_user_id) as count
    from messages
    group by to_user_id
) as tbl
on u.id = tbl.to_user_id
order by count desc
limit 1;

