Class constructor
	
	This:C1470.sut:=cs:C1710.CalendarJp.me
	
Function convertFromGregorian
	
	$result:=JSON Stringify:C1217(This:C1470.sut.convertFromGregorian(!1868-01-25!))
	This:C1470.UTest\
		.describe("test with !1868-01-25!")\
		.expect($result)\
		.toBe("{\"year\":1,\"month\":1,\"day\":1,\"isLeapMonth\":false,\"era\":{\"index\":1,\"name\":\"明治\",\"sign\":\"M\",\"symbol\":\"㍾\",\"maxYear\":45,\"offsetToGregorian\":1867,\"firstMonth\":1,\"firstDay\":1,\"lastMonth\":7,\"lastDay\":30}}")
	
	$result:=JSON Stringify:C1217(This:C1470.sut.convertFromGregorian(!1868-02-23!))
	This:C1470.UTest\
		.describe("test with !1868-02-23!")\
		.expect($result)\
		.toBe("{\"year\":1,\"month\":2,\"day\":1,\"isLeapMonth\":false,\"era\":{\"index\":1,\"name\":\"明治\",\"sign\":\"M\",\"symbol\":\"㍾\",\"maxYear\":45,\"offsetToGregorian\":1867,\"firstMonth\":1,\"firstDay\":1,\"lastMonth\":7,\"lastDay\":30}}")
	
	$result:=JSON Stringify:C1217(This:C1470.sut.convertFromGregorian(!1868-06-11!))
	This:C1470.UTest\
		.describe("test with !1868-06-11!")\
		.expect($result)\
		.toBe("{\"year\":1,\"month\":4,\"day\":21,\"isLeapMonth\":true,\"era\":{\"index\":1,\"name\":\"明治\",\"sign\":\"M\",\"symbol\":\"㍾\",\"maxYear\":45,\"offsetToGregorian\":1867,\"firstMonth\":1,\"firstDay\":1,\"lastMonth\":7,\"lastDay\":30}}")
	
	$result:=JSON Stringify:C1217(This:C1470.sut.convertFromGregorian(!1868-03-24!))
	This:C1470.UTest\
		.describe("test with !1868-03-24!")\
		.expect($result)\
		.toBe("{\"year\":1,\"month\":3,\"day\":1,\"isLeapMonth\":false,\"era\":{\"index\":1,\"name\":\"明治\",\"sign\":\"M\",\"symbol\":\"㍾\",\"maxYear\":45,\"offsetToGregorian\":1867,\"firstMonth\":1,\"firstDay\":1,\"lastMonth\":7,\"lastDay\":30}}")
	
	$result:=JSON Stringify:C1217(This:C1470.sut.convertFromGregorian(!1868-10-23!))
	This:C1470.UTest\
		.describe("test with !1868-10-23!")\
		.expect($result)\
		.toBe("{\"year\":1,\"month\":9,\"day\":8,\"isLeapMonth\":false,\"era\":{\"index\":1,\"name\":\"明治\",\"sign\":\"M\",\"symbol\":\"㍾\",\"maxYear\":45,\"offsetToGregorian\":1867,\"firstMonth\":1,\"firstDay\":1,\"lastMonth\":7,\"lastDay\":30}}")
	
Function _meijiMonthName
	
Function _meijiMonthLength
	
Function _lastDayNumber
	
Function String
	
	$result:=This:C1470.sut.String(!1868-06-11!; "ggggy年M月d日")
	This:C1470.UTest\
		.describe("test with !1868-06-11!, ggggy年M月d日")\
		.expect($result)\
		.toBe("明治元年潤4月21日")
	
	$result:=This:C1470.sut.String(!1989-01-07!; "g.y年M月d日")
	This:C1470.UTest\
		.describe("test with !1989-01-07!, g.y年M月d日")\
		.expect($result)\
		.toBe("S.64年1月7日")
	
	$result:=This:C1470.sut.String(!1989-01-08!; "ggy年M月d日")
	This:C1470.UTest\
		.describe("test with !1989-01-08!, ggy年M月d日")\
		.expect($result)\
		.toBe("平元年1月8日")
	
	$result:=This:C1470.sut.String(!2019-04-30!; "gggy年M月d日")
	This:C1470.UTest\
		.describe("test with !2019-04-30!, gggy年M月d日")\
		.expect($result)\
		.toBe("㍻31年4月30日")
	
	$result:=This:C1470.sut.String(!2019-05-01!; "ggggy年M月d日")
	This:C1470.UTest\
		.describe("test with !2019-05-01!, ggggy年M月d日")\
		.expect($result)\
		.toBe("令和元年5月1日")
	
	
	
	
	