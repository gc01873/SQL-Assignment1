--1.      List all cities that have both Employees and Customers.
/*Select customers.CITY
FROM Employees join customers on
customers.City = employees.city

UNION

Select employees.CITY
FROM Employees join customers on
customers.City = employees.city*/


--2. List all cities that have Customers but no Employee.

--a.      Use sub-query
/*SELECT distinct City 
FROM Customers
where not City in (
    Select city
    from Employees
    
) */

--b.      Do not use sub-query
/*Select DISTINCT c.city
From customers c left join employees e ON
c.city = e.City
where e.city is null*/

--3. List all products and their total order quantities throughout all orders.

-- Select field1, Aggregate(field2) Over([Partition By field3] Order By field4) From Table.


/*CREATE View productOrder AS
Select o.OrderId AS oOrderID, o.ProductID AS oProductID, o.Quantity AS oQuantity, p.productID AS pProductID
FROM [Order Details Extended] o RIGHT JOIN PRODUCTS P ON
O.ProductID = P.ProductID


Select DISTINCT pProductID, sum(oQuantity) AS Quantity
FRom productOrder
Group by pProductID
Order BY pProductID
  
*/



--4. List all Customer Cities and total products ordered by that city.
--Select field1, Aggregate(field2) Over([Partition By field3] Order By field4) From Table.

/*
select sub.city AS [City], sub.[Product Quantity Sold] AS [Product Quantity Sold] , row_number() Over (partition by sub.city Order by sub.city) AS num INTO #tempCusCity
FROM
(select  c.city,  sum( sub.Quanity_sum) OVER(partition by c.city order by c.city) AS [Product Quantity Sold]
from customers c join 
(select  o.customerID, sum(od.quantity) OVER(partition by od.OrderID Order by od.productID ) AS Quanity_sum, od.OrderID, ProductID
From Orders o  join [Order Details Extended] Od 
on o.orderId = od.OrderID) sub on c.CustomerID=sub.customerID) sub


WITH cte AS (
    SELECT 
        City, [Product Quantity Sold],
        ROW_NUMBER() OVER (
           partition by city Order by city
        ) row_num
     FROM 
       #tempCusCity
)
DELETE FROM cte
WHERE row_num > 1;

Select City,[Product Quantity Sold]  FRom #tempCusCity
order by city

*/

--5 

--6 List all Customer Cities that have ordered at least two different kinds of products.

--TRY THIS QUERY AGAIN

/*
Select Distinct c.city AS [Cities with more than 1 Product ordered]
From customers c JOIN (select  o.customerID, COUNT(DISTINCT od.ProductID) AS [Product Count]
From Orders o join [Order Details Extended] Od 
on o.orderId = od.OrderID
Group by o.CustomerID
Having COUNT( DISTINCT od.ProductID) >= 2
) sub on 
c.CustomerID = sub.customerID
*/

--7 List all Customers who have ordered products, but have the ‘ship city’ on the order different from their own customer cities.

/*
SELECT Distinct c.City
From customers c JOin (
select  o.customerID, o.ShipCity
From Orders o right join [Order Details Extended] Od 
on o.orderId = od.OrderID) sub ON
c.customerID = sub.customerID AND c.city <> sub.ShipCity
*/


/*
--8   List 5 most popular products, their average price, and the customer city that ordered most quantity of it.
DROP TABLE #TFIVE
 SELECT * INTO #TFive FROM ( 
Select TOP 5 productID AS prodID, AVG(UnitPrice) AS Average_UnitPrice , COUNT(productID) AS [Products Sold],  ROW_NUMBER () OVER (Order by COUNT(productID) DESC ) AS RANK_SOLD
FRom [Order Details Extended]
group by productID 
)  as x
--LOOK OVER REVISIT
--Select  c.customerID,fsub.customerID, fsub.ProductID, fsub.[products sold],fsub.OrderID, fsub.AVerage_UnitPrice
SELECT  z.RANK_SOLD, MAX(z.Product_Count), z.Average_unitPRice 
FROM (
    select c.city, c.customerID, count(fsub.prodID) OVER(partition by c.city ORDER By fsub.RANK_SOLD) AS Product_Count, fsub.[products sold],fsub.orderID, fsub.RANK_SOLD, fsub.AVerage_UnitPrice
FROM (
    Select o.customerID, od.orderID, od.productID, f.prodID, f.[products sold],f.AVerage_UnitPrice, f.Rank_Sold

FROM #TFive f  join  [Order Details Extended] od on 
od.productID = f.prodID join orders o ON
od.OrderID = o.orderID) fsub join customers c ON
fsub.CustomerID = c.CustomerID
) z GROUP BY z.RANK_SOLD,z.Average_unitPrice
*/


/*

--9     List all cities that have never ordered something but we have employees there.

--a.      Use sub-query
select *
from
(SElect distinct o.ShipCity AS [Cities Never Ordered From Orders]
From orders o left join customers c
on c.city = o.ShipCity
where c.city is null ) b full outer join 
(SElect distinct e.city AS [Cities never ordered From employee table]
from employees e left join customers c ON
e.city = c.city
where c.city is null) e on 
b.[Cities Never Ordered From Orders] = e.[Cities never ordered From employee table]

--b.      Do not use sub-query

SElect distinct o.ShipCity AS [Cities Never Ordered ]
From orders o left join customers c
on c.city = o.ShipCity
where c.city is null
Union

SElect distinct e.city
from employees e left join customers c ON
e.city = c.city
where c.city is null
*/


--10  List one city, if exists, that is the city from where the employee sold most orders (not the product quantity) is, and also the city of most total quantity of products ordered from. (tip: join  sub-query)
/*
with CTE_MAX_ORDER_CITY AS(
SELECT sub.shipcity, sub.NUM_OF_ORDERS, ROW_NUMBER () OVER (order BY sub.NUM_OF_ORDERS DESC ) AS  ORDERED_NUM
FROM
( select COUNT(orderID) AS NUM_OF_ORDERS, shipcity
from orders
group by ShipCity) sub
)


Select * from CTE_MAX_ORDER_CITY
where ordered_num = 1
*/

--11.How do you remove the duplicates record of a table?
 
 --You can use a common table expression such as this example to delete duplicate rows in a table

/*WITH cte AS (
    SELECT 
        contact_id, 
        first_name, 
        last_name, 
        email, 
        ROW_NUMBER() OVER (
            PARTITION BY 
                first_name, 
                last_name, 
                email
            ORDER BY 
                first_name, 
                last_name, 
                email
        ) row_num
     FROM 
        sales.contacts
)
DELETE FROM cte
WHERE row_num > 1;*/






