property era : cs:C1710._EraSettings
property year : Integer
property month : Integer
property day : Integer
property isLeapMonth : Boolean

Class constructor($date : Date)
	
	This:C1470.year:=Year of:C25($date)
	This:C1470.month:=Month of:C24($date)
	This:C1470.day:=Day of:C23($date)
	This:C1470.isLeapMonth:=False:C215