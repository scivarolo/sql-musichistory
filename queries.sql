-- Select all from Genre Table
SELECT * from Genre;

-- Add an Artist to the Artist Table
INSERT INTO Artist
VALUES(null, "Lady Gaga", 2007);

-- Add album by Artist
INSERT INTO Album
SELECT null, "Born This Way", 2011, 3668, "Streamline", Artist.ArtistId, Genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Lady Gaga"
AND Genre.Label = "Pop"

-- Add a song
INSERT INTO Song
SELECT null, "Marry the Night", 265, 2011, Genre.GenreId, Artist.ArtistId, Album.AlbumId WHERE true
FROM Artist, Genre, Album
WHERE Artist.ArtistName = "Lady Gaga"
AND Genre.Label = "Pop"
AND Album.Title = "Born This Way"

-- Album info with Album Name, Artist Name and Song Titles
SELECT a.title as AlbumTitle, s.title as SongTitle, ar.ArtistName
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar ON a.ArtistId = ar.ArtistId
WHERE ar.ArtistName = "Lady Gaga"

-- Get how many songs exist in each album
SELECT count() as SongCount, a.Title
FROM Album a
JOIN Song s ON s.AlbumId = a.AlbumId
GROUP BY a.AlbumId
ORDER BY a.Title ASC;

-- Get how many songs exist for each artist
SELECT count() as SongCount, a.ArtistName
FROM Artist a
JOIN Song s ON s.ArtistId = a.ArtistId
GROUP BY a.ArtistId
ORDER BY a.ArtistName ASC;

-- Get how many songs for each Genre
SELECT count() as SongCount, g.Label as GenreLabel
FROM Genre g
JOIN Song s ON s.GenreId = g.GenreId
GROUP BY g.Label
ORDER BY g.Label ASC;

-- Select album with longest length
SELECT Title, max(AlbumLength) FROM Album

-- Select longest song
SELECT Title, max(SongLength) FROM Song

-- Select longest song with Album title too

SELECT Song.Title, Album.Title, max(Song.SongLength)
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId