-- Customer Dimension
select * from dbo.dimCustomer

-- Create Table

if exists (select object_id from sys.tables where [name] = 'dimCustomer') drop table dbo.dimCustomer

create table dbo.dimCustomer
	(
	[CustomerSK] [int] identity(1,1) not null,
	[CustomerID] [int] NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[BuyingGroupName] [nvarchar](50) NULL,
	[CityName] [nvarchar](50) NULL,
	[StateProvinceCode] [nvarchar](5) NULL,
	[StateProvinceName] [nvarchar](50) NULL,
	[CountryName] [nvarchar](60) NULL,
	[CreditLimit] [decimal](18,2) null, 
	[effectiveDate] [datetime] not null,
	[obsoleteDate] [datetime] null,
	)
go

insert into
	dbo.dimCustomer
select
	cu.CustomerID
	, cu.CustomerName
	, bg.BuyingGroupName
	, ci.CityName
	, sp.StateProvinceCode
	, sp.StateProvinceName
	, co.CountryName
	, cu.CreditLimit
	, (select min(i.InvoiceDate) from WideWorldImporters.sales.Invoices i where i.CustomerID = cu.CustomerID) as effectiveDate
	, null as obsoleteDate
from
	WideWorldImporters.sales.Customers cu
	left outer join WideWorldImporters.sales.BuyingGroups bg on bg.BuyingGroupID = cu.BuyingGroupID
	left outer join WideWorldImporters.[Application].cities ci on ci.CityID = cu.DeliveryCityID
	left outer join WideWorldImporters.[Application].StateProvinces sp on sp.StateProvinceID = ci.StateProvinceID
	left outer join WideWorldImporters.[Application].Countries co on co.CountryID = sp.CountryID

select * from dbo.dimCustomer
