-- 21_sales_agent_customer_count.sql
-- Provide a query that shows the count of customers assigned to each sales agent.
select count(*) Customers, e.FirstName + ' ' + e.LastName as SalesAgent
from Employee as e
	join Customer as c
	on e.EmployeeId = c.SupportRepId
group by c.SupportRepId, e.FirstName, e.LastName