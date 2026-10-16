# Design Document

By Richard White

Video overview: https://www.youtube.com/watch?v=FsgrW0k0TQQ&list=PLcwNmaw455-w

## Scope

The database includes the information needed to perform research on artists, their albums, and related songs. 

The following information is included within this database:
* Artists
* Albums
* Songs
* Billboard Hits

Outside the scope of this analysis would be artists without any albums or songs available.

## Functional Requirements

This database will support:
* Reviewing songs and albums for given artists
* Reviewing artists with and without billboard hits
* Review artists and song attributes

The database will not support specifically for:
* Music videos
* Artists without and albums or songs

## Representation

### Entities
This database includes the following tables:

Artists
The Artists table includes the following:

* Artist_id – this is the unique id of the artist, formatted as an INTEGER and does not allow NULL values. This column is set as the PRIMARY KEY.
* Artist_name – this is the name of the artist, formatted as an VARCHAR, with a constraint of it must be unique.
* Genre – represents the music genre of the artist, formatted as a VARCHAR.
* Country – represents the music genre of the artist, formatted as a VARCHAR.
* Formed_year – is the year the artist/band was created, formatted as an INTEGER.

Albums
The Albums table includes the following:
* album_id - this is the unique id of the album, formatted as an INTEGER and does not allow NULL values. This column is set as the PRIMARY KEY. 
* artist_id – this is the id of the artist, formatted as an INTEGER and does not allow for NULL values. This column has a FOREIGN KEY constraint applied and REFERENCES to the ARTIST table.
* album_title – the title of the album, formatted as 
* release_date – this is the date the album was released.
* record_label – the is the name of the record label who produced the album.

Songs
The Songs table includes the following:
* song_id - this is the unique id of the song, formatted as an INTEGER and does not allow NULL values. This column is set as the PRIMARY KEY. 
* album_id - this is the id of the album, formatted as an INTEGER and does not allow for NULL values. This column has a FOREIGN KEY constraint applied and REFERENCES to the ALBUMS table.
* song_title – this is the name of the song, formatted as a VARCHAR.
* track_number – this is the track number of the song on the album, formatted as an INTEGER.
* duration_seconds – this is how long the song is in seconds, formatted as an integer. This column has a CHECK constraint where the value, if any, must be greater than 0 seconds.

Billboard Hits
The Billboard Hits table contains the following:
* hit_id - this is the unique id of the billboard hit, formatted as an INTEGER and does not allow NULL values. This column is set as the PRIMARY KEY. 
* song_id - this is the id of the song, formatted as an INTEGER and does not allow for NULL values. This column has a FOREIGN KEY constraint applied and REFERENCES to the SONGS table.
* chart_year – this the year the song was a billboard hit and does not allow NULL values.
* peak_position – this is the top ranking of the song for the given year, formatted as an INTEGER and does not allow NULL values.
* weeks_on_chart – this is the amount of time, in weeks, the song was a billboard hit for the given year, formatted as an INTEGER.
* weeks_at_number_1 – this is the aggregated number of weeks the song was ranked number 1 on the billboard charts, is formatted as an INTEGER and set to have a DEFAULT value of 0.
* debut_date – this is the date the song first appeared on the billboard chart for that given year.


This database includes the following views:

Song Details
The Song Details view contains the following:
* song_id, song_title, track_number, and duration_seconds from the songs table.
* album_id, album_title, and release_date from the albums table, joined to the songs table by the album_id.
* artist_id, artist_name, and genre from the artist table, joined to the albums table by the artist_id.

Billboard Hit Details
The Billboard Hit Details view contains the following:
* hit_id, chart_year, peak_position, weeks_on_chart, weeks_at_number_1, and debut_date from the billboard_hits table.
* song_title from the SONGS table, joined to the billboard_hits table on the song_id.
* album_title from the ALBUM table, joined to the songs table by the album_id.
* artist_name and genre from the artists table, joined to the albums table by the artist_id.

Number One Hits
The Number on Hits view contains the following:
* chart_year, song_title, artist_name, album_title, and weeks_at_number_1 where the peak_position = 1.

Artist Chart Summary
The Artist Chart Summary view contains the following:
* artist_id, artist_name, and genre from the artists table.
* total_chart_hits - is the total count of hit_id from the billboard_hits table, joined to the songs table by the song_id and calculated by count(hit_id)
* best_peak_position – is the highest position of the given song as a billboard hit, joined to the songs table by the song_id and calculated as min(peak_position).
* total_weeks_at_number_1 – is the total number of times the given song was ranked as number one on the billboard hits chart, joined to the songs table by song_id, and is calculated by coalesce(total number of weeks at number 1, 0).
* total_weeks_on_chart – is the total number of weeks the give song was on the billboard hits chart, joined to the songs table by song_id, and is calculated by coalesce( total weeks on chart, 0).



### Relationships

Albums and Artists
* Artist_id – Foreign Key referencing table artist(artist_id).

Songs and Albums
* Album_id – Foreign Key referencing table albums(album_id).

Billboard Hits and Songs
* Song_id – Foreign Key referencing table songs(song_id).


## Optimizations

The following INDEXs were created in order to boost performance:
* Columns artist_id and release_date on the albums table.
* Columns album_id and song_title on the songs table.
* Columns song_id, chart_year, and peak_position on the billboard_hits table.
* Column genre on the artists table.


## Limitations

This database only includes information from the top billboard hits and not other music rating sources such as Apple Music and Spotify.
