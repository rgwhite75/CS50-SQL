--DROP VIEW most_populated;

CREATE VIEW most_populated AS
SELECT district,
sum(families) as families,
sum(households) as households,
sum(population) as population,
sum(male) as male,
sum(female) as female
FROM census
group by district
order by sum(population)  desc

