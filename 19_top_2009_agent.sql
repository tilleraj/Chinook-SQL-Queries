-- 19_top_2009_agent.sql
-- Which sales agent made the most in sales in 2009?
-- HINT: [TOP](https://docs.microsoft.com/en-us/sql/t-sql/queries/top-transact-sql)
select top(1) sum(i.Total) TotalSales, e.FirstName + ' ' + e.LastName as SalesAgent
from Employee as e
	join Customer as c
	on e.EmployeeId = c.SupportRepId
	join Invoice as i
	on c.CustomerId = i.CustomerId
where year(i.InvoiceDate) = 2009
group by e.EmployeeId, e.FirstName, e.LastName
order by TotalSales desc