//%attributes = {"invisible":true}
var vInfos; vDoc : Object
var bRef; bVal : Boolean
var $path : Text
ARRAY TEXT:C222(safeMeth; 0)



$path:=Get 4D folder:C485(Current resources folder:K5:16)+"HDI_Infos.4wp"

// Load 4D Write Pro document populating the "info" tab
vInfos:=WP Import document:C1318($path)

// Load 4D Write Pro document to be used for "demo" tab
QUERY:C277([Countries:1]; [Countries:1]ShortName:1="Argentina")
$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Argentina.4wp"
vDoc:=WP Import document:C1318($path)

// Add "myMethod" to the list of allowed method
APPEND TO ARRAY:C911(safeMeth; "myMethod")
SET ALLOWED METHODS:C805(safeMeth)

// Show expression values by default (as defined in object property list: show Reference = No)
bRef:=False:C215
bVal:=True:C214

