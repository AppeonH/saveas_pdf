$PBExportHeader$nvo_string.sru
forward
global type nvo_string from nonvisualobject
end type
end forward

global type nvo_string from nonvisualobject autoinstantiate
end type

type variables
String is_stringArray[]
end variables

on nvo_string.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_string.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

