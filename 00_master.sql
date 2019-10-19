-- 01_non_usa_customers.sql
-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
Select FirstName + ' ' + LastName as FullName, CustomerId, Country
from Customer
where Country != 'USA'

-- 02_brazil_customers.sql
-- Provide a query only showing the Customers from Brazil.
Select *
from Customer
where Country = 'Brazil'

--03_brazil_customers_invoices.sql
--Provide a query showing the Invoices of customers who are from Brazil.
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
Select FirstName + ' ' + LastName as FullName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry
from Customer
left join Invoice
        on Invoice.CustomerId = Customer.CustomerId
where Country = 'Brazil'

-- 04_sales_agents.sql
-- Provide a query showing only the Employees who are Sales Agents.
select *
from Employee
where Title = 'Sales Support Agent'

-- 05_unique_invoice_countries.sql
-- Provide a query showing a unique/distinct list of billing countries from the Invoice table
select distinct BillingCountry
from Invoice

-- 06_sales_agent_invoices.sql
-- Provide a query that shows the invoices associated with each sales agent.
-- The resultant table should include the Sales Agent's full name.
select e.FirstName + ' ' + e.LastName as SalesAgent, i.*
from Invoice as i
	join Customer as c
	on i.CustomerId = c.CustomerId
	join Employee as e
	on c.SupportRepId = e.EmployeeId

-- 07_invoice_totals.sql
-- Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select i.Total, c.FirstName + ' ' + c.LastName as Customer, i.BillingCountry as Country, e.FirstName + ' ' + e.LastName as SalesAgent
from Invoice as i
	join Customer as c
	on i.CustomerId = c.CustomerId
	join Employee as e
	on c.SupportRepId = e.EmployeeId

-- 08_total_invoices_year.sql
-- How many Invoices were there in 2009 and 2011?
select count(1) InvoiceCount, Year(i.InvoiceDate) as FiscalYear
from Invoice as i
where i.InvoiceDate between '2009-01-01' and '2009-12-31' or i.InvoiceDate between '2011-01-01' and '2011-12-31'
group by Year(i.InvoiceDate)

-- 09_total_sales_year.sql
-- What are the respective total sales for each of those years?
select sum(i.Total) InvoiceTotal, Year(i.InvoiceDate) as FiscalYear
from Invoice as i
where i.InvoiceDate between '2009-01-01' and '2009-12-31' or i.InvoiceDate between '2011-01-01' and '2011-12-31'
group by Year(i.InvoiceDate)

-- 10_invoice_37_line_item_count.sql
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(1) LineItemCount, InvoiceLine.InvoiceId
from InvoiceLine
where InvoiceLine.InvoiceId = 37
group by InvoiceLine.InvoiceId

