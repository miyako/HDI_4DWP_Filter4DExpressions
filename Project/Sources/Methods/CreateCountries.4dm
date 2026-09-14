//%attributes = {}
If (Records in table:C83([Countries:1])=0)
	C_TEXT:C284($RootPath_t)
	C_TEXT:C284($XMLPath_t)
	C_TEXT:C284($XMLRef_t)
	C_LONGINT:C283($CountCountries_l)
	C_LONGINT:C283($Loop_l)
	C_TEXT:C284($Value_t)
	C_TEXT:C284($Country_t)
	C_TEXT:C284($Ref_t)
	C_TEXT:C284($FlagPath_t)
	
	$RootPath_t:=Get 4D folder:C485(Current resources folder:K5:16)+"Countries"+Folder separator:K24:12
	$XMLPath_t:=$RootPath_t+"CountryFacts.xml"
	
	
	
	If (Test path name:C476($XMLPath_t)=Is a document:K24:1)
		
		$XMLRef_t:=DOM Parse XML source:C719($XMLPath_t)
		$CountCountries_l:=DOM Count XML elements:C726($XMLRef_t; "country")
		
		ARRAY TEXT:C222($shortname_at; $CountCountries_l)
		ARRAY TEXT:C222($name_at; $CountCountries_l)
		ARRAY TEXT:C222($capital_at; $CountCountries_l)
		ARRAY TEXT:C222($language_at; $CountCountries_l)
		ARRAY TEXT:C222($anthem_at; $CountCountries_l)
		ARRAY TEXT:C222($currency_at; $CountCountries_l)
		ARRAY TEXT:C222($timezone_at; $CountCountries_l)
		ARRAY TEXT:C222($tld_at; $CountCountries_l)
		ARRAY TEXT:C222($callingcode_at; $CountCountries_l)
		ARRAY LONGINT:C221($area_al; $CountCountries_l)
		ARRAY LONGINT:C221($areaposition_al; $CountCountries_l)
		ARRAY LONGINT:C221($inhabitants_al; $CountCountries_l)
		ARRAY LONGINT:C221($inhabitantsposition_al; $CountCountries_l)
		ARRAY PICTURE:C279($Flag_ai; $CountCountries_l)
		
		For ($Loop_l; 1; $CountCountries_l)
			$Country_t:=DOM Get XML element:C725($XMLRef_t; "country"; $Loop_l; $Value_t)
			
			$Ref_t:=DOM Get XML element:C725($Country_t; "shortname"; 1; $shortname_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "name"; 1; $name_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "capital"; 1; $capital_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "language"; 1; $language_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "anthem"; 1; $anthem_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "currency"; 1; $currency_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "timezone"; 1; $timezone_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "tld"; 1; $tld_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "callingcode"; 1; $callingcode_at{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "area"; 1; $area_al{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "areaposition"; 1; $areaposition_al{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "inhabitants"; 1; $inhabitants_al{$Loop_l})
			$Ref_t:=DOM Get XML element:C725($Country_t; "inhabitantsposition"; 1; $inhabitantsposition_al{$Loop_l})
			
		End for 
		
		//Country_Flag.png
		
		For ($Loop_l; 1; $CountCountries_l)
			$FlagPath_t:=$RootPath_t+$shortname_at{$Loop_l}+"_Flag.png"
			If (Test path name:C476($FlagPath_t)=Is a document:K24:1)
				READ PICTURE FILE:C678($FlagPath_t; $Flag_ai{$Loop_l})
			Else 
				TRACE:C157
			End if 
		End for 
		
		
		DOM CLOSE XML:C722($XMLRef_t)
		
		
		TRUNCATE TABLE:C1051([Countries:1])
		ARRAY TO SELECTION:C261(\
			$shortname_at; [Countries:1]ShortName:1; \
			$name_at; [Countries:1]Name:2; \
			$capital_at; [Countries:1]Capital:3; \
			$language_at; [Countries:1]Language:4; \
			$anthem_at; [Countries:1]Anthem:5; \
			$name_at; [Countries:1]Name:2; \
			$currency_at; [Countries:1]Currency:6; \
			$timezone_at; [Countries:1]TimeZone:7; \
			$tld_at; [Countries:1]TLD:8; \
			$callingcode_at; [Countries:1]CallingCode:9; \
			$area_al; [Countries:1]Area:10; \
			$areaposition_al; [Countries:1]AreaPosition:11; \
			$inhabitants_al; [Countries:1]Inhabitants:12; \
			$inhabitantsposition_al; [Countries:1]InhabitantPosition:13; \
			$Flag_ai; [Countries:1]Flag:14)\
			
		
		FLUSH CACHE:C297
		
	End if 
End if 



