USE AdventureWorks2022
Go
--1
--BEGIN TRANSACTION;
--UPDATE Production.Product
--SET ListPrice=ListPrice*1.1,
--StandardCost=StandardCost*1.1
--WHERE ProductID=680;
--SELECT *
--from Production.Product p
--WHERE p.ProductID=707;
--2 
--BEGIN TRANSACTION;
--DELETE FROM PRODUCTION.Product 
--WHERE PRoductID=707
--DELETE FROM Production.ProductCostHistory
--WHERE ProductID=707;
--ROLLBACK;
--SELECT *
--from Production.Product p
--WHERE p.ProductID=707;

--3
--BEGIN TRANSACTION;
--INSERT INTO Production.Product(SellStartDate,DaysToManufacture,StandardCost,ReorderPoint,SafetyStockLevel,ProductNumber,Name,ListPrice)
--VALUES('2013-11-11',45,2500,1,1,123456,'Rowery',2300)
--SELECT*from Production.Product
--WHERE ListPrice=2300;
--COMMIT;--ROLLBACK;

--4
--BEGIN TRANSACTION;
--UPDATE Production.Product
--SET StandardCost=StandardCost*1.1 ;
--DECLARE @SUMA DECIMAL(18,2);
--SELECT @SUMA = SUM(p.StandardCost)
--FROM Production.Product p;
--SELECT*from Production.Product
--WHERE ProductID=735;
--IF @SUMA >50000
--ROLLBACK;
--ELSE
--COMMIT;
--SELECT*from Production.Product
--WHERE ProductID=735;

--5
/*BEGIN TRANSACTION
DECLARE @productnum NVARCHAR
SELECT @productnum='123456';
IF EXISTS (SELECT * from Production.Product 
WHERE ProductNumber=@productnum)
BEGIN
	ROLLBACK;
	PRINT 'Istnieje juz taki productnum';
END
ELSE
BEGIN
INSERT INTO Production.Product(SellStartDate,DaysToManufacture,
StandardCost,ReorderPoint,SafetyStockLevel,ProductNumber,Name,ListPrice)
VALUES('2013-11-11',45,2500,1,1,
@productnum,'Rowery',2300)
COMMIT;
PRINT 'nie istnia³ dodano do tabeli';
END*/

--6
--SELECT*from Sales.SalesOrderDetail;
--BEGIN TRANSACTION;
/*UPDATE Sales.SalesOrderDetail
SET OrderQty=OrderQty-1
DECLARE @zmienna INT
SELECT @zmienna=COUNT(*)
FROM Sales.SalesOrderDetail 
WHERE OrderQty=0;
SELECT*from Sales.SalesOrderDetail;
IF @zmienna>0
ROLLBACK;
ELSE
COMMIT;*/

--7
--SELECT *FROM Production.Product;
/*BEGIN TRANSACTION;
DECLARE @srednia DECIMAL(18,4)
SELECT @srednia=AVG(StandardCost)
From Production.Product p;
DECLARE @liczba_r INT
SELECT @liczba_r=COUNT(StandardCost)
FROM Production.Product
WHERE @srednia< StandardCost;
DELETE FROM Production.Product
WHERE @srednia < StandardCost
Select @srednia,@liczba_r;
IF @liczba_r>10
BEGIN
	ROLLBACK;
	PRINT 'Transakcja Rollback';
END
ELSE
BEGIN
	COMMIT;
	PRINT 'Transakcja Commit';
END*/



