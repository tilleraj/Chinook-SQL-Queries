--brazil_customers_invoices.sql
--Provide a query showing the Invoices of customers who are from Brazil.
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

Select FirstName + ' ' + LastName as FullName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
from Customer
left join Invoice
        on Invoice.CustomerId = Customer.CustomerId
where Country = 'Brazil'
