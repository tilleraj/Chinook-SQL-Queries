-- 13_line_item_track_artist.sql
-- Provide a query that includes the purchased track name AND artist name with each invoice line item.
select t.Name as Track, a.Name as Artist, il.*
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId
	join Album
	on t.AlbumId = Album.AlbumId
	join Artist as a
	on Album.ArtistId = a.ArtistId