--Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
Select FirstName + ' ' + LastName as FullName, CustomerId, Country
from Customer
where Country != 'USA'