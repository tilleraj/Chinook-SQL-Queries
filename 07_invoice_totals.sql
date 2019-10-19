-- 07_invoice_totals.sql
-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

select i.Total, c.FirstName + ' ' + c.LastName as Customer, i.BillingCountry as Country, e.FirstName + ' ' + e.LastName as SalesAgent
from Invoice as i
	join Customer as c
	on i.CustomerId = c.CustomerId
	join Employee as e
	on c.SupportRepId = e.EmployeeId