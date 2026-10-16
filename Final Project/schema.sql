/*
Final Project on Music, Artists, and Billboard hits
Name: Richard White
GitHub Username: rgwhite75
EdX Username:rgwhite75
City-Country: Westford, USA
Date of Video:
*/



--CREATE TABLES

CREATE TABLE artists (
    artist_id     INTEGER       NOT NULL,
    artist_name   VARCHAR(100)  NOT NULL,
    genre         VARCHAR(50),
    country       VARCHAR(50),
    formed_year   INTEGER,
    CONSTRAINT pk_artists PRIMARY KEY (artist_id),
    CONSTRAINT uq_artist_name UNIQUE (artist_name)
);

CREATE TABLE albums (
    album_id      INTEGER       NOT NULL,
    artist_id     INTEGER       NOT NULL,
    album_title   VARCHAR(150)  NOT NULL,
    release_date  DATE,
    record_label  VARCHAR(100),
    CONSTRAINT pk_albums PRIMARY KEY (album_id),
    CONSTRAINT fk_albums_artist FOREIGN KEY (artist_id)
        REFERENCES artists (artist_id)
);

CREATE TABLE songs (
    song_id           INTEGER       NOT NULL,
    album_id          INTEGER       NOT NULL,
    song_title        VARCHAR(150)  NOT NULL,
    track_number      INTEGER,
    duration_seconds  INTEGER,
    CONSTRAINT pk_songs PRIMARY KEY (song_id),
    CONSTRAINT fk_songs_album FOREIGN KEY (album_id)
        REFERENCES albums (album_id),
    CONSTRAINT ck_songs_duration CHECK (duration_seconds > 0)
);

CREATE TABLE billboard_hits (
    hit_id             INTEGER  NOT NULL,
    song_id            INTEGER  NOT NULL,
    chart_year         INTEGER  NOT NULL,
    peak_position      INTEGER  NOT NULL,
    weeks_on_chart     INTEGER,
    weeks_at_number_1  INTEGER  DEFAULT 0,
    debut_date         DATE,
    CONSTRAINT pk_billboard_hits PRIMARY KEY (hit_id),
    CONSTRAINT fk_hits_song FOREIGN KEY (song_id)
        REFERENCES songs (song_id),
    CONSTRAINT ck_hits_peak CHECK (peak_position BETWEEN 1 AND 100)
);




--INSERT DATA - ARTISTS

INSERT INTO artists (artist_id, artist_name, genre, country, formed_year) VALUES (1, 'Luna Vega', 'Pop', 'USA', 2012);
INSERT INTO artists (artist_id, artist_name, genre, country, formed_year) VALUES (2, 'The Midnight Echoes', 'Rock', 'UK', 2005);
INSERT INTO artists (artist_id, artist_name, genre, country, formed_year) VALUES (3, 'Marcus Delray', 'R&B', 'USA', 2015);
INSERT INTO artists (artist_id, artist_name, genre, country, formed_year) VALUES (4, 'Neon Harbor', 'Electronic', 'Sweden', 2010);
INSERT INTO artists (artist_id, artist_name, genre, country, formed_year) VALUES (5, 'Dusty Road Collective', 'Country', 'USA', 2008);
INSERT INTO artists (artist_id, artist_name, genre, country, formed_year) VALUES (6, 'Kira Tanaka', 'J-Pop', 'Japan', 2017);



--INSERT DATA - ALBUMS

INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (1, 1, 'Starlight Avenue', '2018-03-16', 'Aurora Records');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (2, 1, 'Neon Dreams', '2021-09-10', 'Aurora Records');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (3, 2, 'Static & Smoke', '2010-05-21', 'Blackbird Music');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (4, 2, 'Hollow Skies', '2016-11-04', 'Blackbird Music');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (5, 3, 'Velvet Hours', '2019-02-14', 'Crimson Sound');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (6, 3, 'Late Night Confessions', '2022-08-26', 'Crimson Sound');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (7, 4, 'Pulse Machine', '2017-06-09', 'Northern Lights Entertainment');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (8, 5, 'Backroad Memories', '2014-04-18', 'Cedar Creek Records');
INSERT INTO albums (album_id, artist_id, album_title, release_date, record_label) VALUES (9, 6, 'Tokyo Skyline', '2020-10-02', 'Sakura Label Group');



--INSERT DATA - SONGS

--Starlight Avenue
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (1, 1, 'Starlight Avenue', 1, 215);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (2, 1, 'Paper Hearts', 2, 198);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (3, 1, 'Dance Until Dawn', 3, 224);

--Neon Dreams
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (4, 2, 'Neon Dreams', 1, 201);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (5, 2, 'Glass Heart', 2, 187);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (6, 2, 'Midnight Drive', 3, 233);

--Static & Smoke
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (7, 3, 'Static', 1, 255);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (8, 3, 'Smoke Signals', 2, 242);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (9, 3, 'Burn the Bridges', 3, 268);

--Hollow Skies
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (10, 4, 'Hollow Skies', 1, 279);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (11, 4, 'Ghost Town', 2, 231);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (12, 4, 'Last Train Home', 3, 250);

