![version](https://img.shields.io/badge/version-20%20R6%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/calendar-jp)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/calendar-jp/total)

switch to [`20.x`](https://github.com/miyako/calendar-jp/tree/no-singleton) branch for 4D 20 LTS compatible version.

# CalendarJp

Support Japanese Calendar

### Compatibility

![version](https://img.shields.io/badge/20%20R6%2B-E23089)

* [string format](https://blog.4d.com/tailored-customization-for-dates-and-times/)

![version](https://img.shields.io/badge/20%20R5%2B-E23089)

*  [shared singleton](https://blog.4d.com/singletons-in-4d/)

## dependencies.json

```json
{
	"dependencies": {
		"CalendarJp": {
			"github": "miyako/CalendarJp",
			"version": "latest"
		}
	}
}
```

## Usage

```4d
var $CalendarJp : cs.CalendarJp.CalendarJp

$CalendarJp:=cs.CalendarJp.CalendarJp.me

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
