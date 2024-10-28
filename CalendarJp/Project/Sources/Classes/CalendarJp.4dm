shared singleton Class constructor()
	
	var $settings : Collection:=[]
	
	$settings.push(cs:C1710._EraSettings.new(1; "明治"; "M"; "㍾"; 45; 1867; 1; 1; 7; 30))
	$settings.push(cs:C1710._EraSettings.new(2; "大正"; "T"; "㍽"; 15; 1911; 7; 30; 12; 25))
	$settings.push(cs:C1710._EraSettings.new(3; "昭和"; "S"; "㍼"; 64; 1925; 12; 25; 1; 7))
	$settings.push(cs:C1710._EraSettings.new(4; "平成"; "H"; "㍻"; 31; 1988; 1; 8; 4; 30))
	$settings.push(cs:C1710._EraSettings.new(5; "令和"; "R"; "㋿"; 0; 2018; 5; 1; 12; 31))
	
	This:C1470._settings:=$settings.reverse().copy(ck shared:K85:29)
	
	Use (This:C1470)
		//meiji information
		This:C1470._startsOfYear:=[!1868-01-25!; !1869-02-11!; !1870-02-01!; !1871-02-19!; !1872-02-09!].reverse().copy(ck shared:K85:29)
		This:C1470._meijiShortMonths1:=[1; 4; 5; 7; 8; 10; 13].copy(ck shared:K85:29)
		This:C1470._meijiShortMonths2:=[4; 5; 7; 8; 10].copy(ck shared:K85:29)
		This:C1470._meijiShortMonths3:=[1; 4; 6; 8; 10; 11; 13].copy(ck shared:K85:29)
		This:C1470._meijiShortMonths4:=[3; 6; 8; 10; 11].copy(ck shared:K85:29)
		This:C1470._meijiShortMonths5:=[1; 3; 6; 9; 11].copy(ck shared:K85:29)
	End use 
	
Function convertFromGregorian($date : Date) : Object
	
	var $dateJp : cs:C1710._DateJp
	$dateJp:=cs:C1710._DateJp.new($date)
	var $eraSettings : cs:C1710._EraSettings
	
	Case of 
		: ($dateJp.year<1868)  //before meiji
			return 
		: ($dateJp.year<1873)  //meiji, lunar calendar
			$eraSettings:=This:C1470._settings.last()
			$dateJp.era:=$eraSettings
			$dateJp.year:=5
			var $startOfYear : Date
			For each ($startOfYear; This:C1470._startsOfYear)
				If ($date>=$startOfYear)
					break
				End if 
				$dateJp.year-=1
			End for each 
			var $month; $dayNumber; $meijiMonthLength : Integer
			Repeat 
				$month+=1
				$meijiMonthLength:=This:C1470._meijiMonthLength($dateJp.year; $month)
				$dayNumber+=$meijiMonthLength
			Until (Add to date:C393($startOfYear; 0; 0; $dayNumber)>$date) || ($month>14)
			$dateJp.day:=$date-Add to date:C393($startOfYear; 0; 0; $dayNumber-$meijiMonthLength)+1
			$dateJp.month:=$month
			Case of 
				: ($dateJp.year=1) && ($dateJp.month>=5)
					$dateJp.isLeapMonth:=($dateJp.month=5)
					$dateJp.month-=1
				: ($dateJp.year=3) && ($dateJp.month>=11)
					$dateJp.isLeapMonth:=($dateJp.month=11)
					$dateJp.month-=1
			End case 
		Else 
			var $firstDate; $lastDate : Date
			For each ($eraSettings; This:C1470._settings)
				If ($dateJp.year>$eraSettings.offsetToGregorian)
					$firstDate:=Add to date:C393(!00-00-00!; $eraSettings.offsetToGregorian+1; $eraSettings.firstMonth; $eraSettings.firstDay)
					If ($eraSettings.maxYear=0)  //current era
						If ($date<$firstDate)  //before change
							$eraSettings:=This:C1470._settings.query("index == :1"; $eraSettings.index-1).first()
							$dateJp.year:=$eraSettings.maxYear
							$dateJp.era:=$eraSettings
							break
						Else 
							$dateJp.year-=$eraSettings.offsetToGregorian
							$dateJp.era:=$eraSettings
							break
						End if 
					Else   //finished era
						$lastDate:=Add to date:C393(!00-00-00!; $eraSettings.offsetToGregorian+$eraSettings.maxYear; $eraSettings.lastMonth; $eraSettings.lastDay)
						Case of 
							: ($date>$lastDate)
								$eraSettings:=This:C1470._settings.query("index == :1"; $eraSettings.index+1).first()
								$dateJp.year:=$eraSettings.maxYear
								$dateJp.era:=$eraSettings
								break
							: ($date<$firstDate)
								$eraSettings:=This:C1470._settings.query("index == :1"; $eraSettings.index-1).first()
								$dateJp.year:=$eraSettings.maxYear
								$dateJp.era:=$eraSettings
								break
							Else 
								$dateJp.year-=$eraSettings.offsetToGregorian
								$dateJp.era:=$eraSettings
								break
						End case 
					End if 
				End if 
			End for each 
	End case 
	
	return $dateJp.era#Null:C1517 ? $dateJp : Null:C1517
	
