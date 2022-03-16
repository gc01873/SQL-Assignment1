/*1. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, with no filter. 
SELECT ProductID, Name, Color, ListPrice
FROM Production.product */

/*2. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, excludes the rows that ListPrice is 0.

SELECT ProductID, Name, Color, ListPrice
FROM Production.product 
WHERE ListPrice <> 0 */

/*3. Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are NULL for the Color column

SELECT ProductID, Name, Color, ListPrice
FROM Production.product 
WHERE Color is Null */

/* 4  Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the Color column.

SELECT ProductID, Name, Color, ListPrice
FROM Production.product 
WHERE Color is not Null */


/* 5 Write a query that retrieves the columns ProductID, Name, Color and ListPrice from the Production.Product table, the rows that are not NULL for the column Color, and the column ListPrice has a value greater than zero.


SELECT ProductID, Name, Color, ListPrice
FROM Production.product 
WHERE Color is not Null and ListPrice > 0
*/

/* 6 Write a query that concatenates the columns Name and Color from the Production.Product table by excluding the rows that are null for color

SELECT ProductID, ListPrice, (Name+ ' '+ Color) AS Name_Color
FROM Production.product 
WHERE Color is not Null */

/* 7 Write a query that generates the following result set  from Production.Product:
NAME: LL Crankarm  --  COLOR: Black
NAME: ML Crankarm  --  COLOR: Black
NAME: HL Crankarm  --  COLOR: Black
NAME: Chainring Bolts  --  COLOR: Silver
NAME: Chainring Nut  --  COLOR: Silver
NAME: Chainring  --  COLOR: Black


SELECT (Name + ' -- ' + Color) As Name_Color
FROM production.Product
Where (Name like '%Crankarm' or Name like 'Chainring%') AND Color in ('Silver','Black') 

*/

/* 8 Write a query to retrieve the to the columns ProductID and Name from the Production.Product table filtered by ProductID from 400 to 500 

SELECT ProductID, Name
FROM Production.product 
WHERE ProductID  between 400 and 500
*/


/* 9
Write a query to retrieve the to the columns  ProductID, Name and color from the Production.Product table restricted to the colors black and blue

SELECT ProductID, Name, Color
FROM Production.product 
WHERE Color in ('black','blue')
*/

/*10 Write a query to get a result set on products that begins with the letter S.
SELECT *
FROM Production.product 
WHERE Name like 'S%'  */

/*11
Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. 
Name                                               ListPrice
Seat Lug                                              0,00
Seat Post                                             0,00
Seat Stays                                            0,00
Seat Tube                                            0,00
Short-Sleeve Classic Jersey, L           53,99
Short-Sleeve Classic Jersey, M          53,99  

SELECT Name, ListPrice
FROM PRoduction.Product
Where ListPrice in(0,53.99) and (Name like 'Seat%' or Name like 'Short%') 
ORDER BY Name
Desc

*/

/*12. Write a query that retrieves the columns Name and ListPrice from the Production.Product table. Your result set should look something like the following. Order the result set by the Name column. The products name should start with either 'A' or 'S'
Name                                               ListPrice
Adjustable Race                                    0,00
All-Purpose Bike Stand                             159,00
AWC Logo Cap                                       8,99
Seat Lug                                           0,00
Seat Post                                          0,00 


SELECT Name, ListPrice
FROM PRoduction.Product
Where ListPrice in(0,8.99,159) and (Name like 'S%' or Name like 'A%')
ORDER BY Name
ASC
*/

/* 13. Write a query so you retrieve rows that have a Name that begins with the letters SPO, but is then not followed by the letter K. After this zero or more letters can exists. Order the result set by the Name column. 

SELECT Name, ListPrice
FROM PRoduction.Product
Where  (Name like 'SPO%') and not (Name like 'SPOK%')
ORDER BY Name
ASC

*/

/* 14. Write a query that retrieves unique colors from the table Production.Product. Order the results  in descending  manner 

SELECT Distinct Color
FROM PRoduction.Product
ORDER BY Color
DESC  */

/* 15 Write a query that retrieves the unique combination of columns ProductSubcategoryID and Color from the Production.Product table. Format and sort so the result set accordingly to the following. We do not want any rows that are NULL.in any of the two columns in the result. 


SELECT isNull(ProductSubcategoryID,0),Color
FROM PRoduction.Product
Where Color is not null


*/