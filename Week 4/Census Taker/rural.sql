--DROP VIEW IF EXISTS most_populated;

CREATE VIEW rural AS
SELECT *
FROM census
WHERE district LIKE '%rural%' OR locality LIKE '%rural%';
