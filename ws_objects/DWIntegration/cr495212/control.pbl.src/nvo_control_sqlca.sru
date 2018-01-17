$PBExportHeader$nvo_control_sqlca.sru
forward
global type nvo_control_sqlca from transaction
end type
end forward

global type nvo_control_sqlca from transaction
end type
global nvo_control_sqlca nvo_control_sqlca

on nvo_control_sqlca.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_control_sqlca.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

