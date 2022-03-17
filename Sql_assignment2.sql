--1.      How many products can you find in the Production.Product table?

/*SELECT COUNT(DISTINCT ProductId) AS [Number OF Products]
FROM Production.Product
*/

--2. Write a query that retrieves the number of products in the Production.Product table that are included in a subcategory.
-- The rows that have NULL in column ProductSubcategoryID are considered to not be a part of any subcategory

/*SELECT COUNT(DISTINCT ProductId) AS [Number OF Products], ProductSubCategoryID
FROM  Production.Product
Group BY ProductSubCategoryID*/


--3.How many Products reside in each SubCategory? Write a query to display the results with the following titles.
--ProductSubcategoryID CountedProducts
/*

SELECT ProductSubCategoryID, COUNT(DISTINCT ProductId) AS [CountedProducts]
FROM  Production.Product
Group BY ProductSubCategoryID*/


--4.How many products that do not have a product subcategory
/*
SELECT COUNT(DISTINCT ProductId) [Products Without SubCategory]
FROM Production.Product
where ProductSubCategoryID is null*/

--5. Write a query to list the sum of products quantity in the Production.ProductInventory table.
/*
SELECT SUM(Quantity) [Total Quantity]
FROM Production.ProductInventory*/

-- 6. Write a query to list the sum of products in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100.

--              ProductID    TheSum

--              -----------        ----------
/*

SELECT ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
Where LocationID = 40 and Quantity <100
GROUP BY ProductID
*/

--7. Write a query to list the sum of products with the shelf information in the Production.ProductInventory table and LocationID set to 40 and limit the result to include just summarized quantities less than 100

  --  Shelf      ProductID    TheSum
/*
SELECT Shelf,ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
Where LocationID = 40 and Quantity <100
GROUP BY ProductID, Shelf*/

--8. Write the query to list the average quantity for products where column LocationID has the value of 10 from the table Production.ProductInventory table.
/*
SELECT ProductID, AVG(Quantity) AS [Average Quantity]
FROM  Production.ProductInventory
Where LocationID = 10
Group BY ProductID*/

--9. Write query  to see the average quantity  of  products by shelf  from the table Production.ProductInventory

--    ProductID   Shelf      TheAvg

--    ----------- ---------- -----------


/*SELECT ProductID,Shelf, AVG(Quantity) AS [The Avg]
FROM  Production.ProductInventory

Group BY ProductID, Shelf*/


--10. Write query  to see the average quantity  of  products by shelf excluding rows that has the value of N/A in the column Shelf from the table Production.ProductInventory

--   ProductID   Shelf      TheAvg

--  ----------- ---------- -----------
/*
SELECT ProductID,Shelf, AVG(Quantity) AS [The Avg]
FROM  Production.ProductInventory
Group BY ProductID, Shelf
HAVING Shelf <> 'N/A'*/

--11.  List the members (rows) and average list price in the Production.Product table. This should be grouped independently over the Color and the Class column. Exclude the rows where Color or Class are null.

--    Color                        Class              TheCount          AvgPrice

--    -------------- - -----    -----------            ---------------------




/*
SELECT COLOR,CLASS, COUNT(PRODUCTID) [THECOUNT], AVG(ListPrice) AS [AVERAGE LIST PRICE]
FROM  Production.Product
WHERE COLOR is not null and Class is not null
GROUP BY COLOR, CLASS*/


-- 12.Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables. Join them and produce a result set similar to the following.

    --Country                        Province

    ---------                       ----------------------



/*SELECT r.Name  AS COUNTRY, p.Name AS Province
FROM Person.StateProvince p join Person.CountryRegion r
ON p.CountryRegionCode = r.CountryRegionCode*/

--13. Write a query that lists the country and province names from person. CountryRegion and person. StateProvince tables and list the countries filter them by Germany and Canada. Join them and produce a result set similar to the following.

 

--    Country                        Province

 --   ---------                          ---------------------- 

/*SELECT r.Name  AS COUNTRY, p.Name AS Province
FROM Person.StateProvince p join Person.CountryRegion r
ON p.CountryRegionCode = r.CountryRegionCode 
WHERE r.Name in ('GERMANY', 'CANADA')*/