Function _meijiMonthName($year : Integer; $month : Integer) : Text
	
	Case of 
		: ($year=1)
			return This:C1470._meijiMonthNames1[$month]
		: ($year=3)
			return This:C1470._meijiMonthNames3[$month]
		Else 
			return String:C10($month)
	End case 
	
Function _meijiMonthLength($year : Integer; $month : Integer) : Integer
	
	Case of 
		: ($year=5) && ($month=12)
			return 2
		: ($year=1) && (This:C1470._meijiShortMonths1.indexOf($month)#-1)
			return 29
		: ($year=2) && (This:C1470._meijiShortMonths2.indexOf($month)#-1)
			return 29
		: ($year=3) && (This:C1470._meijiShortMonths3.indexOf($month)#-1)
			return 29
		: ($year=4) && (This:C1470._meijiShortMonths4.indexOf($month)#-1)
			return 29
		: ($year=5) && (This:C1470._meijiShortMonths5.indexOf($month)#-1)
			return 29
		: ($year<6)
			return 30
		Else 
			return This:C1470._lastDayNumber(1868+$year; $month)
	End case 
	
Function _lastDayNumber($year : Integer; $month : Integer) : Integer
	
	return Day of:C23(Add to date:C393(!00-00-00!; $year; $month+1; 1)-1)
	
Function String($date : Variant; $format : Text) : Text
	
	Case of 
		: (Value type:C1509($date)=Is date:K8:7)
			
			$dateJp:=This:C1470.convertFromGregorian($date)
			
			If ($dateJp=Null:C1517)
				return String:C10($date; $format)
			Else 
				
				var $stringValue : Text
				$stringValue:=$format
				
				ARRAY LONGINT:C221($pos; 0)
				ARRAY LONGINT:C221($len; 0)
				
				var $g; $y; $M; $d : Text
				
				While (Match regex:C1019("(y{1,})"; $stringValue; 1; $pos; $len))
					$before:=Substring:C12($stringValue; 1; $pos{1}-1)
					$length:=Length:C16(String:C10($dateJp.year))
					$y:="0"*($len{1}>$length ? $len{1} : $length)
					$after:=Substring:C12($stringValue; $pos{1}+$len{1})
					$stringValue:=$before+($dateJp.year=1 ? "元" : String:C10($dateJp.year; $y))+$after
				End while 
				
				While (Match regex:C1019("(M{1,})"; $stringValue; 1; $pos; $len))
					$before:=Substring:C12($stringValue; 1; $pos{1}-1)
					$length:=Length:C16(String:C10($dateJp.month))
					$M:="0"*($len{1}>$length ? $len{1} : $length)
					$after:=Substring:C12($stringValue; $pos{1}+$len{1})
					$stringValue:=$before+($dateJp.isLeapMonth ? "潤" : "")+String:C10($dateJp.month; $M)+$after
				End while 
				
				While (Match regex:C1019("(d{1,})"; $stringValue; 1; $pos; $len))
					$before:=Substring:C12($stringValue; 1; $pos{1}-1)
					$length:=Length:C16(String:C10($dateJp.day))
					
					$d:="0"*($len{1}>$length ? $len{1} : $length)
					
					$after:=Substring:C12($stringValue; $pos{1}+$len{1})
					$stringValue:=$before+String:C10($dateJp.day; $d)+$after
				End while 
				
				//do this last because M (meiji) is a meta character
				While (Match regex:C1019("(g{1,4})"; $stringValue; 1; $pos; $len))
					$before:=Substring:C12($stringValue; 1; $pos{1}-1)
					$g:=Substring:C12($stringValue; $pos{1}; $len{1})
					$after:=Substring:C12($stringValue; $pos{1}+$len{1})
					Case of 
						: ($g="g")
							$stringValue:=$before+$dateJp.era.sign+$after
						: ($g="gg")
							$stringValue:=$before+Substring:C12($dateJp.era.name; 1; 1)+$after
						: ($g="ggg")
							$stringValue:=$before+$dateJp.era.symbol+$after
						: ($g="gggg")
							$stringValue:=$before+$dateJp.era.name+$after
					End case 
				End while 
				
				return $stringValue
			End if 
	End case 
	
	return String:C10($date; $format)