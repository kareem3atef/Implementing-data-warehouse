-- Ana Florea
select * from WideWorldImporters.sales.Customers where CustomerID = 915
select * from [PearsonLearning70-767].dbo.dimCustomer where CustomerID = 915

-- Update BuyingGroup
update WideWorldImporters.sales.customers set BuyingGroupID = 1 where CustomerID = 915
select * from WideWorldImporters.sales.Customers where CustomerID = 915
select * from [PearsonLearning70-767].dbo.dimCustomer where CustomerID = 915

-- Update Name
update WideWorldImporters.sales.customers set CustomerName = 'Ana Florea Enterprises' where CustomerID = 915
select * from WideWorldImporters.sales.Customers where CustomerID = 915
select * from [PearsonLearning70-767].dbo.dimCustomer where CustomerID = 915

-- Reset
update WideWorldImporters.sales.customers set BuyingGroupID = null, CustomerName = 'Ana Florea' where CustomerID = 915
select * from WideWorldImporters.sales.Customers where CustomerID = 915
select * from [PearsonLearning70-767].dbo.dimCustomer where CustomerID = 915

