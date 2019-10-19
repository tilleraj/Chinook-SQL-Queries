-- 20_top_agent.sql
-- Which sales agent made the most in sales over all?
select top(1) sum(i.Total) TotalSales, e.FirstName + ' ' + e.LastName as SalesAgent
from Employee as e
	join Customer as c
	on e.EmployeeId = c.SupportRepId
	join Invoice as i
	on c.CustomerId = i.CustomerId
group by e.EmployeeId, e.FirstName, e.LastName
order by TotalSales desc