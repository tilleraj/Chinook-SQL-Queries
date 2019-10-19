-- 23_top_country.sql
-- Which country's customers spent the most?
select top(1) sum(i.Total) TotalSales, i.BillingCountry
from Invoice as i
group by i.BillingCountry
order by TotalSales desc