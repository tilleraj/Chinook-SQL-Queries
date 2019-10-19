-- 1. What is the undiscounted subtotal for each Order (identified by OrderID).
select sum(od.UnitPrice*od.Quantity) UndiscountedTotal, o.OrderID
from Orders as o
	join [Order Details] as od
	on o.OrderID = od.OrderID
group by o.OrderID

-- 2. What products are currently for sale (not discontinued)?
select *
from Products as p
where p.Discontinued = 1

-- 3. What is the cost after discount for each order? 
-- Discounts should be applied as a percentage off.
select od.OrderID,
		sum(od.UnitPrice*od.Quantity) UndiscountedTotal,
		cast(sum(od.UnitPrice*(1-od.Discount)*od.Quantity) as decimal(10,2)) DiscountedTotal
from Orders as o
	join [Order Details] as od
	on o.OrderID = od.OrderID
group by od.OrderID
order by DiscountedTotal desc

-- 4. I need a list of sales figures broken down by category. 
-- Include the total amount sold over all time and the total number of items sold.
select c.CategoryName, 
		cast(sum(od.UnitPrice*(1-od.Discount)*od.Quantity) as decimal(10,2)) as TotalSales,
		count(od.Quantity) as TotalItems
from [Order Details] as od
	join Products as p
	on p.ProductID = od.ProductID
	join Categories as c
	on p.CategoryID = c.CategoryID
group by c.CategoryName

-- 5. What are our 10 most expensive products?
select top(10)p.UnitPrice, p.*
from Products as p
order by p.UnitPrice desc

-- 6. In which quarter in 1997 did we have the most revenue?
select top(1)cast(sum(od.UnitPrice*(1-od.Discount)*od.Quantity) as decimal(10,2)) as TotalSales,
		DATEPART(QUARTER, o.OrderDate) as QuarterOfYear
from [Order Details] as od
	join Orders as o
	on od.OrderID = o.OrderID
where year(o.OrderDate) = 1997
group by DATEPART(QUARTER, o.OrderDate)
order by TotalSales desc

-- 7. Which products have a price that is higher than average?
select p.*
from Products as p
	join (select AVG(UnitPrice) AVGPrice
		from Products as p) as a
	on 1 = 1
where p.UnitPrice > a.AVGPrice
order by p.UnitPrice