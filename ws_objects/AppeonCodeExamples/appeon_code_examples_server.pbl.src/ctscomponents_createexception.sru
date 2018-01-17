$PBExportHeader$ctscomponents_createexception.sru
$PBExportComments$Proxy imported from EAServer via EAServer Proxy generator.
forward
global type ctscomponents_createexception from corbauserexception
end type
end forward

global type ctscomponents_createexception from corbauserexception
end type
global ctscomponents_createexception ctscomponents_createexception

type variables
  public:
    //String		messag
end variables

on ctscomponents_createexception.create
call super::create
TriggerEvent( this, "constructor" )
end on

on ctscomponents_createexception.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

