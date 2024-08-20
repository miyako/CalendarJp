//%attributes = {"invisible":true}
var $CalendarJp : cs:C1710.CalendarJp

$CalendarJp:=cs:C1710.CalendarJp.me

//meiji test
$test:=$CalendarJp.convertFromGregorian(!1868-01-25!)  //1.1.1
$test:=$CalendarJp.convertFromGregorian(!1868-02-23!)  //1.2.1
$test:=$CalendarJp.convertFromGregorian(!1868-03-24!)  //1.3.1
$test:=$CalendarJp.convertFromGregorian(!1868-10-23!)  //1.9.8
$test:=$CalendarJp.convertFromGregorian(!1868-06-11!)  //1.4.21

$test:=$CalendarJp.String(!1868-06-11!; "ggggy年M月d日")  //明治元年潤4月21日
$test:=$CalendarJp.String(!1989-01-07!; "g.y年M月d日")  //S.64年1月7日
$test:=$CalendarJp.String(!1989-01-08!; "ggy年M月d日")  //平元年1月8日
$test:=$CalendarJp.String(!2019-04-30!; "gggy年M月d日")  //㍻31年4月30日
$test:=$CalendarJp.String(!2019-05-01!; "ggggy年M月d日")  //令和元年5月1日
