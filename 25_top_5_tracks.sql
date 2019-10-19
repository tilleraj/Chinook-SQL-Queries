-- 25_top_5_tracks.sql
-- Provide a query that shows the top 5 most purchased songs.
select top(5) sum(il.Quantity) Purchases, t.TrackId, t.Name
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
group by il.TrackId, t.TrackId, t.Name
order by Purchases desc