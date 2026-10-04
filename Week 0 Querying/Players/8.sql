select round(avg(height),2) as [average height], round(avg(weight),2) as [average weight]
from players
where debut >= '2000-01-01'

