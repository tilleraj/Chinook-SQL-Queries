-- 18_sales_agent_total_sales.sql
-- Provide a query that shows total sales made by each sales agent.
select sum(i.Total) TotalSales, e.FirstName + ' ' + e.LastName as SalesAgent
from Employee as e
	join Customer as c
	on e.EmployeeId = c.SupportRepId
	join Invoice as i
	on c.CustomerId = i.CustomerId
group by e.EmployeeId, e.FirstName, e.LastName