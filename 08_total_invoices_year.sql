-- 08_total_invoices_year.sql
-- How many Invoices were there in 2009 and 2011?

select count(1) InvoiceCount, Year(i.InvoiceDate) as FiscalYear
from Invoice as i
where i.InvoiceDate between '2009-01-01' and '2009-12-31' or i.InvoiceDate between '2011-01-01' and '2011-12-31'
group by Year(i.InvoiceDate)