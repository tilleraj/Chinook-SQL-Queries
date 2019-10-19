-- 22_sales_per_country.sql
-- Provide a query that shows the total sales per country.
select sum(i.Total) TotalSales, I.BillingCountry
from Invoice as i
group by i.BillingCountry