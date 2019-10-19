-- 06_sales_agent_invoices.sql
-- Provide a query that shows the invoices associated with each sales agent.
-- The resultant table should include the Sales Agent's full name.

select e.FirstName + ' ' + e.LastName as SalesAgent, i.*
from Invoice as i
	join Customer as c
	on i.CustomerId = c.CustomerId
	join Employee as e
	on c.SupportRepId = e.EmployeeId