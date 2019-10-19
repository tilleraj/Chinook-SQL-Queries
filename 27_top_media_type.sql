-- 27_top_media_type.sql
-- Provide a query that shows the most purchased Media Type.
select top(5) sum(il.Quantity) Purchases, mt.Name
from InvoiceLine as il
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
	join Track as t
	on il.TrackId = t.TrackId
	join MediaType as mt
	on t.MediaTypeId = mt.MediaTypeId
group by mt.Name
order by Purchases desc