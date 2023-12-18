
  --HR.EmployeePayHistory Rate
  --HR.Employee Names
  Create Table TempEmployeeInfo(
EmployeeID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Rate MONEY
);
WITH EmployeeCTE AS
(
Select 
e.BusinessEntityID,
p.FirstName,
p.LastName,
e.Rate
FROM 
HumanResources.EmployeePayHistory e
INNER JOIN 
Person.Person p ON e.BusinessEntityID=p.BusinessEntityID
)
INSERT INTO TempEmployeeInfo(EmployeeID,
					FirstName,LastName,Rate)
SELECT
BusinessEntityID,
FirstName,
LastName,
Rate
FROM
EmployeeCTE;
SELECT*FROM TempEmployeeInfo;