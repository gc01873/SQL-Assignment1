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

/*Select  CustomerID, COUNT(OrderID)
From Orders
Group By CustomerID*/



--5 

--6


--7

--8

--9

--10

--11 You can use a common table expression such as this example to delet duplicate rows in a table

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







