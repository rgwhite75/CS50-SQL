select first_name, last_name, debut
from players
where birth_city='Pittsburgh'
and birth_state='PA'
and debut is not null
order by debut desc, first_name, last_name
