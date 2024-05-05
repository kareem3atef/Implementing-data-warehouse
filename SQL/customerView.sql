
if exists (select object_id from sys.views where [name] = 'vwDimCustomer') drop view dbo.vwDimCustomer
go

create view dbo.vwDimCustomer
as
select
	CustomerID
	, CustomerName
	, BuyingGroupName
	, CityName
	, StateProvinceCode
	, StateProvinceName
	, CountryName
	, CreditLimit
	-- Formatted Columns
	, isnull(CustomerName, '') as fmtCustomerName
	, isnull(BuyingGroupName, 'Unspecified') as fmtBuyingGroupName
	, isnull(CityName, 'Unspecified') as fmtCityName
	, isnull(StateProvinceCode, 'Unspecified') as fmtStageProvinceCode
	, isnull(StateProvinceName, 'Unspecified') as fmtStateProvinceName
	, isnull(CountryName, 'Unspecified') as fmtCountryName
	, isnull(cast(CreditLimit as varchar), 'None') as fmtCreditLimit
from
	dbo.dimCustomer
go

select * from dbo.vwDimCustomer
