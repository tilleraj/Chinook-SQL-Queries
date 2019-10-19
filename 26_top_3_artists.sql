-- 26_top_3_artists.sql
-- Provide a query that shows the top 3 best selling artists.
select top(5) sum(il.Quantity) Purchases, ar.Name
from InvoiceLine as il
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
	join Track as t
	on il.TrackId = t.TrackId
	join Album as al
	on t.AlbumId = al.AlbumId
	join Artist as ar
	on al.ArtistId = ar.ArtistId
group by ar.Name
order by Purchases desc