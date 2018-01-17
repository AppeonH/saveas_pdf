$PBExportHeader$ctscomponents_removeexception.sru
$PBExportComments$Proxy imported from EAServer via EAServer Proxy generator.
forward
global type ctscomponents_removeexception from corbauserexception
end type
end forward

global type ctscomponents_removeexception from corbauserexception
end type
global ctscomponents_removeexception ctscomponents_removeexception

type variables
  public:
    //String		messag
end variables

on ctscomponents_removeexception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ctscomponents_removeexception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

