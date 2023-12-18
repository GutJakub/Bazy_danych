USE AdventureWorksLT2022
GO
CREATE TABLE ProductRev1(
Typ VARCHAR(30),
TotalValue INT
);
WITH ProductSalesCTE AS
(
SELECT
pr.ProductCategoryID,
SUM( sod.LineTotal) AS TotalValue,
prc.Name
FROM
SalesLT.SalesOrderDetail sod
INNER JOIN SalesLT.Product pr ON pr.ProductID=sod.ProductID
INNER JOIN SalesLT.ProductCategory prc ON prc.ProductCategoryID=pr.ProductCategoryID
GROUP BY pr.ProductCategoryID,prc.Name
)
INSERT INTO ProductRev1(Typ,TotalValue)
SELECT
Name,
TotalValue
FROM ProductSalesCTE
Select * from ProductRev1;