--Velvet Hours
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (13, 5, 'Velvet Hours', 1, 245);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (14, 5, 'Slow Burn', 2, 218);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (15, 5, 'Say You Will', 3, 227);

--Late Night Confessions
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (16, 6, 'Late Night Confessions', 1, 236);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (17, 6, 'Golden Hour', 2, 209);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (18, 6, 'Run to You', 3, 221);

--Pulse Machine
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (19, 7, 'Pulse Machine', 1, 312);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (20, 7, 'Afterglow', 2, 288);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (21, 7, 'Digital Rain', 3, 301);

--Backroad Memories
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (22, 8, 'Backroad Memories', 1, 214);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (23, 8, 'Dust and Diesel', 2, 199);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (24, 8, 'Whiskey Sunrise', 3, 226);

--Tokyo Skyline
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (25, 9, 'Tokyo Skyline', 1, 207);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (26, 9, 'Cherry Blossom Rain', 2, 193);
INSERT INTO songs (song_id, album_id, song_title, track_number, duration_seconds) VALUES (27, 9, 'Neon Alley', 3, 215);



--INSERT DATA - BILLBOARD HITS

INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (1, 1, 2018, 3, 24, 0, '2018-03-31');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (2, 3, 2018, 1, 32, 4, '2018-05-12');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (3, 4, 2021, 2, 28, 0, '2021-09-25');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (4, 6, 2021, 1, 40, 6, '2021-11-06');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (5, 8, 2010, 12, 18, 0, '2010-06-05');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (6, 10, 2016, 5, 26, 0, '2016-11-19');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (7, 13, 2019, 4, 30, 0, '2019-03-02');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (8, 14, 2019, 1, 35, 3, '2019-04-13');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (9, 17, 2022, 2, 27, 0, '2022-09-10');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (10, 20, 2017, 9, 15, 0, '2017-07-01');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (11, 22, 2014, 7, 22, 0, '2014-05-03');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (12, 24, 2014, 1, 38, 5, '2014-07-12');
INSERT INTO billboard_hits (hit_id, song_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, debut_date) VALUES (13, 26, 2020, 18, 12, 0, '2020-10-17');


--INDEXES

CREATE INDEX idx_albums_artist_id      ON albums (artist_id);
CREATE INDEX idx_albums_release_date   ON albums (release_date);
CREATE INDEX idx_songs_album_id        ON songs (album_id);
CREATE INDEX idx_songs_title           ON songs (song_title);
CREATE INDEX idx_hits_song_id          ON billboard_hits (song_id);
CREATE INDEX idx_hits_chart_year       ON billboard_hits (chart_year);
CREATE INDEX idx_hits_peak_position    ON billboard_hits (peak_position);
CREATE INDEX idx_artists_genre         ON artists (genre);


--VIEWS


--Every song with its album and artist
CREATE VIEW v_song_details AS
SELECT  s.song_id,
        s.song_title,
        s.track_number,
        s.duration_seconds,
        al.album_id,
        al.album_title,
        al.release_date,
        ar.artist_id,
        ar.artist_name,
        ar.genre
FROM    songs   s
JOIN    albums  al ON al.album_id  = s.album_id
JOIN    artists ar ON ar.artist_id = al.artist_id;

--Billboard hits with full song / album / artist context
CREATE VIEW v_billboard_hit_details AS
SELECT  bh.hit_id,
        bh.chart_year,
        bh.peak_position,
        bh.weeks_on_chart,
        bh.weeks_at_number_1,
        bh.debut_date,
        s.song_title,
        al.album_title,
        ar.artist_name,
        ar.genre
FROM    billboard_hits bh
JOIN    songs   s  ON s.song_id    = bh.song_id
JOIN    albums  al ON al.album_id  = s.album_id
JOIN    artists ar ON ar.artist_id = al.artist_id;

--Only the #1 hits
CREATE VIEW v_number_one_hits AS
SELECT  chart_year,
        song_title,
        artist_name,
        album_title,
        weeks_at_number_1
FROM    v_billboard_hit_details
WHERE   peak_position = 1;

--Chart performance rolled up by artist
CREATE VIEW v_artist_chart_summary AS
SELECT  ar.artist_id,
        ar.artist_name,
        ar.genre,
        COUNT(bh.hit_id)                       AS total_chart_hits,
        MIN(bh.peak_position)                  AS best_peak_position,
        COALESCE(SUM(bh.weeks_at_number_1), 0) AS total_weeks_at_number_1,
        COALESCE(SUM(bh.weeks_on_chart), 0)    AS total_weeks_on_chart
FROM    artists ar
LEFT JOIN albums         al ON al.artist_id = ar.artist_id
LEFT JOIN songs          s  ON s.album_id   = al.album_id
LEFT JOIN billboard_hits bh ON bh.song_id   = s.song_id
GROUP BY ar.artist_id, ar.artist_name, ar.genre;


/*
DROP VIEW  IF EXISTS v_artist_chart_summary;
DROP VIEW  IF EXISTS v_number_one_hits;
DROP VIEW  IF EXISTS v_billboard_hit_details;
DROP VIEW  IF EXISTS v_song_details;

DROP TABLE IF EXISTS billboard_hits;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;
*/
