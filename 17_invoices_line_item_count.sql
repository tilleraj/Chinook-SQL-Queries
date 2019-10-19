-- 17_invoices_line_item_count.sql
-- Provide a query that shows all Invoices but includes the # of invoice line items.
select count(il.InvoiceId) Items, i.InvoiceId, i.CustomerId, i.InvoiceDate, i.BillingAddress,
		i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total
from Invoice as i
	join InvoiceLine as il
	on i.InvoiceId = il.InvoiceId
group by il.InvoiceId, i.InvoiceId, i.CustomerId, i.InvoiceDate, i.BillingAddress,
		i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total