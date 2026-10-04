select avg(per_pupil_expenditure) as [Average District Per-Pupil Expenditure]
from districts d
inner join expenditures e
on d.id=e.district_id

