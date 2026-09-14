//%attributes = {"invisible":true,"published4DMobile":{"scope":"table","table":"Countries"}}
#DECLARE($name : Text)->$result : Object

QUERY:C277([Countries:1]; [Countries:1]Name:2=$name+"@")
$result:=_O_Mobile Return selection:C1315([Countries:1])

