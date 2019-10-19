-- 10_invoice_37_line_item_count.sql
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(1) LineItemCount, InvoiceLine.InvoiceId
from InvoiceLine
where InvoiceLine.InvoiceId = 37
group by InvoiceLine.InvoiceId