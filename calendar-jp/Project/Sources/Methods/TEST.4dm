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

If (OB Instance of:C1731(cs:C1710.UTest.UTest; 4D:C1709.Class))
	
	var $UTest : cs:C1710.UTest.UTest
	$UTest:=cs:C1710.UTest.UTest.new()
	return $UTest.run(OB Entries:C1720(cs:C1710))
	
Else 
	return {show: Formula:C1597(IDLE:C311)}
End if 