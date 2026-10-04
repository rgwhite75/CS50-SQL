--DROP VIEW most_populated;

CREATE VIEW by_district AS
SELECT district,
sum(families) as families,
sum(households) as households,
sum(population) as population,
sum(male) as male,
sum(female) as female
FROM census
group by district
