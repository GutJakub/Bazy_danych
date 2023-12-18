CREATE OR ALTER TRIGGER upper_lastname
ON [AdventureWorks2022].[Person].[Person]
AFTER INSERT 
AS
BEGIN
UPDATE Person.Person
	SET LastName=UPPER(Person.LastName)
	FROM inserted
WHERE Person.BusinessEntityID=inserted.BusinessEntityID
END;