-- 11_line_items_per_invoice.sql
-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
-- HINT: [GROUP BY](https://docs.microsoft.com/en-us/sql/t-sql/queries/select-group-by-transact-sql)
select count(1) LineItemCount, InvoiceLine.InvoiceId
from InvoiceLine
group by InvoiceLine.InvoiceId

-- 12_line_item_track.sql
-- Provide a query that includes the purchased track name with each invoice line item.
select t.Name, il.*
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId

-- 13_line_item_track_artist.sql
-- Provide a query that includes the purchased track name AND artist name with each invoice line item.
select t.Name as Track, a.Name as Artist, il.*
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId
	join Album
	on t.AlbumId = Album.AlbumId
	join Artist as a
	on Album.ArtistId = a.ArtistId

-- 14_country_invoices.sql
-- Provide a query that shows the # of invoices per country. HINT: GROUP BY
select count(1) InvoiceCount, i.BillingCountry as Country
from Invoice as i
group by i.BillingCountry

-- 15_playlists_track_count.sql
-- Provide a query that shows the total number of tracks in each playlist.
-- The Playlist name should be include on the resulant table.
select count(1) TracksInPlaylist, pt.PlaylistId as PLID, pl.Name as Playlist
from PlaylistTrack as pt
	join Playlist as pl
	on pl.PlaylistId = pt.PlaylistId
group by pt.PlaylistId, pl.Name

-- 16_tracks_no_id.sql
-- Provide a query that shows all the Tracks, but displays no IDs.
-- The result should include the Album name, Media type and Genre.
select t.Name, a.Title, m.Name, g.Name, t.Composer, t.Milliseconds, t.Bytes, t.UnitPrice
from Track as t
	join Album as a
	on t.AlbumId = a.AlbumId
	join MediaType as m
	on t.MediaTypeId = m.MediaTypeId
	join Genre as g
	on t.GenreId = g.GenreId

-- 17_invoices_line_item_count.sql
-- Provide a query that shows all Invoices but includes the # of invoice line items.
select count(il.InvoiceId) Items, i.InvoiceId, i.CustomerId, i.InvoiceDate, i.BillingAddress,
		i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total
from Invoice as i
	join InvoiceLine as il
	on i.InvoiceId = il.InvoiceId
group by il.InvoiceId, i.InvoiceId, i.CustomerId, i.InvoiceDate, i.BillingAddress,
		i.BillingCity, i.BillingState, i.BillingCountry, i.BillingPostalCode, i.Total

-- 18_sales_agent_total_sales.sql
-- Provide a query that shows total sales made by each sales agent.
select sum(i.Total) TotalSales, e.FirstName + ' ' + e.LastName as SalesAgent
from Employee as e
	join Customer as c
	on e.EmployeeId = c.SupportRepId
	join Invoice as i
	on c.CustomerId = i.CustomerId
group by e.EmployeeId, e.FirstName, e.LastName

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

-- 21_sales_agent_customer_count.sql
-- Provide a query that shows the count of customers assigned to each sales agent.
select count(*) Customers, e.FirstName + ' ' + e.LastName as SalesAgent
from Employee as e
	join Customer as c
	on e.EmployeeId = c.SupportRepId
group by c.SupportRepId, e.FirstName, e.LastName

-- 22_sales_per_country.sql
-- Provide a query that shows the total sales per country.
select sum(i.Total) TotalSales, i.BillingCountry
from Invoice as i
group by i.BillingCountry

-- 23_top_country.sql
-- Which country's customers spent the most?
select top(1) sum(i.Total) TotalSales, i.BillingCountry
from Invoice as i
group by i.BillingCountry
order by TotalSales desc

-- 24_top_2013_track.sql
-- Provide a query that shows the most purchased track of 2013.
select top(1) sum(il.Quantity) Purchases, t.TrackId, t.Name
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
where year(i.InvoiceDate) = 2013
group by il.TrackId, t.TrackId, t.Name
order by Purchases desc

-- 25_top_5_tracks.sql
-- Provide a query that shows the top 5 most purchased songs.
select top(5) sum(il.Quantity) Purchases, t.TrackId, t.Name
from InvoiceLine as il
	join Track as t
	on il.TrackId = t.TrackId
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
group by il.TrackId, t.TrackId, t.Name
order by Purchases desc

-- 26_top_3_artists.sql
-- Provide a query that shows the top 3 best selling artists.
select top(5) sum(il.Quantity) Purchases, ar.Name
from InvoiceLine as il
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
	join Track as t
	on il.TrackId = t.TrackId
	join Album as al
	on t.AlbumId = al.AlbumId
	join Artist as ar
	on al.ArtistId = ar.ArtistId
group by ar.Name
order by Purchases desc

-- 27_top_media_type.sql
-- Provide a query that shows the most purchased Media Type.
select top(5) sum(il.Quantity) Purchases, mt.Name
from InvoiceLine as il
	join Invoice as i
	on il.InvoiceId = i.InvoiceId
	join Track as t
	on il.TrackId = t.TrackId
	join MediaType as mt
	on t.MediaTypeId = mt.MediaTypeId
group by mt.Name
order by Purchases desc