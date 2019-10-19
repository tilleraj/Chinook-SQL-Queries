-- 14_country_invoices.sql
-- Provide a query that shows the # of invoices per country. HINT: GROUP BY
select count(1) InvoiceCount, i.BillingCountry as Country
from Invoice as i
group by i.BillingCountry