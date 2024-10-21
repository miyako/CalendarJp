![version](https://img.shields.io/badge/version-20%2B-E23089)
[![license](https://img.shields.io/github/license/miyako/calendar-jp)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/calendar-jp/total)

# CalendarJp

Support Japanese Calendar

## dependencies.json

```json
{
	"dependencies": {
		"calendar-jp": {
			"github": "miyako/calendar-jp",
			"version": "^0.0.20"
		}
	}
}
```

the `0.x.x` series is for no-singleton branch.

## Usage

```4d
var $CalendarJp : cs.CalendarJp.CalendarJp

$CalendarJp:=cs.CalendarJp.CalendarJp.new()

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
```
