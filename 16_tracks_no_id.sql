-- 16_tracks_no_id.sql
-- Provide a query that shows all the Tracks, but displays no IDs.
-- The result should include the Album name, Media type and Genre.
select t.Name, a.Title, m.Name, g.Name, t.Composer, t.Milliseconds, t.Bytes, t.UnitPrice
from Track as t
	join Album as a
	on t.AlbumId = a.AlbumId
	join MediaType as m
	on t.MediaTypeId = m.MediaTypeId
	join Genre as g
	on t.GenreId = g.GenreId