--14.  List all Products that has been sold at least once in last 25 years.
/*

SELECT e.ProductName, o.OrderDate, year(GETDATE())
FRom [order details extended] e JOIN orders o
ON e.OrderID = o.OrderID
WHERE (YEAR(o.orderDAte) >= year(GETDATE())-25) 
ORDER BY o.OrderDate
DESC
*/


--15.  List top 5 locations (Zip Code) where the products sold most.
/*

SELEct top 5 o.ShipPostalCode
from customers c join orders o ON
c.customerID = o.customerID
where c.PostalCode is not null

*/


--16.  List top 5 locations (Zip Code) where the products sold most in last 25 years.

--SELECT
--*
--from [Order Details Extended]



--17.   List all city names and number of customers in that city.
/*SELECT c.City, COUNT(c.CustomerID) AS [Number of Customers]
FROM orders o LEft join customers c  ON
o.CustomerID = c.CustomerID
Group by c.City*/



--18. ist city names which have more than 2 customers, and number of customers in that city
/*
SELECT c.City, COUNT(c.CustomerID) AS [Number of Customers]
FROM orders o right join customers c  ON
o.CustomerID = c.CustomerID
Group by c.City
HAVING COUNT(c.CustomerID) > 2*/


--19.  List the names of customers who placed orders after 1/1/98 with order date.
/*


select c.contactName, o.orderdate
from customers c join orders o ON
c.CustomerID = o.CustomerID
where o.orderdate > '01/01/1998' 
*/

--20.  List the names of all customers with most recent order dates
/*
select top 5 c.contactName, o.orderdate
from customers c join orders o ON
c.CustomerID = o.CustomerID
ORDER by o.OrderDate
DESC
*/

--21.  Display the names of all customers  along with the  count of products they bought
/*
SELECT C.ContactName, COUNT(oe.productID) [Products bought]
FROM (customers c JOIN orders o ON
c.CustomerID = o.CustomerID)
JOIN [Order Details Extended] oe ON
oe.OrderID = o.OrderID
GROUP BY C.ContactName

*/

--22.  Display the customer ids who bought more than 100 Products with count of products.
/*
SELECT C.ContactName, COUNT(oe.productID) [Products bought]
FROM (customers c JOIN orders o ON
c.CustomerID = o.CustomerID)
JOIN [Order Details Extended] oe ON
oe.OrderID = o.OrderID
GROUP BY C.ContactName

HAVING COUNT(oe.productID) > 100
*/

--23.  List all of the possible ways that suppliers can ship their products. Display the results as below

--    Supplier Company Name                Shipping Company Name
    ---------------------------------      ----------------------------------
/*

    SELECT supp.CompanyName, ship.CompanyName
    from suppliers supp CROSS JOIN shippers ship
    */

--24.  Display the products order each day. Show Order date and Product Name.
/*
SELECT o.OrderDate, p.ProductName
FROM (orders o JOIN [order details extended] oe
on o.OrderID = oe.OrderID) JOIN products p ON
p.productID = oe.ProductID
*/


--25. Displays pairs of employees who have the same job title.
/*
SELECT e.employeeID, e.FirstName + ' ' + e.LastName AS [Employee 1 Name], e.Title , i.employeeID, i.FirstName + ' ' + i.LastName AS [Employee Name], e.title
From Employees e  JOIN Employees i ON
e.Title = i.Title
WHERE e.employeeID <> i.employeeID
*/

--26.  Display all the Managers who have more than 2 employees reporting to them.
/*
SELECT e.employeeID,(e.FirstName + ' ' + e.LastName) AS [Manager], COUNT(i.reportsTo) AS [Number of Employees]--, e.ReportsTo, i.employeeID, i.FirstName + ' ' + i.LastName AS [Employee Name], i.ReportsTo
From Employees e  JOIN Employees i ON
e.employeeID = i.ReportsTo
GROUP BY e.employeeID, e.FirstName + ' ' + e.LastName
*/



--27.  Display the customers and suppliers by city. The results should have the following columns

--City

--Name

--Contact Name,

--Type (Customer or Supplier)

--suppliers
--orders
--products
--[order details extended]




SELECT C.City, C.CompanyName, C.ContactName, S.CompanyName, S.ContactName, S.City 
FROM customers c Full outer JOIN suppliers s ON
C.City = S.City






