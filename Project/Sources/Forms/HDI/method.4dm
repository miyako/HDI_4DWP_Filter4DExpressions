var $license : Boolean


Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$license:=Is license available:C714(4D Write license:K44:2)
		
		If ($license=False:C215)
			
			// The demo cannot be run: missing license
			Form.quit:=True:C214
			OBJECT SET TITLE:C194(*; "BtnDemo"; Localized string("BtnClose"))
			OBJECT SET VISIBLE:C603(*; "TxtLicense"; True:C214)
			
		Else 
			Form.quit:=False:C215
			
		End if 
		
End case 
