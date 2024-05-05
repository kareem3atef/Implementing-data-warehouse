
if exists (select object_id from sys.views where [name] = 'vwDimDate') drop view dbo.vwDimDate
go

create view dbo.vwDimDate
as
select
	calendarDate
	, dayOfWeekNum
	, dayOfWeekName
	, dayOfCalendarMonthNum
	, dayOfCalendarYearNum
	, calendarWeekNum
	, calendarMonthNum
	, calendarMonthName
	, calendarQuarterNum
	, calendarYearNum
	-- Formatted Columns
	, convert(varchar, calendarDate, 101) as fmtCalendarDate
	, concat('W', calendarWeekNum, ' ', calendarYearNum) as fmtCalendarWeekYear
	, concat(left(calendarMonthName, 3), ' ', calendarYearNum) as fmtCalendarMonthYear
	, concat('Q', calendarQuarterNum, ' ', calendarYearNum) as fmtCalendarQuarterYear
from
	dbo.dimDate
go

select * from dbo.vwDimDate
