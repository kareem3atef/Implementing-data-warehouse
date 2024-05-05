-- Invoice Date Range
select min(InvoiceDate) as minDate,  max(InvoiceDate) as maxDate from WideWorldImporters.Sales.Invoices

-- Create Table

if exists (select object_id from sys.tables where [name] = 'dimDate') drop table dbo.dimDate

CREATE TABLE [dbo].[dimDate](
	[calendarDate] [date] NULL,
	[dayOfWeekNum] [int] NULL,
	[dayOfWeekName] [nvarchar](30) NULL,
	[dayOfCalendarMonthNum] [int] NULL,
	[dayOfCalendarYearNum] [int] NULL,
	[calendarWeekNum] [int] NULL,
	[calendarMonthNum] [int] NULL,
	[calendarMonthName] [nvarchar](30) NULL,
	[calendarQuarterNum] [int] NULL,
	[calendarYearNum] [int] NULL
) ON [PRIMARY]
GO

-- Load Dimension
set nocount on

declare	@minDate date = (select min(InvoiceDate) from WideWorldImporters.Sales.Invoices)
		, @maxDate date = (select max(InvoiceDate) from WideWorldImporters.Sales.Invoices)
		, @loadDate date

set @loadDate = @minDate
while @loadDate <= @maxDate begin
	if not exists (select calendarDate from dbo.dimDate where calendarDate = @loadDate)
		insert into
			dbo.dimDate
		select
			@loadDate as calendarDate
			, datepart(dw, @loadDate) as dayOfWeekNum
			, datename(dw, @loadDate) as dayOfWeekName
			, datepart(dd, @loadDate) as dayOfCalendarMonthNum
			, datepart(dy, @loadDate) as dayOfCalendarYearNum
			, datepart(wk, @loadDate) as calendarWeekNum
			, datepart(m, @loadDate) as calendarMonthNum
			, datename(m, @loadDate) as calendarMonthName
			, datepart(q, @loadDate) as calendarQuarterNum
			, datepart(yy, @loadDate) as calendarYearNum

	set @loadDate = dateadd(dd, 1, @loadDate)
end

select * from dbo.dimDate
