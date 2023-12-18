
 CREATE OR ALTER TRIGGER taxRateMonitoring
 ON AdventureWorks2022.Sales.SalesTaxRate
 AFTER UPDATE
 AS
 BEGIN
	IF EXISTS ( SELECT 1 FROM inserted WHERE [TaxRate] >[TaxRate]*1.3) 
	BEGIN
	RAISERROR('TaxRate za wysoki.',16,1);
	END;
 END;
 