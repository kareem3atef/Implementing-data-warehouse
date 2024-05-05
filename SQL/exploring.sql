-- Sales Invoice Transaction Detail
/* MY CODE
select * from WideWorldImporters.sales.InvoiceLines join WideWorldImporters.Sales.Invoices 
on Sales.InvoiceLines.InvoiceID = Sales.Invoices.InvoiceID
where InvoiceLines.InvoiceID = 100
SELECT * FROM WideWorldImporters.Warehouse.StockItems where StockItemID = 67
*/

SELECT * FROM "WideWorldImporters"."Sales"."InvoiceLines" WHERE "InvoiceLineID" = 1; -- the instructor code --

-- Sales Invoice Transaction
select * from WideWorldImporters.sales.Invoices where InvoiceID = 1

-- Customer
select * from WideWorldImporters.sales.Customers

select CustomerID, CustomerName, BuyingGroupID, DeliveryMethodID, CreditLimit from WideWorldImporters.sales.Customers
where CreditLimit is not null

-- Customer Dimension
select
	cu.CustomerID
	, cu.CustomerName
	, bg.BuyingGroupName
	, ci.CityName
	, sp.StateProvinceCode
	, sp.StateProvinceName
	, co.CountryName
	, cu.CreditLimit
from
	WideWorldImporters.sales.Customers cu
	left outer join WideWorldImporters.sales.BuyingGroups bg on bg.BuyingGroupID = cu.BuyingGroupID
	left outer join WideWorldImporters.[Application].cities ci on ci.CityID = cu.DeliveryCityID
	left outer join WideWorldImporters.[Application].StateProvinces sp on sp.StateProvinceID = ci.StateProvinceID
	left outer join WideWorldImporters.[Application].Countries co on co.CountryID = sp.CountryID

-- Invoice Date Range
select min(InvoiceDate) as minDate,  max(InvoiceDate) as maxDate from WideWorldImporters.Sales.Invoices



