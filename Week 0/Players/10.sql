select bats, count(*) as count
from players
where throws='R'
group by bats
order by count desc
