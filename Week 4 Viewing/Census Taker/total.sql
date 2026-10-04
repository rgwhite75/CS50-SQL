--DROP VIEW most_populated;

CREATE VIEW total AS
SELECT sum(families) as families,
sum(households) as households,
sum(population) as population,
sum(male) as male,
sum(female) as female
FROM census
