

-- All songs with artist and album
SELECT *
FROM v_song_details
ORDER BY artist_name, album_title, track_number;

--All songs from your favorite artist
SELECT *
FROM v_song_details
where artist_name = 'Luna Vega'
ORDER BY artist_name, album_title, track_number;

-- All Billboard hits, best peak first
SELECT *
FROM v_billboard_hit_details
ORDER BY peak_position, chart_year;

-- #1 hits only
SELECT *
FROM v_number_one_hits
ORDER BY chart_year;

-- Artist leaderboard
SELECT *
FROM v_artist_chart_summary
ORDER BY total_weeks_at_number_1 DESC;

-- Albums that produced at least one Billboard hit
SELECT DISTINCT al.album_title, ar.artist_name
FROM   albums al
JOIN   artists ar
ON ar.artist_id = al.artist_id
JOIN   songs s
ON s.album_id   = al.album_id
JOIN   billboard_hits bh
ON bh.song_id   = s.song_id;

-- Songs that never charted
SELECT s.song_title, ar.artist_name
FROM   songs s
JOIN   albums al
ON al.album_id  = s.album_id
JOIN   artists ar
ON ar.artist_id = al.artist_id
LEFT JOIN billboard_hits bh
ON bh.song_id = s.song_id
WHERE  bh.hit_id IS NULL;

--Delete artist
DELETE FROM artists
where artist_name = 'Luna Vega';

--update song name if it was originally mispelled or incorrect
--original title: 'Starlight Ave'
--new value of title: 'Starlight Avenue'
UPDATE albums
set album_title = 'Starlight Avenue'
where album_id= 1

