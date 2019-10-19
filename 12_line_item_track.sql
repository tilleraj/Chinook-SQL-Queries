-- 12_line_item_track.sql
-- Provide a query that includes the purchased track name with each invoice line item.
select t.Name, il.*
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId