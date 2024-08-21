//%attributes = {"invisible":true}
/*
see .github/workflows/run-tests.yml

```yml
env:
  project_path: calendar-jp/Project/calendar-jp.4DProject
  startup_method: test // name of this method
  skip_onstartup: true
  create_data: false
  dataless: true
  data: ''
```

*/

var $UTest : cs:C1710.UTest.UTest
$UTest:=cs:C1710.UTest.UTest.new()
return $UTest.run(OB Entries:C1720(cs:C1710))
