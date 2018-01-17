$PBExportHeader$corbatest.sru
forward
global type corbatest from nonvisualobject
end type
end forward

global type corbatest from nonvisualobject
end type
global corbatest corbatest

forward prototypes
public function string echo (string as_message)
end prototypes

public function string echo (string as_message);
return as_message+"(Invoked by corbatest.echo().....)"

end function

on corbatest.create
call super::create
TriggerEvent( this, "constructor" )
end on

on corbatest.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

