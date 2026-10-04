
--drop view cipher;

CREATE VIEW cipher AS
SELECT
    14   AS sentence_number,
    98   AS char_number,
    4    AS message_length
UNION ALL
SELECT
    114, 3,   5
UNION ALL
SELECT
    618, 72,  9
UNION ALL
SELECT
    630, 7,   3
UNION ALL
SELECT
    932, 12,  5
UNION ALL
SELECT
    2230, 50, 7
UNION ALL
SELECT
    2346, 44, 10
UNION ALL
SELECT
    3041, 14, 5;

--drop view message;

CREATE VIEW message AS
select substr(sentence,char_number,message_length) as phrase
from sentences
inner join cipher
on id=sentence_number;


