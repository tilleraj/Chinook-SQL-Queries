-- 24_top_2013_track.sql
-- Provide a query that shows the most purchased track of 2013.
select top(1) sum(il.Quantity) Purchases, t.TrackId, t.Name
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
where year(i.InvoiceDate) = 2013
group by il.TrackId, t.TrackId, t.Name
order by Purchases desc