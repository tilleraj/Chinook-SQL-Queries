-- 09_total_sales_year.sql
-- What are the respective total sales for each of those years?
select sum(i.Total) InvoiceTotal, Year(i.InvoiceDate) as FiscalYear
from Invoice as i
where i.InvoiceDate between '2009-01-01' and '2009-12-31' or i.InvoiceDate between '2011-01-01' and '2011-12-31'
group by Year(i.InvoiceDate)